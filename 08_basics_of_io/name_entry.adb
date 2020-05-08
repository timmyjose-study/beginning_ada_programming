with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;

-- the advantage of using Ada.Text_IO.Unbounded_IO is that we don not need to use
-- conversion functions

procedure Name_Entry is
  First_Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
  Last_Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
begin
  Ada.Text_IO.Put_Line ("What is your first name?");
  Ada.Text_IO.Unbounded_IO.Get_Line (First_Name);

  Ada.Text_IO.Put_Line ("What is your last name?");
  Ada.Text_IO.Unbounded_IO.Get_Line (Last_Name);

  Ada.Text_IO.Put ("Nice to meet you, ");
  Ada.Text_IO.Unbounded_IO.Put (First_Name);
  Ada.Text_IO.Put (" ");
  Ada.Text_IO.Unbounded_IO.Put (Last_Name);
  Ada.Text_IO.Put_Line (".");
end Name_Entry;