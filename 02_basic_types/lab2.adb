with Ada.Text_IO;

-- x xor y = ~xy + x~y
procedure Lab2 is
  FalseVal: Boolean := False;
  TrueVal: Boolean := True;
begin
  Ada.Text_IO.Put_Line ("False xor False = " & Boolean'Image (((not FalseVal) and FalseVal) or (FalseVal and (not FalseVal))));
  Ada.Text_IO.Put_Line ("False xor True = " & Boolean'Image (((not FalseVal) and TrueVal) or (FalseVal and (not TrueVal))));
  Ada.Text_IO.Put_Line ("True xor False = " & Boolean'Image (((not TrueVal) and FalseVal) or (TrueVal and (not FalseVal))));
  Ada.Text_IO.Put_Line ("True xor True = " & Boolean'Image (((not TrueVal) and TrueVal) or (TrueVal and (not TrueVal))));
end Lab2;