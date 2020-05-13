with Ada.Text_IO;

procedure Infinite_Hello is
   task type Infinite_Message_Task;

   task body Infinite_Message_Task is
   begin
      loop
         Ada.Text_IO.Put_Line ("Hi!");
         delay 0.5;
      end loop;
   end Infinite_Message_Task;

   Task_1 : Infinite_Message_Task;
begin
   null;
end Infinite_Hello;
