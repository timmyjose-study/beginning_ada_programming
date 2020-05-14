with Ada.Text_IO;
with Ada.Strings.Unbounded;

package Shape is
   type Shape is tagged private;

   function Get_Area (S : in Shape) return Float;
   function Get_Perimeter (S : in Shape) return Float;

   procedure Print_Description (S : in Shape);

private

   type Shape is tagged record
      Name : Ada.Strings.Unbounded.Unbounded_String;
   end record;
end Shape;
