with Ada.Text_IO;
with Ada.Strings.Unbounded;

procedure Lab3 is
  function Check_Palindrome (Input: String) return Boolean is
  begin
    if Input'Length <= 1 then
      return True;
    else
      return Input (Input'First) = Input (Input'Last) and Check_Palindrome (Input (Input'First + 1 .. Input'Last - 1));
    end if;
  end Check_Palindrome;

  Input: Ada.Strings.Unbounded.Unbounded_String;
  Result: Boolean := False;
begin
  Input := Ada.Strings.Unbounded.To_Unbounded_String (Ada.Text_IO.Get_Line);
  Result := Check_Palindrome (Ada.Strings.Unbounded.To_String (Input));

  case Result is
    when True => Ada.Text_IO.Put_Line ("Palindrome");
    when others => Ada.Text_IO.Put_Line ("Not a palindrome");
  end case;
end Lab3;