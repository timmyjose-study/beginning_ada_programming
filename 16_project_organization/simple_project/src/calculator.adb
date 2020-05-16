package body Calculator is
   function Add (Val1, Val2 : Integer) return Integer is
   begin
      return Val1 + Val2;
   end Add;

   function Sub (Val1, Val2 : Integer) return Integer is
   begin
      return Val1 - Val2;
   end Sub;

   function Mul (Val1, Val2 : Integer) return Integer is
   begin
      return Val1 * Val2;
   end Mul;

   function Div (Val1, Val2 : Integer) return Integer is
   begin
      if Val2 = 0 then
         return 0;
      else
         return Val1 / Val2;
      end if;
   end Div;
end Calculator;
