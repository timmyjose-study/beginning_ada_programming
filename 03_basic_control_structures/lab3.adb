with Ada.Text_IO;

procedure Lab3 is
begin
  for iter in 1 .. 10_000 loop
    if iter rem 3 = 0 or
      iter rem 13 = 0 or
      iter rem 23 = 0 then
      Ada.Text_IO.Put (Positive'Image (Iter));
    end if;
  end loop;
  Ada.Text_IO.New_Line;
end Lab3;