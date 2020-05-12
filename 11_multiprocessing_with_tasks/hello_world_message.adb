with Ada.Text_IO;
with Ada.Strings.Unbounded;

procedure Hello_World_Message is
  task type Hello_Task (Task_Id: Integer)  is
    entry Start; -- this message needs to be received before the task starts execution
  end Hello_Task;

  task body Hello_Task is
  begin
    accept Start; --- denotes that this task accepts this message
    for I in 1 .. 5 loop
      Ada.Text_IO.Put_Line (Integer'Image(Task_Id) & ": Hello, world!");
      delay 0.2;
    end loop;
  end Hello_Task;

  Task_1: Hello_Task (Task_Id => 1);
  Task_2: Hello_Task (Task_Id => 2);
begin
  -- Task_1 is never sent the Start message, and so it never executes the body but hangs forever
  Task_2.Start;
end Hello_World_Message;