with Ada.Text_IO;

-- This kind of messages passing is fully asynchronous, and therefore depends on a task queue for
-- proper functioning.
procedure Tasks_Communication is
   task type Comm_Task is
      -- the type of messages this task type can receive
      entry Input (Value : in Integer);
      entry Output (Value : out Integer);
   end Comm_Task;

   task body Comm_Task is
      Internal_Value : Integer := 0;
   begin
      loop
         -- the actual "handlers" for all the messages this task type
         -- can receive and process
         -- IMPORTANT - the order in which the accept subprograms are written
         -- defines the order in which the messages are expected to arrive!
         accept Input (Value : in Integer) do
            Internal_Value := Value * 2;
         end Input;

         accept Output (Value : out Integer) do
            Value := Internal_Value;
         end Output;
      end loop;
   end Comm_Task;

-- the task starts running immediately and awaits messages (in the case of this task type)
   Task_1 : Comm_Task;

   Test_Val : Integer := 10;
begin
   -- this is how we pass messages to tasks
   Task_1.Input (Test_Val);
   Task_1.Output (Test_Val);
   Ada.Text_IO.Put_Line ("New test value: " & Integer'Image (Test_Val));

   Test_Val := 23;

   Task_1.Input (Test_Val);
   Task_1.Output (Test_Val);
   Ada.Text_IO.Put_Line ("New test value: " & Integer'Image (Test_Val));

   Test_Val := 83;
   -- this Output message causes the taks to hang - it is expecting an Input message at this stage
   Task_1.Output (Test_Val);

   Task_1.Input (Test_Val);
   Task_1.Input (Test_Val);
   Ada.Text_IO.Put_Line ("New test value: " & Integer'Image (Test_Val));
end Tasks_Communication;
