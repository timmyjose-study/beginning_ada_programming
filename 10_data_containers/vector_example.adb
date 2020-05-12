with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;
with Ada.Containers.Vectors;

procedure Vector_Example is
-- this use clause is required for the package vector type declarationt to work
   use type Ada.Strings.Unbounded.Unbounded_String;

   -- define the vector specialisation
   package SoftWare_Companies_Tracker is new Ada.Containers.Vectors
     (Index_Type   => Positive,
      Element_Type => Ada.Strings.Unbounded.Unbounded_String);

   -- the vector instance
   Software_Companies : SoftWare_Companies_Tracker.Vector;

   procedure Populate_Vector (Vec : in out SoftWare_Companies_Tracker.Vector)
   is
   begin
      Vec.Append
        (New_Item => Ada.Strings.Unbounded.To_Unbounded_String ("Yahoo"));
      Vec.Append
        (New_Item => Ada.Strings.Unbounded.To_Unbounded_String ("Google"));
      Vec.Append
        (New_Item => Ada.Strings.Unbounded.To_Unbounded_String ("Microsoft"));
      Vec.Append
        (New_Item => Ada.Strings.Unbounded.To_Unbounded_String ("Apple"));
      Vec.Append
        (New_Item => Ada.Strings.Unbounded.To_Unbounded_String ("Twitter"));
      Vec.Append
        (New_Item => Ada.Strings.Unbounded.To_Unbounded_String ("Yelp"));
      Vec.Append
        (New_Item => Ada.Strings.Unbounded.To_Unbounded_String ("Tesla"));
      Vec.Append
        (New_Item => Ada.Strings.Unbounded.To_Unbounded_String ("Uber"));
   end Populate_Vector;
begin
   Populate_Vector (Software_Companies);

   -- print using a normal loop
   for Idx in 1 .. Software_Companies.Length loop
      Ada.Text_IO.Unbounded_IO.Put_Line
        (Software_Companies.Element (Index => Positive (Idx)));
   end loop;
   Ada.Text_IO.New_Line (2);
end Vector_Example;
