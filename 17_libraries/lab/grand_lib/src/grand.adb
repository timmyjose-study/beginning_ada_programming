with Ada.Numerics.Discrete_Random;
with Ada.Numerics.Float_Random;

package body Grand is
   package Random_Int is new Ada.Numerics.Discrete_Random
     (Result_Subtype => Integer);
   Random_Int_Generator : Random_Int.Generator;

   package Random_Natural is new Ada.Numerics.Discrete_Random
     (Result_Subtype => Natural);
   Random_Natural_Generator : Random_Natural.Generator;

   package Random_Positive is new Ada.Numerics.Discrete_Random
     (Result_Subtype => Positive);
   Random_Positive_Generator : Random_Positive.Generator;

   Random_Float_Generator : Ada.Numerics.Float_Random.Generator;

   function Generate_Random_Integer return Integer is
   begin
      Random_Int.Reset (Gen => Random_Int_Generator);
      return Random_Int.Random (Gen => Random_Int_Generator);
   end Generate_Random_Integer;

   function Generate_Random_Natural return Natural is
   begin
      Random_Natural.Reset (Gen => Random_Natural_Generator);
      return Random_Natural.Random (Gen => Random_Natural_Generator);
   end Generate_Random_Natural;

   function Generate_Random_Positive return Positive is
   begin
      Random_Positive.Reset (Gen => Random_Positive_Generator);
      return Random_Positive.Random (Gen => Random_Positive_Generator);
   end Generate_Random_Positive;

   function Generate_Random_Float return Float is
   begin
      Ada.Numerics.Float_Random.Reset (Gen => Random_Float_Generator);
      return Ada.Numerics.Float_Random.Random (Gen => Random_Float_Generator);
   end Generate_Random_Float;
end Grand;
