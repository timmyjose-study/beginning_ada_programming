with Ada.Text_IO;
with Ada.Strings.Fixed;

procedure Line_By_Line is
  File_Name: String := "line_by_line.adb";
  File: Ada.Text_IO.File_Type;
  Line_Count: Natural := 0;
begin
  Ada.Text_IO.Open (File => file, Mode => Ada.Text_IO.In_File, Name => File_Name);

  while not Ada.Text_IO.End_Of_File (File) loop
    declare
      Line: String := Ada.Text_IO.Get_Line (File);
    begin
      if Ada.Strings.Fixed.Count (Source => Line, Pattern => "Ada") > 0 then
        Line_Count := Line_Count + 1;
        Ada.Text_IO.Put_Line (Natural'Image (Line_Count) & ": " & Line);
      end if;
    end;
  end loop;
  Ada.Text_IO.Close (File);
end Line_By_Line;