with Ada.Text_IO;
with Ada.Float_Text_IO;

with Geometry_Shapes;
with Calc_Time;

procedure Main_Static is
   Radius       : constant Float     := 10.0;
   Current_Time : Calc_Time.Time_Rec :=
     Calc_Time.Init (Hours => 11, Minutes => 45);
begin
   Ada.Text_IO.Put ("Area of a circle of radius 10.0 = ");
   Ada.Float_Text_IO.Put
     (Geometry_Shapes.Circle_Area (Radius), Aft => 2, Exp => 0);

   Ada.Text_IO.Put ("Circumference of a circle of radius 10.0 = ");
   Ada.Float_Text_IO.Put
     (Geometry_Shapes.Circle_Circumference (Radius), Aft => 2, Exp => 0);

   Ada.Text_IO.Put ("Volume of a sphere of radius 10.0 = ");
   Ada.Float_Text_IO.Put
     (Geometry_Shapes.Sphere_Volume (Radius), Aft => 2, Exp => 0);

   Calc_Time.Put_Line (Current_Time);
   Current_Time := Calc_Time.Add_hours (Current_Time, Hours => 3);
   Calc_Time.Put_Line (Current_Time);
   Current_Time := Calc_Time.Subtract_Minutes (Current_Time, Minutes => 200);
   Calc_Time.Put_Line (Current_Time);
end Main_Static;
