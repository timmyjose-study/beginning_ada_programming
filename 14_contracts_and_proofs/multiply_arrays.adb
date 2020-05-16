package body Multiply_Arrays is
   function Generate_Random_Number return Integer is
   begin
      Custom_Random_Int.Reset (Gen => Custom_Random_Int_Generator);
      return Custom_Random_Int.Random (Gen => Custom_Random_Int_Generator) rem 10000;
   end Generate_Random_Number;

   procedure Init_Array (Arr : in out Int_Array) is
   begin
      for Index in Arr'Range loop
         Arr (Index) := Generate_Random_Number;
      end loop;
   end Init_Array;

   procedure Multiply_Array_By_Two (Arr : in out Int_Array; By: Positive := 2) is
   begin
      for Index in Arr'Range loop
         Arr (Index) := Arr (Index) * By;
      end loop;
   end Multiply_Array_By_Two;

   procedure Print_Array (Arr : in Int_Array) is
   begin
      for Index in Arr'Range loop
         Ada.Text_IO.Put (Integer'Image (Arr (Index)) & " ");
      end loop;
      Ada.Text_IO.New_Line (2);
   end Print_Array;
end Multiply_Arrays;
