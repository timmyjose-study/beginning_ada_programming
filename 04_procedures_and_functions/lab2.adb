with Ada.Text_IO;
with Ada.Strings.Unbounded;

procedure Lab2 is
  function Check_Palindrome (Input: String) return Boolean is
  begin
    for I in Input'Range loop
      if Input (I) /= Input (Input'Last - I + 1) then
        return False;
      end if;
    end loop;
    return True;
  end Check_Palindrome;

  Input: Ada.Strings.Unbounded.Unbounded_String;
  Result: Boolean := False;
begin
  Input := Ada.Strings.Unbounded.To_Unbounded_String (Ada.Text_IO.Get_Line);
  Result := Check_Palindrome (Ada.Strings.Unbounded.To_String (Input));

  if Result then
    Ada.Text_IO.Put_Line ("Palindrome");
  else 
    Ada.Text_IO.Put_Line ("Not a palindrome");
  end if;
end Lab2;