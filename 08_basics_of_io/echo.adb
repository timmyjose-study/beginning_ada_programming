-- a simple echo implementation

with Ada.Text_IO;

procedure Echo is
begin
  loop
    exit when Ada.Text_IO.End_Of_File;
    declare
      Line: String := Ada.Text_IO.Get_Line;
    begin
      Ada.Text_IO.Put_Line (Line);
    end;
  end loop;
end Echo;