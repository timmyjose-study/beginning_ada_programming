with Ada.Text_IO;

procedure Out_Parametere_Test is
  procedure Increment (Param: in out Integer) is
  begin
    for Idx in 1 .. 10 loop
      Param := Param + 1;
    end loop;
  end Increment;

  Num: Integer := 0;
begin
  Ada.Text_IO.Put_Line ("Before, Num = " & Integer'Image (Num));
  Increment (Num);
  Ada.Text_IO.Put_Line ("After, Num = " & Integer'Image (Num));
end Out_Parametere_Test;