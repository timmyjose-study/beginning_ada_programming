with Ada.Text_IO;

procedure Infinite_Loop is
begin
  loop
    Ada.Text_IO.Put_Line ("Hello from the infinite loop!");
    delay 0.5; -- sleep for half a second
  end loop;
end Infinite_Loop;