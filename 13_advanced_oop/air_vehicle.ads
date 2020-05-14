-- the "base" package, so to speak

package Air_Vehicle is
  -- the base type
   type Air_Machine is tagged private;

   procedure Print_Description (AM : in Air_Machine);

private
   type Air_Machine is tagged record
      Height               : Natural := 0;
      Weight               : Natural := 0;
      Length               : Natural := 0;
      Width                : Natural := 0;
      Mass                 : Natural := 0;
      Max_Operating_Height : Natural := 0;
      Max_Speed            : Float   := 0.0;
   end record;
end Air_Vehicle;
