with Ada.Text_IO;

procedure Generic_Methods is
  -- two generic subprograms declared
   
   generic
      type T is range <>;
   procedure Print_Int (Val : in T);

   generic
      type T is range <>;
   function Compute_Sum_Int (Val1 : in T; Val2 : in T) return T;

   -- the definitions
   procedure Print_Int (Val: in T) is
   begin
     Ada.Text_IO.Put_Line (T'Image (Val));
   end Print_Int;

   function Compute_Sum_Int (
     Val1: in T;
     Val2: in T
     ) return T is
   begin
     return Val1 + Val2;
   end Compute_Sum_Int;

   -- reified versions/specialisations of the generic subprograms
   procedure Print_Integer is new Print_Int (Integer);
   procedure Print_Natural is new Print_Int (Natural);
   procedure Print_Positive is new Print_Int (Positive);

   function Compute_Sum_Integer is new Compute_Sum_Int (Integer);
   function Compute_Sum_Natural is new Compute_Sum_Int (Natural);
   function Compute_Sum_Positive is new Compute_Sum_Int (Positive);

   Integer_1: Integer := -11;
   Integer_2: Integer := 20;
   Natural_1: Natural := 0;
   Natural_2: Natural := 100;
   Positive_1: Positive := 10;
   Positive_2: Positive := 12;
begin
  Print_Integer (Integer_1);
  Print_Integer (Integer_2);

  Print_Natural (Natural_1);
  Print_Natural (Natural_2);

  Print_Positive (Positive_1);
  Print_Positive (Positive_2);

  Print_Integer (Compute_Sum_Integer (Integer_1, Integer_2));
  Print_Natural (Compute_Sum_Integer (Natural_1, Natural_2));
  Print_Positive (Compute_Sum_Integer (Positive_1, Positive_2));
end Generic_Methods;
