with Ada.Text_IO;
with Ada.Float_Text_IO;

with Geometry_Shapes;
with Calc_Time;

procedure Static_Main is
   Circle_Radius     : Float   := 10.0;
   Sphere_Radius     : Float   := 5.0;
   Square_Side       : Float := 129.2;
   Rectangle_Length  : Float := 10.1;
   Rectangle_Breadth : Float := 20.3;

   Current_Time: Calc_Time.Time_Rec := Calc_Time.Init (Hours => 11, Minutes => 20);
begin
   Ada.Text_IO.Put ("Area of circle of radius 10.0 = ");
   Ada.Float_Text_IO.Put
     (Geometry_Shapes.Circle_Area (Circle_Radius), Aft => 2, Exp => 0);
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put ("Circumference of circle of radius 10.0 = ");
   Ada.Float_Text_IO.Put
     (Geometry_Shapes.Circle_Circumference (Circle_Radius), Aft => 2,
      Exp                                                       => 0);
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put ("Volume of sphere of radius 5.0 = ");
   Ada.Float_Text_IO.Put
     (Geometry_Shapes.Sphere_Volume (Sphere_Radius), Aft => 2, Exp => 0);
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put ("Area of square of side 129.2 = ");
   Ada.Float_Text_IO.Put
     (Geometry_Shapes.Square_Area (Square_Side), Aft => 2, Exp => 0);
   Ada.Text_IO.New_Line;

   Ada.Text_IO.Put ("Area of rectangle of length 10.1 and breadth 20.3 = ");
   Ada.Float_Text_IO.Put
     (Geometry_Shapes.Rectangle_Area (Rectangle_Length, Rectangle_Breadth), Aft => 2, Exp => 0);
   Ada.Text_IO.New_Line;

   Calc_Time.Put_Line (Current_Time);
   Current_Time := Calc_Time.Add_Minutes (Current_Time, 200);
   Calc_Time.Put_Line (Current_Time);

   Current_Time := Calc_Time.Subtract_Hours (Current_Time, 10);
   Calc_Time.Put_Line (Current_Time);

end Static_Main;
