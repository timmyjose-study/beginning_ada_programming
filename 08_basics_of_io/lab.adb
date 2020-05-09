with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;
with Ada.Command_Line;
with Ada.Task_Identification;
with Ada.Characters.Latin_1;

procedure Lab is
  Input_File_Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
  In_File: Ada.Text_IO.File_Type;
  Output_File_Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
  Out_File: Ada.Text_IO.File_Type;

  procedure Exit_Program is
  begin
    Ada.Task_Identification.Abort_Task (Ada.Task_Identification.Current_Task);
  end Exit_Program;
begin
  if Ada.Command_Line.Argument_Count /= 1 then
    Ada.Text_IO.Put_Line ("Usage: " & Ada.Command_Line.Command_Name & " INPUT-FILE");
    Exit_Program;
  end if;

  Input_File_Name := Ada.Strings.Unbounded.To_Unbounded_String (Ada.Command_Line.Argument (1));

  declare
    Line: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
    File_Contents: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
  begin
    Ada.Text_IO.Open (
      file => In_File,
      Mode => Ada.Text_IO.In_File,
      Name => Ada.Strings.Unbounded.To_String (Input_File_Name)
      );
    loop
      exit when Ada.Text_IO.End_Of_File (In_File);

      Line := Ada.Text_IO.Unbounded_IO.Get_Line (In_File);
      Ada.Strings.Unbounded.Append (File_Contents, Line);
      Ada.Strings.Unbounded.Append (File_Contents, Ada.Characters.Latin_1.LF);
    end loop;

    -- modify the contents by appending a new line to the file contents
    Ada.Strings.Unbounded.Append (File_Contents, "This is another line of the file");

    Ada.Text_IO.Put_Line ("Enter the destination file name:");
    Ada.Text_IO.Unbounded_IO.Get_Line (Output_File_Name);

    Ada.Text_IO.Create (
      File => Out_File,
      Mode => Ada.Text_IO.Out_File,
      Name => Ada.Strings.Unbounded.To_String (Output_File_Name)
      );

    -- write the modified contents to the output file
    Ada.Text_IO.Unbounded_IO.Put_Line (
      File => Out_File,
      Item => File_Contents
      );
  exception
    when Ada.Text_IO.Name_Error => 
      begin
        Ada.Text_IO.Put_Line ("Input file not found");
        Exit_Program;
      end;

    when others => 
      begin
        Ada.Text_IO.Put_Line ("Something went wrong while trying to open input file");
        Exit_Program;
      end;
  end;
  Ada.Text_IO.Close (In_File);
  Ada.Text_IO.Close (Out_File);
end Lab;