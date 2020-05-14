-- this is a sub-package

with Ada.Text_IO;
with Ada.Float_Text_IO;

package Air_Vehicle.Hotair_Balloon is
   -- the subtype
   type HA_Balloon is new Air_Machine with private;

   function Init_Balloon
     (B_Height               : Natural;
      B_Length               : Natural;
      B_Width                : Natural;
      B_Mass                 : Natural;
      B_Max_Operating_Height : Natural;
      B_Max_Speed            : Float;
      B_Balloon_Volume_M3    : Positive; -- new field
      B_Propane_Volume : in Float -- another new field
   )
      return HA_Balloon;

   procedure Print_Description (HAB : in HA_Balloon);

   private

   type HA_Balloon is new Air_Machine with record
      Balloon_Volume_M3      : Positive;
      Balloon_Propane_Volume : Float;
   end record;
end Air_Vehicle.Hotair_Balloon;
