-- this needs to come before any imports

pragma Assertion_Policy (Check);

with Ada.Text_IO;
with Ada.Numerics.Discrete_Random;

package Multiply_Arrays is
   type Int_Array is array (Positive range <>) of Integer;

   package Custom_Random_Int is new Ada.Numerics.Discrete_Random
     (Result_Subtype => Integer);
   Custom_Random_Int_Generator : Custom_Random_Int.Generator;

   function Generate_Random_Number return Integer;

   procedure Init_Array (Arr : in out Int_Array);

   procedure Multiply_Array_By_Two (Arr : in out Int_Array; By: Positive := 2) with
      Post =>
      (for all Index in Arr'Range => Arr (Index) = Arr'Old (Index) * 2);

   procedure Print_Array (Arr : in Int_Array) with
      Pre => (for some Index in Arr'Range => Arr (Index) /= 0);
end Multiply_Arrays;
