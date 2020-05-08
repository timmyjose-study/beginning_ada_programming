with Ada.Text_IO;
with Ada.Strings.Unbounded;

procedure Write_Record_To_File is
  type Person_Rec is record
    First_Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
    Last_Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
    Age: Natural := 0;
    Sex: Boolean := False;
  end record;

  procedure Write_Record (Rec: in Person_Rec; File_Name: String) is
    File: Ada.Text_IO.File_Type;
  begin
    declare
    begin
      Ada.Text_IO.Open (File => File, Mode => Ada.Text_IO.Out_File, Name => File_Name);
    exception
      when Ada.Text_IO.Name_Error => 
        Ada.Text_IO.Create (file => File, Mode => Ada.Text_IO.Out_File, Name => File_Name);
    end;

    Ada.Text_IO.Put (File => File, Item => Ada.Strings.Unbounded.To_String(Rec.First_Name));
    Ada.Text_IO.Put (File => File, Item => " ");
    Ada.Text_IO.Put_Line (File => File, Item => Ada.Strings.Unbounded.To_String(Rec.Last_Name));

    Ada.Text_IO.Put_Line (File => File, Item => Natural'Image (Rec.Age));

    if Rec.Sex = True then
      Ada.Text_IO.Put_Line (File => File, Item => "Male");
    else 
      Ada.Text_IO.Put_Line (File => File, Item => "Female");
    end if;

    Ada.Text_IO.Close (File);
  end Write_Record;

  John_Doe: Person_Rec;
  Jane_Doe: Person_Rec;
begin
  John_Doe.First_Name := Ada.Strings.Unbounded.To_Unbounded_String ("John");
  John_Doe.Last_Name := Ada.Strings.Unbounded.To_Unbounded_String ("Doe");
  John_Doe.Age := 42;
  John_Doe.Sex := True;

  Jane_Doe.First_Name := Ada.Strings.Unbounded.To_Unbounded_String ("Jane");
  Jane_Doe.Last_Name := Ada.Strings.Unbounded.To_Unbounded_String ("Doe");
  Jane_Doe.Age := 39;
  Jane_Doe.Sex := False;

  Write_Record (John_Doe, "john_doe.txt");
  Write_Record (Jane_Doe, "jane_doe.txt");
end Write_Record_To_File;
