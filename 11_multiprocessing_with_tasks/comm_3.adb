with Ada.Text_IO;

procedure Comm_3 is
   task type Comm_Task is
      entry Input (Value : in Integer);
      entry Output (Value : out Integer);
      entry End_Task;
   end Comm_Task;

   task body Comm_Task is
      Internal_Value : Integer := 0;
   begin
      Task_Loop :
      loop
         select
            accept Input (Value : in Integer) do
               Internal_Value := Value * 2;
            end Input;
         or when Internal_Value > 10 =>
            accept Output (Value : out Integer) do
               Value := Internal_Value;
            end Output;
         or
            accept End_Task do
               Ada.Text_IO.Put_Line ("Exiting task!");
            end End_Task;
            exit Task_Loop;
         end select;
      end loop Task_Loop;
   end Comm_Task;

   Task_1   : Comm_Task;
   Test_Val : Integer := 2;
begin
   Task_1.Input (Test_Val);

   select
      Task_1.Output (Test_Val);
      Ada.Text_IO.Put_Line ("Test_Val = " & Integer'Image (Test_Val));
   or
      delay 0.1;
      Ada.Text_IO.Put_Line ("Error! Comm task took too long to respond!");
   end select;

   Test_Val := 10;

   select
      Task_1.Input (Test_Val);
      Task_1.Output (Test_Val);
      Ada.Text_IO.Put_Line ("Test_Val = " & Integer'Image (Test_Val));
   or
      delay 0.1;
      Ada.Text_IO.Put_Line ("Error! Comm task took too long to respond");
   end select;

   Task_1.End_Task;
end Comm_3;
