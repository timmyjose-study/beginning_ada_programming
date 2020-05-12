with Ada.Text_IO;

procedure Multiple_Tasks is
   task type Simple_Task (Input : Integer);

   -- discriminants are not allowed in the task body
   -- specification, so `Input` is not used here
   task body Simple_Task is
   begin
      for I in 1 .. 15 loop
         Ada.Text_IO.Put_Line ("Hello, " & Integer'Image (Input));
         delay 0.5;
      end loop;
   end Simple_Task;

   Task_1 : Simple_Task (Input => 1);
   Task_2 : Simple_Task (Input => 2);
   Task_3 : Simple_Task (Input => 3);
begin
   null;
end Multiple_Tasks;
