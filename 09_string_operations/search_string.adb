with Ada.Text_IO;
with Ada.Strings.Unbounded;

procedure Search_String is
  Example: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String (
    "Hello there! We're having very nice weather today!");
  
  Cursor: Positive := 1;
begin
  Ada.Text_IO.Put_Line ("Position of 'v': " & Natural'Image (Ada.Strings.Unbounded.Index (Example, "v")));
  Ada.Text_IO.Put_Line ("Position of apostrophe: " & Natural'Image (Ada.Strings.Unbounded.Index (Example, "'")));
  Ada.Text_IO.Put_Line ("Position of !: " & Natural'Image (Ada.Strings.Unbounded.Index (Example, "!")));
  Ada.Text_IO.Put_Line ("Position of x: " & Natural'Image (Ada.Strings.Unbounded.Index (Example, "x"))); -- 0 for invalid index

  Cursor := Positive (Ada.Strings.Unbounded.Index (Example, "!")) + 1;
  -- search from one past the index of the first occurrence of the character/substring
  Ada.Text_IO.Put_Line ("Position of the second occurrence of !: " & Natural'Image (Ada.Strings.Unbounded.Index (Example, "!", Cursor)));
end Search_String;