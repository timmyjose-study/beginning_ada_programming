-- basictypesranges.adb

with Ada.Text_IO;

procedure Basic_Types_Ranges is
begin
   Ada.Text_IO.Put_Line ("The min value of an Integer is "
                           & Integer'Image (Integer'First)
                           & ", and the maximum value is "
                           & Integer'Image (Integer'Last));
   Ada.Text_IO.Put_Line ("The min value of a Positive is "
                           & Positive'Image (Positive'First)
                           & ", and the maximum value is "
                           & Positive'Image (Positive'Last));
   Ada.Text_IO.Put_Line ("The min value of a Natural is "
                           & Natural'Image (Natural'First)
                           & ", and the maximum value is "
                        & Natural'Image (Natural'Last));
end Basic_Types_Ranges;
