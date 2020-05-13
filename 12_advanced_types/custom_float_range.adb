with Ada.Text_IO;

procedure Custom_Float_Range is
  -- delta is the max precision of this type
   type Custom_Float is delta 0.001 range -1.0 .. 1.0;

   Val1 : Custom_Float := 0.001;
   Val2 : Custom_Float := -0.09;
   Val3 : Custom_Float := 0.5;
   Val4 : Custom_Float := -0.005;
   --Val5 : Custom_Float := 2.0; -- won't compile
   --Val6 : Custom_Float := -2.0; -- won't compile
   Val7 : Custom_Float := 0.00001; -- will compile, but set to 0.000
begin
   Ada.Text_IO.Put_Line ("Val1: " & Custom_Float'Image (Val1));
   Ada.Text_IO.Put_Line ("Val2: " & Custom_Float'Image (Val2));
   Ada.Text_IO.Put_Line ("Val3: " & Custom_Float'Image (Val3));
   Ada.Text_IO.Put_Line ("Val4: " & Custom_Float'Image (Val4));
   --Ada.Text_IO.Put_Line ("Val5: " & Float'Image (Val5));
   --Ada.Text_IO.Put_Line ("Val6: " & Float'Image (Val6));
   Ada.Text_IO.Put_Line ("Val7: " & Custom_Float'Image (Val7));
end Custom_Float_Range;
