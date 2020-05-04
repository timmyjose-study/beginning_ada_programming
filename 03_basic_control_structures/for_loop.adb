with Ada.Text_IO;

procedure For_Loop is
begin
  Ada.Text_IO.Put ("|");
  for iter in 1 .. 400 loop
    Ada.Text_IO.Put (Positive'Image (iter) & "|");
  end loop;

  Ada.Text_IO.New_Line;
end For_Loop;