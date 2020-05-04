-- basicoperations.adb

with Ada.Text_IO;

procedure Basic_Operations is
   TestInteger: Integer := 7;
   TestNatural: Natural := 0;
   TestPositive: Positive := 1;
begin
   -- some basic operations on the Integer
   TestInteger := TestInteger - 14;
   Ada.Text_IO.Put_Line ("Integer = " & Integer'Image (TestInteger));
   
   -- some basic operations on the Natural
   TestNatural := TestNatural + 25;
   Ada.Text_IO.Put_Line ("TestMNatural = " & Natural'Image (TestNatural));
   
   -- some basic operations on the Positive
   TestPositive := TestPositive + 8;
   Ada.Text_IO.Put_Line ("TestPositive = " & Positive'Image (TestPositive));
end Basic_Operations;
