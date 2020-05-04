with Ada.Text_IO;
with Ada.Strings.Unbounded;

procedure Length_Of_Input is
  Input: Ada.Strings.Unbounded.Unbounded_String;
begin
  Ada.Text_IO.Put_Line ("Enter the input string:");
  Input := Ada.Strings.Unbounded.To_Unbounded_String(Ada.Text_IO.Get_Line);
  Ada.Text_IO.Put_Line ("Input is " & Ada.Strings.Unbounded.To_String (Input));
  Ada.Text_IO.Put_Line ("Its lengths is " & Natural'Image (Ada.Strings.Unbounded.Length (Input)));
end Length_Of_Input;