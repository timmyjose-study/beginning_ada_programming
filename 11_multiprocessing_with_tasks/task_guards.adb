with Ada.Text_IO;

procedure Task_Guards is
   task type Comm_Task is
      entry Input (Value : in Integer);
      entry Output (Value : out Integer);
      entry End_Task;
   end Comm_Task;

   task body Comm_Task is
      Internal_Value : Integer := 0;
   begin
      Main_Task_Loop :
      loop
         select
            accept Input (Value : in Integer) do
               Internal_Value := Value * 2;
            end Input;
         or
            -- task guard - only this and accept are allowed as the first line in the select - or - else construct
            when Internal_Value >= 10 =>
            accept Output (Value : out Integer) do
               Value := Internal_Value;
            end Output;
         or
            accept End_Task;
            Ada.Text_IO.Put_Line ("Ending task.");
            exit Main_Task_Loop;
         else
            null;
         end select;
      end loop Main_Task_Loop;
   end Comm_Task;

   Task_1   : Comm_Task;
   Test_Val : Integer := 2;
begin
   Task_1.Input (Test_Val);

   select
      Task_1.Output (Test_Val);
      Ada.Text_IO.Put_Line
        ("The new value of Test_Val is " & Integer'Image (Test_Val));
   or
      delay 2.0;
      Ada.Text_IO.Put_Line
        ("ERROR: The comm task is not responding for value " &
         Integer'Image (Test_Val));
   end select;

   Test_Val := 20;
   Task_1.Input (Test_Val);

   select
      Task_1.Output (Test_Val);
      Ada.Text_IO.Put_Line
        ("The new value of Test_Val is " & Integer'Image (Test_Val));
   or
      delay 2.0;
      Ada.Text_IO.Put_Line
        ("ERROR: The comm task is not responding for value " &
         Integer'Image (Test_Val));
   end select;

   Test_Val := 4;
   Task_1.Input (Test_Val);

   select
      Task_1.Output (Test_Val);
      Ada.Text_IO.Put_Line
        ("The new value of Test_Val is " & Integer'Image (Test_Val));
   or
      delay 2.0;
      Ada.Text_IO.Put_Line
        ("ERROR: The comm task is not responding for value " &
         Integer'Image (Test_Val));
   end select;

   Task_1.End_Task;
end Task_Guards;
