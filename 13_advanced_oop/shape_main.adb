with Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Strings.Unbounded;
with Shape.Square;
with Shape.Circle;

procedure Shape_Main is
   S : Shape.Square.Square;
   C : Shape.Circle.Circle;
begin
   S :=
     Shape.Square.Init_Square
       (Name => Ada.Strings.Unbounded.To_Unbounded_String ("Square 1"),
        Side => 10.0);
   Shape.Square.Print_Description (S);
   Ada.Text_IO.New_Line;

   C :=
     Shape.Circle.Init_Circle
       (Name =>
          Ada.Strings.Unbounded.To_Unbounded_String
            ("Circle 1"), A => 3.0, B => 4.0, C => 5.0);
   Shape.Circle.Print_Description (C);
   Ada.Text_IO.New_Line;
end Shape_Main;
