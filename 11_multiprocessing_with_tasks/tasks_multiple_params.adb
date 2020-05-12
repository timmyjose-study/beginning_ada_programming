with Ada.Text_IO;

procedure Tasks_Multiple_Params is
  -- values passed in are read-only (in mode)
   task type Multiple_Task (A : Integer; B : Boolean);

   task body Multiple_Task is
   begin
      for I in 1 .. 10 loop
         Ada.Text_IO.Put_Line (Integer'Image (A) & " : " & Boolean'Image (B));
         delay 0.3;
      end loop;
   end Multiple_Task;
begin
   declare
      Task_1 : Multiple_Task (A => 1, B => True);
      Task_2 : Multiple_Task (A => 2, B => False);
   begin
      null;
   end;
end Tasks_Multiple_Params;
