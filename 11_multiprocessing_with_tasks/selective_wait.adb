-- Previously, we had the client handle the logic of choosing between messages.
-- Now we delegate that responsibility to the task body itself, where it belongs.

with Ada.Text_IO;

procedure Selective_Wait is
   task type Comm_Task is
      entry Input (Value : in Integer);
      entry Output (Value : out Integer);
      entry End_Task;
   end Comm_Task;

   task body Comm_Task is
      Internal_Value : Integer := 0;
   begin
      Main_Task_Loop : -- labelled loop
      loop
         select
            accept Input (Value : in Integer) do
               Internal_Value := Value * 2;
            end Input;
         or
            accept Output (Value : out Integer) do
               Value := Internal_Value;
            end Output;
         or
            accept End_Task; -- no do here since no block
            Ada.Text_IO.Put_Line ("Exiting task");
            exit Main_Task_Loop;
         else
            null; -- dummy message handler
         end select;
      end loop Main_Task_Loop;
   end Comm_Task;

   Task_1   : Comm_Task;
   Test_Val : Integer := 10;
begin
   -- client code becomes normal again with the select logic having been moved into the task body
   Task_1.Input (Test_Val);
   Task_1.Output (Test_Val);
   Ada.Text_IO.Put_Line
     ("New value of Test_Val is " & Integer'Image (Test_Val));

   Test_Val := 23;
   Task_1.Output (Test_Val);
   Ada.Text_IO.Put_Line
     ("New value of Test_Val is " & Integer'Image (Test_Val));

   Test_Val := 83;
   Task_1.Input (Test_Val);
   Task_1.Output (Test_Val);
   Ada.Text_IO.Put_Line
     ("New value of Test_Val is " & Integer'Image (Test_Val));

   Task_1.End_Task;
end Selective_Wait;
