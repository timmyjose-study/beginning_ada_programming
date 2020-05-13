with Ada.Text_IO;

procedure Multiple_Hellos is
   task type Message_Task (Identifier : Integer);

   task body Message_Task is
   begin
      for I in 1 .. 5 loop
         Ada.Text_IO.Put
           ("Task " & Integer'Image (Identifier) & " says hi!");
         Ada.Text_IO.New_Line;
         delay 0.3;
      end loop;
   end Message_Task;

   Task_1 : Message_Task (Identifier => 1);
   Task_2 : Message_Task (Identifier => 2);
   Task_3 : Message_Task (Identifier => 3);
begin
   null;
end Multiple_Hellos;
