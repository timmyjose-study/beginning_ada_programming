with Ada.Text_IO;
with Ada.Strings.Unbounded;

procedure Display_File is
  File_Name: Ada.Strings.Unbounded.Unbounded_String;
  File: Ada.Text_IO.File_Type;
begin
  Ada.Text_IO.Put_Line ("Enter the filename:");
  File_Name := Ada.Strings.Unbounded.To_Unbounded_String(Ada.Text_IO.Get_Line);
  Ada.Text_IO.Open (File => File, 
  Mode => Ada.Text_IO.In_File, 
  Name => Ada.Strings.Unbounded.To_String(File_Name));

  while not Ada.Text_IO.End_Of_File (File) loop
    declare
      Line: String := Ada.Text_IO.Get_Line (File);
    begin
      Ada.Text_IO.Put_Line (Line);
    end;
  end loop;
  Ada.Text_IO.Close (File);
exception
  when Ada.Text_IO.Name_Error => Ada.Text_IO.Put_Line ("Could not find the file.");
  when others => Ada.Text_IO.Put_Line ("Something went wrong");
end Display_File;