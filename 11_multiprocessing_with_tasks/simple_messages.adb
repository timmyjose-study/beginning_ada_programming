with Ada.Text_IO;

procedure Simple_Messages is
  task type Intro_Task (Serial_Number: Integer) is
    entry Start;
  end Intro_Task;

  task body Intro_Task is
  begin
    accept Start;

    for I in 1 .. 10 loop
      Ada.Text_IO.Put_Line (Integer'Image (Serial_Number));
      delay 0.4;
    end loop;
  end Intro_Task;

  Task_1: Intro_Task (Serial_Number => 1);
  Task_2: Intro_Task (Serial_Number => 2);
  Task_3: Intro_Task (Serial_Number => 3);
begin
  Task_1.Start;
  delay 2.0;
  Task_2.Start;
  delay 1.0;
  Task_3.Start;
end Simple_Messages;