with Ada.Text_IO;

procedure Delay_Communication is
   task type Comm_Task is
      entry Input (Value : in Integer);
      entry Output (Value : out Integer);
   end Comm_Task;

   task body Comm_Task is
      Internal_Value : Integer := 0;
   begin
      loop
         accept Input (Value : in Integer) do
            Internal_Value := Value * 2;
         end Input;

         accept Output (Value : out Integer) do
            Value := Internal_Value;
         end Output;
      end loop;
   end Comm_Task;

   Task_1   : Comm_Task;
   Test_Val : Integer := 10;
begin
   -- exception handling for tasks - delay value is how long to wait for the tasks in the select block to
   -- complete before giving up and continuing
   select
      Task_1.Input (Test_Val);
      Task_1.Output (Test_Val);
   or -- selector - delay applies for either of the tasks
      delay 1.0;
      Ada.Text_IO.Put_Line ("ERROR: The comm task is busy!");
   end select;
   Ada.Text_IO.Put_Line ("The new test value is " & Integer'Image (Test_Val));

   Test_Val := 23;
   select
      Task_1.Input (Test_Val);
      Task_1.Output (Test_Val);
   or
      delay 1.0;
      Ada.Text_IO.Put_Line ("ERROR: The comm task is busy!");
   end select;

   Ada.Text_IO.Put_Line ("The new test value is " & Integer'Image (Test_Val));

   Test_Val := 83;

   select
      Task_1.Output (Test_Val);
   or
      delay 3.0;
      Ada.Text_IO.Put_Line ("ERROR: The comm task is busy!");
   end select;

   select
      Task_1.Input (Test_Val);
      Task_1.Output (Test_Val);
   or
      delay 1.0;
      Ada.Text_IO.Put_Line ("ERROR: The comm task is busy!");
   end select;

   Ada.Text_IO.Put_Line ("The new test value is " & Integer'Image (Test_Val));
end Delay_Communication;
