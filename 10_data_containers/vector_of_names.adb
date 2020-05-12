with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
with Ada.Containers.Vectors;

procedure Vector_Of_Names is
   use type Ada.Strings.Unbounded.Unbounded_String;

   package Names_Vector_Tracker is new Ada.Containers.Vectors
     (Index_Type   => Positive,
      Element_Type => Ada.Strings.Unbounded.Unbounded_String);

   Names_Vector : Names_Vector_Tracker.Vector;

   procedure Populate_Names (Vec : in out Names_Vector_Tracker.Vector) is
      Continue : Ada.Strings.Unbounded.Unbounded_String :=
        Ada.Strings.Unbounded.Null_Unbounded_String;
   begin
      loop
         exit when Continue = "n" or Continue = "n";

         Ada.Text_IO.Put ("Enter your name: ");
         Vec.Append (New_Item => Ada.Text_IO.Unbounded_IO.Get_Line);

         Ada.Text_IO.Put ("Continue? [y/n]: ");
         Continue := Ada.Text_IO.Unbounded_IO.Get_Line;
      end loop;
   end Populate_Names;

   procedure Display_Names (Vec : in Names_Vector_Tracker.Vector) is
   begin
      for Idx in 1 .. Vec.Length loop
         Ada.Text_IO.Unbounded_IO.Put_Line
           (Vec.Element (Index => Natural (Idx)));
      end loop;
   end Display_Names;
begin
   Populate_Names (Names_Vector);
   Display_Names (Names_Vector);
end Vector_Of_Names;
