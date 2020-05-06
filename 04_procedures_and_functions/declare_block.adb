with Ada.Text_IO;

procedure Declare_Block is
  Counter: Natural := 0;
begin
  Ada.Text_IO.Put_Line ("Right before the declare block, Counter is " & Natural'Image (Counter));

  declare
    Bool: Boolean := True;
  begin
    Counter := 3;
    Ada.Text_IO.Put_Line ("Inside the declare block, Counter is " & Natural'Image (Counter));
    Ada.Text_IO.Put_Line ("Inside the declare block, Bool is " & Boolean'Image (Bool));
  end;

  Ada.Text_IO.Put_Line ("Again, outside the declare block, Counter is " & Natural'Image (Counter));
end Declare_Block;