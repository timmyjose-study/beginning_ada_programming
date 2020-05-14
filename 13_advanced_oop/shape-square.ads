with Ada.Strings.Unbounded;
with Ada.Text_IO;
with Ada.Float_Text_IO;

package Shape.Square is
   type Square is new Shape with private;

   function Init_Square
     (Name : Ada.Strings.Unbounded.Unbounded_String; Side : Float)
      return Square;

   function Get_Area (S : in Square) return Float;
   function Get_Perimeter (S : in Square) return Float;

   procedure Print_Description (S : in Square);

private

   type Square is new Shape with record
      Side : Float := 0.0;
   end record;
end Shape.Square;
