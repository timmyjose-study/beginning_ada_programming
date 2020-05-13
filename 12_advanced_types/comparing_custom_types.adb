with Ada.Text_IO;

procedure Comparing_Custom_Types is
   type Unique_Decimal_1 is range 0 .. 255;
   type UNique_Decimal_2 is range 0 .. 255;

   UD_1_1 : Unique_Decimal_1 := 2;
   UD_1_2 : Unique_Decimal_1 := 2;
   UD_2_1 : UNique_Decimal_2 := 2;
   UD_2_2 : UNique_Decimal_2 := 2;
begin
   -- this line won't compile
   --UD_1_1 := UD_2_1;

   -- this is fine - types in Ada are nominally decided, not structurally
   UD_2_1 := UD_2_2;

   Ada.Text_IO.Put_Line (UNique_Decimal_2'Image (UD_2_1));
end Comparing_Custom_Types;
