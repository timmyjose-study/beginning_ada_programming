with Ada.Text_IO;

procedure Comm_1 is
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
   Task_1.Input (Test_Val);
   Task_1.Output (Test_Val);
   Ada.Text_IO.Put_Line ("Test_Val = " & Integer'Image (Test_Val));

   Test_Val := 23;
   Task_1.Input (Test_Val);
   Task_1.Output (Test_Val);
   Ada.Text_IO.Put_Line ("Test_Val = " & Integer'Image (Test_Val));

   Test_Val := 83;
   Task_1.Output (Test_Val);

end Comm_1;
