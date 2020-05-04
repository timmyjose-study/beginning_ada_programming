-- longerintegers.adb

with Ada.Text_IO;

procedure Longer_Integers is
   TestLI: Long_Long_Integer := 100;
begin
   Ada.Text_IO.Put_Line ("TestLI = " & Long_Long_Integer'Image (TestLI));
   Ada.Text_IO.Put_Line ("Min value of Long Long Integer = "
                           & Long_Long_Integer'Image (Long_Long_Integer'First)
                           & ", and max value = "
                           & Long_Long_Integer'Image (Long_Long_Integer'Last));
end Longer_Integers;

