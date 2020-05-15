package body Exchange is
   procedure Swap (X, Y : in out Swap_Element_T) is
      Temp : Swap_Element_T := X;
   begin
      X := Y;
      Y := Temp;
   end Swap;
end Exchange;
