with Ada.Text_IO;

procedure Exit_When is
  iter: Natural := 0;
begin
  loop
    Ada.Text_IO.Put_Line ("Hello, " & Natural'Image (iter));
    delay 0.1;
    iter := iter + 1;
    exit when iter > 100;
  end loop;
end Exit_When;