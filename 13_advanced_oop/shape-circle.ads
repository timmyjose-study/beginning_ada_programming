with Ada.Strings.Unbounded;
with Ada.Numerics.Elementary_Functions;
with Ada.Float_Text_IO;

package Shape.Circle is
   type Circle is new Shape with private;

   function Init_Circle
     (Name : in Ada.Strings.Unbounded.Unbounded_String; A : in Float;
      B    : in Float; C : in Float) return Circle;

   function Get_Area (C : in Circle) return Float;
   function Get_Perimeter (C : in Circle) return Float;

   procedure Print_Description (C : in Circle);

private

   type Circle is new Shape with record
     A: Float;
     B: Float;
     C: Float;
   end record;

end Shape.Circle;
