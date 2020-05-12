with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Infinite_Loop is
   End_Index : Natural := 0;
begin
   Ada.Integer_Text_IO.Get (End_Index);
   for I in 1 .. End_Index loop
      Ada.Text_IO.Put_Line ("This is an infinite loop!");
   end loop;
end Infinite_Loop;
