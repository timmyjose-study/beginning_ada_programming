with Ada.Numerics;

package body Geometry_Shapes is
   function Circle_Area (Radius : in Float) return Float is
   begin
      return Ada.Numerics.Pi * Radius * Radius;
   end Circle_Area;

   function Circle_Circumference (Radius : in Float) return Float is
   begin
      return 2.0 * Ada.Numerics.Pi * Radius;
   end Circle_Circumference;

   function Square_Area (Side : in Float) return Float is
   begin
      return Side * Side;
   end Square_Area;

   function Rectangle_Area (Length, Breadth : in Float) return Float is
   begin
      return Length * Breadth;
   end Rectangle_Area;

   function Sphere_Volume (Radius : in Float) return Float is
   begin
      return (4.0 / 3.0) * Ada.Numerics.Pi * Radius * Radius * Radius;
   end Sphere_Volume;
end Geometry_Shapes;
