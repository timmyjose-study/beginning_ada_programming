with Ada.Text_IO;
with Ada.Strings.Unbounded;

procedure Iterative_Palindrome is
  function Reverse_String (Input: String) return String is
    Reversed_String: String (Input'Range);
  begin
    for Index in Input'Range loop
      Reversed_String (Input'Last - Index + Input'First) := Input (Index);
    end loop;
    return Reversed_String;
  end Reverse_String;

  function Check_Palindrome (Input: String) return Boolean is
  begin
    return Reverse_String (Input) = Input;
  end Check_Palindrome;

  String: Ada.Strings.Unbounded.Unbounded_String;
  Result: Boolean;
begin
  String := Ada.Strings.Unbounded.To_Unbounded_String (Ada.Text_IO.Get_Line);
  Result := Check_Palindrome (Ada.Strings.Unbounded.To_String (String));

  case Result is
    when True => Ada.Text_IO.Put_Line ("Palindrome");
    when False => Ada.Text_IO.Put_Line ("Not a palindrome");
  end case;
end Iterative_Palindrome;
