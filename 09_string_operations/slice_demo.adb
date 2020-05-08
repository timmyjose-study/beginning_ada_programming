with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;

procedure Slice_Demo is
  Example: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String ("I love Ada!");
begin
  Ada.Text_IO.Unbounded_IO.Put_line (Example);
  Ada.Text_IO.Unbounded_IO.Put_line (Ada.Strings.Unbounded.Unbounded_Slice (Example, 1, 1)); 
  Ada.Text_IO.Unbounded_IO.Put_line (Ada.Strings.Unbounded.Unbounded_Slice (Example, 3, 6)); -- inclusive range, 1-indexed, of course
  Ada.Text_IO.Unbounded_IO.Put_Line (Ada.Strings.Unbounded.Unbounded_Slice (Example, 8, 10));
end Slice_Demo;