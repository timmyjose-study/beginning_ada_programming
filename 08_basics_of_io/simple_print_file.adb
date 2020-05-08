with Ada.Text_IO;

procedure Simple_Print_File is
  File: Ada.Text_IO.File_Type;
  file_Name: String := "simple_print_file.adb";
begin
  Ada.Text_IO.Open (
    File => File,
    Mode => Ada.Text_IO.In_File,
    Name => File_Name
    );

  loop
    exit when Ada.Text_IO.End_Of_File (File);
    declare
      Line: String := Ada.Text_IO.Get_Line (File);
    begin
      Ada.Text_IO.Put_Line (Line);
    end;
  end loop;
end simple_print_file;