with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Containers.Vectors;

procedure Add_Nums_Vector is
   package Num_Vector is new Ada.Containers.Vectors (Index_Type => Positive,
      Element_Type                                              => Integer);

   Nums : Num_Vector.Vector;

   procedure Populate_Vector (Vec : in out Num_Vector.Vector) is
      N, M : Integer := 0;
   begin
      Ada.Text_IO.Put ("How many numbers do you wish to enter? ");
      Ada.Integer_Text_IO.Get (N);

      for Iter in 1 .. N loop
         Ada.Text_IO.Put ("Enter a number: ");
         Ada.Integer_Text_IO.Get (M);
         Num_Vector.Append (Container => Vec, New_Item => M);
      end loop;
   end Populate_Vector;

   procedure Display_Vector (Vec : in Num_Vector.Vector) is
   begin
      for N of Vec loop
         Ada.Integer_Text_IO.Put (N);
      end loop;
      Ada.Text_IO.New_Line;
   end Display_Vector;

   function Calculate_Sum (Vec : in Num_Vector.Vector) return Integer is
      Sum : Integer := 0;
   begin
      for Idx in 1 .. Vec.Length loop
         Sum :=
           Sum +
           Num_Vector.Element (Container => Vec, Index => Positive (Idx));
      end loop;
      return Sum;
   end Calculate_Sum;
begin
   Populate_Vector (Nums);
   Display_Vector (Nums);
   Ada.Text_IO.Put_Line
     ("The sum of the numbers you entered is " &
      Integer'Image (Calculate_Sum (Nums)));
end Add_Nums_Vector;
