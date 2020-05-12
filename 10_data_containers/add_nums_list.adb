with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Containers.Doubly_Linked_Lists;

procedure Add_Nums_List is
   package Num_List is new Ada.Containers.Doubly_Linked_Lists
     (Element_Type => Integer);

   Nums : Num_List.List;

   procedure Populate_List (List : in out Num_List.List) is
      N, M : Integer := 0;
   begin
      Ada.Text_IO.Put ("How many numbers do you wish to enter? ");
      Ada.Integer_Text_IO.Get (N);

      for Iter in 1 .. N loop
         Ada.Text_IO.Put ("Enter a number: ");
         Ada.Integer_Text_IO.Get (M);
         Num_List.Append (Container => List, New_Item => M);
      end loop;
   end Populate_List;

   procedure Display_List (Position : Num_List.Cursor) is
   begin
      Ada.Integer_Text_IO.Put (Num_List.Element (Position => Position));
   end Display_List;

   function Calculate_Sum (List : in Num_List.List) return Integer is
      use type Num_List.Cursor;

      Curr_Cursor : Num_List.Cursor := Num_List.First (Container => List);
      Sum         : Integer := Num_List.Element (Position => Curr_Cursor);
   begin
      loop
         Curr_Cursor := Num_List.Next (Position => Curr_Cursor);
         Sum         := Sum + Num_List.Element (Position => Curr_Cursor);

         exit when Curr_Cursor = Num_List.Last (Container => List);
      end loop;
      return Sum;
   end Calculate_Sum;
begin
   Populate_List (Nums);
   Nums.Iterate (Display_List'Access);
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put_Line
     ("The sum of the numbers you entered is " &
      Integer'Image (Calculate_Sum (Nums)));
end Add_Nums_List;
