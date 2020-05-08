with Ada.Text_IO;

-- possible, but useless without using declare blocks instead
procedure Nested_Begins is
begin
  Ada.Text_IO.Put_Line ("Scope 1");
  begin
    Ada.Text_IO.Put_Line ("Scope 2");
    begin
      Ada.Text_IO.Put_Line ("Scope 3");
    end;
  end;
end Nested_Begins;