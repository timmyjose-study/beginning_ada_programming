with Ada.Text_IO;

procedure Nested_Scopes is
begin
  declare
    Foo: Natural := 100;
  begin
    Ada.Text_IO.Put_Line ("In Scope 1, Foo = " & Natural'Image (Foo));
    declare
      Foo: Integer := -99;
    begin
      Ada.Text_IO.Put_Line ("In Scope 2, Foo = " & Integer'Image (Foo));
      declare
        Foo: Natural := 0;
      begin
        Ada.Text_IO.Put_Line ("In Scope 3, Foo = " & Natural'Image (Foo));
      end;
    end;
  end;
end Nested_Scopes;