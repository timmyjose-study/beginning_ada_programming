with Ada.Text_IO;

procedure Character_Demo is
  Char1: Character;
begin
  Ada.Text_IO.Put_Line ("Enter the character:");
  Ada.Text_IO.Get (Char1);
  Ada.Text_IO.Put_Line ("You entered the character " & Char1);
end Character_Demo;