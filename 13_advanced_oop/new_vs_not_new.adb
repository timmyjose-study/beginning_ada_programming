with Ada.Text_IO;

procedure New_Vs_Not_New is
  type Foo is new Integer range 1 .. 10;
  type Bar is range 1 .. 10;

  Foo_1: Foo := 8;
  Bar_1: Bar := 7;
begin
  Ada.Text_IO.Put_Line (Foo'Image (Foo_1));
  Ada.Text_IO.Put_Line (Bar'Image (Bar_1));
end New_Vs_Not_New;