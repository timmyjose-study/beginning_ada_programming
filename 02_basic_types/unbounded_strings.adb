with Ada.Text_IO;
with Ada.Strings.Unbounded;

procedure Unbounded_Strings is
  String1: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String("Hello");
  String2: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String("world!");
begin
  Ada.Text_IO.Put_Line (Ada.Strings.Unbounded.To_String(String1));
  Ada.Strings.Unbounded.Append(String1, String2);
  Ada.Text_IO.Put_Line (Ada.Strings.Unbounded.To_String(String1));
  Ada.Text_IO.Put_Line (Ada.Strings.Unbounded.To_String(String2));
  Ada.Strings.Unbounded.Append(String1, " From Ada!");
  Ada.Text_IO.Put_Line (Ada.Strings.Unbounded.To_String(String1));
  Ada.Text_IO.Put_Line ("String1 length = " & Natural'Image(Ada.Strings.Unbounded.Length(String1)));
  Ada.Text_IO.Put_Line ("String2 length = " & Natural'Image(Ada.Strings.Unbounded.Length(String2)));
end Unbounded_Strings;