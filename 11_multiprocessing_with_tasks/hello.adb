with Ada.Text_IO;

procedure Hello is
  task type Hello_Task;

  task body Hello_Task is
  begin
    Ada.Text_IO.Put_Line ("Hi!");
    delay 0.3;
  end Hello_Task;

  Task_1: Hello_Task;
begin
  null;
end Hello;
