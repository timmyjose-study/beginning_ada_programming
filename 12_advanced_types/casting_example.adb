with Ada.Text_IO;

procedure Casting_Example is
   type Custom_Int is range -10 .. 10;

   Val1 : Custom_Int := 0;
   Val2 : Integer    := 9;
   Val3 : Positive   := 1;
   Val4 : Natural    := 0;
begin
   Val1 := Custom_Int (Val2);
   Ada.Text_IO.Put_Line ("Val1 is now " & Custom_Int'Image (Val1));

   Val1 := 8;
   Val3 := Positive (Val1);
   Ada.Text_IO.Put_Line ("Val3 is now " & Positive'Image (Val3));

   Val4 := Positive (Val1); -- okay
   Val4 := Natural (Val1);
   Ada.Text_IO.Put_Line ("Val4 is now " & Natural'Image (Val4));

   -- how to cast when it is not known if the destination type/subtype has a wide enough
   -- range to accommodate the value
   Test_Block :
   declare
   begin
      Val1 := 0;
      Val3 := Positive (Val1);
   exception
      when Constraint_Error =>
         Ada.Text_IO.Put_Line ("The value is out of range!");
      when others =>
         Ada.Text_IO.Put_Line ("Something else went wrong");
   end Test_Block;

   -- Val3 should have its old value, 8
   Ada.Text_IO.Put_Line
     ("For the second time, Val3 is " & Positive'Image (Val3));
end Casting_Example;
