package body Shape.Circle is
   function Init_Circle
     (Name :    Ada.Strings.Unbounded.Unbounded_String; A : in Float;
      B    : in Float; C : in Float) return Circle
   is
      Temp_C : Circle;
   begin
      Temp_C.Name := Name;
      Temp_C.A    := A;
      Temp_C.B    := B;
      Temp_C.C    := C;

      return Temp_C;
   end Init_Circle;

   function Get_Area (C : in Circle) return Float is
      S : Float := (C.A + C.B + C.C) / 2.0;
   begin
      return Ada.Numerics.Elementary_Functions.Sqrt
          (S * (s - C.A) * (s - C.B) * (s - C.C));
   end Get_Area;

   function Get_Perimeter (C : in Circle) return Float is
   begin
      return C.A + C.B + C.C;
   end Get_Perimeter;

   procedure Print_Description (C : in Circle) is
   begin
      Ada.Text_IO.Put
        ("Circle with Name: " & Ada.Strings.Unbounded.To_String (C.Name) &
         " and sides:  ");
      Ada.Float_Text_IO.Put (C.A, Aft => 2, Exp => 0);
      Ada.Text_IO.Put ( ", ");
      Ada.Float_Text_IO.Put (C.B, Aft => 2, Exp => 0);
      Ada.Text_IO.Put (", and ");
      Ada.Float_Text_IO.Put (C.C, Aft => 2, Exp => 0);
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put ("Area = ");
      Ada.Float_Text_IO.Put (Get_Area (C), Aft => 2, Exp => 0);
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put ("Perimeter = ");
      Ada.Float_Text_IO.Put (Get_Perimeter (C), Aft => 2, Exp => 0);
      Ada.Text_IO.New_Line;
   end Print_Description;
end Shape.Circle;
