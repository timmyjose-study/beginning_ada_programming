with Ada.Text_IO;

procedure Cat is
  File_Name: String := "cat.adb";
  File: Ada.Text_IO.File_Type;
begin
  Ada.Text_IO.Open (File => File, Mode => Ada.Text_IO.In_File, Name => File_Name);

  while not Ada.Text_IO.End_Of_File (File) loop
    declare
      Line: String := Ada.Text_IO.Get_Line (File);
    begin
      Ada.Text_IO.Put_Line (Line);
    end;
  end loop;
  Ada.Text_IO.Close (File);
end Cat;