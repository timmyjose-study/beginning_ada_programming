with Ada.Text_IO;

procedure Counter_Demo is
   protected type Protected_Counter is
      entry Store (Value : in Integer);
      entry Fetch (Value : out Integer);
   private
      Counter    : Integer := 0;
      Accessible : Boolean := True;
   end Protected_Counter;

   protected body Protected_Counter is
      entry Store (Value : in Integer) when Accessible is
      begin
         Accessible := False;
         Counter    := Value;
      end Store;

      entry Fetch (Value : out Integer) when not Accessible is
      begin
         Accessible := True;
         Value      := Counter;
      end Fetch;
   end Protected_Counter;

   Counter : Protected_Counter;

   task type Protected_Task (Identifier : Integer) is
      entry Start (Input : in Integer);
      entry Quit;
   end Protected_Task;

   task body Protected_Task is
      Go_Loop           : Boolean := True;
      Task_Custom_Value : Integer := 0;
      Task_Return_Value : Integer := 0;
      Serial_Number     : Integer := Identifier;
   begin
      accept Start (Input : in Integer) do
         Ada.Text_IO.Put_Line
           ("Starting task... " & Integer'Image (Serial_Number));
         Task_Custom_Value := Input;
      end Start;

      while Go_Loop loop
         select
            accept Quit do
               Ada.Text_IO.Put_Line
                 ("Exiting task " & Integer'Image (Serial_Number));
               Go_Loop := False;
            end Quit;
         else
            select
               Counter.Store (Value => Task_Custom_Value);
               delay 0.3;
               Counter.Fetch (Value => Task_Return_Value);
               Ada.Text_IO.Put_Line
                 ("Task " & Integer'Image (Serial_Number) & " got " &
                  Integer'Image (Task_Return_Value));
            or
               delay 0.1;
               Ada.Text_IO.Put_Line ("ERROR! Task did not respond in time...");
            end select;
         end select;
      end loop;
   end Protected_Task;

   Task_1 : Protected_Task (Identifier => 1);
   Task_2 : Protected_Task (Identifier => 2);
   Task_3 : Protected_Task (Identifier => 3);
   Task_4 : Protected_Task (Identifier => 4);
   Task_5 : Protected_Task (Identifier => 5);
   Task_6 : Protected_Task (Identifier => 6);
begin
   Task_1.Start (Input => 1);
   Task_2.Start (Input => 2);
   Task_3.Start (Input => 3);
   Task_4.Start (Input => 4);
   Task_5.Start (Input => 5);
   Task_6.Start (Input => 6);

   delay 0.1;

   Task_1.Quit;
   Task_2.Quit;
   Task_3.Quit;
   Task_4.Quit;
   Task_5.Quit;
   Task_6.Quit;
end Counter_Demo;
