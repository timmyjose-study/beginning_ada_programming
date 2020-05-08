with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;

procedure Concat_Strings is
  First_Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String ("Timmy");
  Last_Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String ("Jose");
  Full_Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
begin
  Full_Name := First_Name;
  Ada.Strings.Unbounded.Append (Full_Name, " ");
  Ada.Strings.Unbounded.Append (Full_Name, Last_Name);

  Ada.Text_IO.Unbounded_IO.Put_Line (Full_Name);

  -- slice
  Full_Name := Ada.Strings.Unbounded.Unbounded_Slice (Full_Name, 1, 7);
  Ada.Strings.Unbounded.Append (Full_Name, ".");
  Ada.Text_IO.Unbounded_IO.Put_Line (Full_Name);
end Concat_Strings;