with Ada.Text_IO;
with Ada.Strings.Unbounded;

procedure Reverse_Strings is
  function Reverse_Fixed_Length_String (Input: String) return String is
    Reversed_String: String (Input'Range);
  begin
    for Index in Input'Range loop
      Reversed_String (Input'Last - Index + Input'First) := Input (Index);
    end loop;
    return Reversed_String;
  end Reverse_Fixed_Length_String;

  Input: Ada.Strings.Unbounded.Unbounded_String;
  Reversed: Ada.Strings.Unbounded.Unbounded_String;
begin
  Input := Ada.Strings.Unbounded.To_Unbounded_String (Ada.Text_IO.Get_Line);
  Reversed := Ada.Strings.Unbounded.To_Unbounded_String(Reverse_Fixed_Length_String (Ada.Strings.Unbounded.To_String (Input)));
  Ada.Text_IO.Put_Line (Ada.Strings.Unbounded.To_String (Reversed));
end Reverse_Strings;
