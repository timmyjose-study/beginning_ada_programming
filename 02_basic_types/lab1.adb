with Ada.Text_IO;
with Ada.Float_Text_IO;

procedure Lab1 is
  Oil_Change: Integer := 440;
  Washing_Fluid: Float := 98.40;
  Air_Filter: Integer := 23;
  Fuel1: Float := 800.40;
  Company_Pizza_Luncheon: Float := 71.49;
  Fuel2: Float := 90.01;
  Total: Float := Float(Oil_Change) + Washing_Fluid + Float(Air_Filter) + Fuel1 + Company_Pizza_Luncheon + Fuel2;
begin
  Ada.Text_IO.Put_Line (Integer'Image (Oil_Change) & " " & "Oil Change");
  Ada.Text_IO.Put_Line (Float'Image (Washing_Fluid) & " " & "Washing Fluid");
  Ada.Text_IO.Put_Line (Integer'Image (Air_Filter) & " " & "Air Filter");
  Ada.Text_IO.Put_Line (Float'Image (Fuel1) & " " & "Washing Fluid");
  Ada.Text_IO.Put_Line (Float'Image (Company_Pizza_Luncheon) & " " & "Company Pizza Luncheon");
  Ada.Text_IO.Put_Line (Float'Image (Fuel2) & " " & "Fuel");
  Ada.Float_Text_IO.Put (Total, Exp => 0);
  Ada.Text_IO.Put_Line (" " & "Total");
end Lab1;