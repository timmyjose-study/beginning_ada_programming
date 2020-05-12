with Ada.Text_IO;

procedure Hello_World_Task is
   -- the type of the task
   task type Hello_Task;

   -- the actual logic
   task body Hello_Task is
   begin
      for I in 1 .. 15 loop
         Ada.Text_IO.Put_Line (Integer'Image (I) & ": Hello from task!");
         delay 0.3;
      end loop;
   end Hello_Task;

   -- execution begins immediately
   Task_1 : Hello_Task;
begin
  declare
    Task_2: Hello_task;
    Task_3: Hello_task;
  begin
    null;
  end;

  declare 
    Task_4: Hello_task;
  begin
    null;
  end;
end Hello_World_Task;
