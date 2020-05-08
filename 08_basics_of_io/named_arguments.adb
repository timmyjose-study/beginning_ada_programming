with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Named_Arguments is
  function Diff (X, Y: Integer) return Integer is
  begin
    return X - Y;
  end Diff;

  Val1: Integer := 0;
  Val2: Integer := 0;
begin
  Ada.Text_IO.Put_Line ("Enter the first number:");
  Ada.Integer_Text_IO.Get (Val1);

  Ada.Text_IO.Put_Line ("Enter the second number:");
  Ada.Integer_Text_IO.Get (Val2);

  Ada.Text_IO.Put_Line (Integer'Image (Val1) & " - " & Integer'Image (Val2) & " = " & Integer'Image (Diff (Y => Val2, X => Val1)));
end Named_Arguments;