--- different the the lab idea suggested in the book (which seems to be a mistake)
-- here, the idea is to have a bunch of tasks update a protected counter, and then
-- view the final result, which should be equal to the sum of the numbers each task
-- adds to the protected counter.

with Ada.Text_IO;

procedure Lab is
   protected type Protected_Counter is
      entry Increment (By : in Integer);
      entry View (Result : out Integer);
   private
      Counter    : Integer := 0;
      Accessible : Boolean := True;
   end Protected_Counter;

   protected body Protected_Counter is
      entry Increment (By : in Integer) when Accessible is
      begin
         Accessible := False;
         Counter    := Counter + By;
         Accessible := True;
      end Increment;

      entry View (Result : out Integer) when Accessible is
      begin
         Result := Counter;
      end View;
   end Protected_Counter;

   Counter : Protected_Counter;

   task type Protected_Task (Identifier : Integer) is
      entry Start (Value : in Integer);
      entry Quit;
   end Protected_Task;

   task body Protected_Task is
      Task_Custom_Value : Integer := 0;
   begin
      accept Start (Value : in Integer) do
         Task_Custom_Value := Value;
         Ada.Text_IO.Put_Line
           ("Task " & Integer'Image (Identifier) & " started");
      end Start;

      Counter.Increment (By => Task_Custom_Value);
      accept Quit do
         Ada.Text_IO.Put_Line
           ("Task " & Integer'Image (Identifier) & " is quitting...");
      end Quit;
   end Protected_Task;

   Task_1 : Protected_Task (Identifier => 1);
   Task_2 : Protected_Task (Identifier => 2);
   Task_3 : Protected_Task (Identifier => 3);
   Task_4 : Protected_Task (Identifier => 4);
   Task_5 : Protected_Task (Identifier => 5);
   Task_6 : Protected_Task (Identifier => 6);
begin
   Task_1.Start (Value => 10);
   Task_2.Start (Value => 20);
   Task_3.Start (Value => 30);
   Task_4.Start (Value => 40);
   Task_5.Start (Value => 50);
   Task_6.Start (Value => 60);

   Task_1.Quit;
   Task_2.Quit;
   Task_3.Quit;
   Task_4.Quit;
   Task_5.Quit;
   Task_6.Quit;

   declare
      Result : Integer := 0;
   begin
      Counter.View (Result);
      Ada.Text_IO.Put_Line
        ("Final value of the counter is " & Integer'Image (Result));
   end;
end Lab;
