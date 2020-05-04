-- floatsranges.adb

with Ada.Text_IO;
with Ada.Float_Text_IO;

procedure Floats_Ranges is
   Sum1Float: Float := 53.98;
   Sum2Float: Float := 94.22;
   Total: Float := 0.0;
begin
   Ada.Text_IO.Put_Line ("Min value of a Float = "
                           & Float'Image (Float'First)
                           & ", and the max value is "
                           & Float'Image (Float'Last));
   Total := Sum1Float + Sum2Float;
   Ada.Text_IO.Put_Line ("Sum = " & Float'Image (Total));
   Ada.Float_Text_IO.Put (Total, Exp => 0);
   Ada.Text_IO.New_Line;
   Ada.Float_Text_IO.Put (Total, Exp => 1);
end Floats_Ranges;

   
