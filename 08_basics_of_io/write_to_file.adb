with Ada.Text_IO;
with Ada.Strings.Unbounded;

procedure Write_To_File is
  File_Name: Ada.Strings.Unbounded.Unbounded_String;
  File: Ada.Text_IO.File_Type;
  Buffer: Ada.Strings.Unbounded.Unbounded_String;
begin
  declare
  begin
    Ada.Text_IO.Put_Line ("Enter the filename:");
    File_Name := Ada.Strings.Unbounded.To_Unbounded_String (Ada.Text_IO.Get_Line);
    Ada.Text_IO.Open (
      File => File,
      Mode => Ada.Text_IO.Out_File,
      Name => Ada.Strings.Unbounded.To_String (File_Name)
      );
  exception
    when Ada.Text_IO.Name_Error => 
      Ada.Text_IO.Create (
        file => File,
        Mode => Ada.Text_IO.Out_File,
        Name => Ada.Strings.Unbounded.To_String (File_Name) 
        );
  end;

  loop
    exit when Ada.Text_IO.End_Of_File;
    declare
      Line: String := Ada.Text_IO.Get_Line;
    begin
      Ada.Text_IO.Put_Line (File => File, Item => Line);
    end;
  end loop;

  Ada.Text_IO.Close (File);
end Write_To_File;