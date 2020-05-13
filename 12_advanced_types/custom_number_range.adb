with Ada.Text_IO;

procedure Custom_Number_Range is
  type Unique_Decimal is range 0 .. 255;

  U_Decimal_1: Unique_Decimal := 100; -- okay
  --U_Decimal_2: Unique_Decimal := -12; -- wont' compile
  --U_Decimal_3: Unique_Decimal := 256; -- won't compile either
begin
  Ada.Text_IO.Put_Line ("U_Decimal_1 = " & Unique_Decimal'Image (U_Decimal_1));
end Custom_Number_Range;