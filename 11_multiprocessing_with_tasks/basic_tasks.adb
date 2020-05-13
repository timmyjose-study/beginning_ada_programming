with Ada.Text_IO;

procedure Basic_Tasks is
   task type Simple_Task (Identifier : Integer) is
      entry Start;
   end Simple_Task;

   task body Simple_Task is
   begin
      accept Start do
         Ada.Text_IO.Put_Line
           ("Task " & Integer'Image (Identifier) & " has started");
      end Start;

      for I in 1 .. 10 loop
         Ada.Text_IO.Put
           ("Task " & Integer'Image (Identifier) & " says hello!");
         Ada.Text_IO.New_Line;
         delay 0.4;
      end loop;
   end Simple_Task;

   Task_1 : Simple_Task (Identifier => 1);
   Task_2 : Simple_Task (Identifier => 2);
   Task_3 : Simple_Task (Identifier => 3);
begin
   Task_1.Start;
   Task_2.Start;
   Task_3.Start;
end Basic_Tasks;
