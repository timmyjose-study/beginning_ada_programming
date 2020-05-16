pragma Assertion_Policy (Check);

with Ada.Text_IO;

package Mousetrap is
   procedure Simulate;

   function Trap_Is_Reset return Boolean;
   function Mouse_Is_On_Platform return Boolean;
   function Mouse_Is_In_Holding_Area return Boolean;
   function Door_Is_Shut return Boolean;

   procedure Init_Mousetrap with
      Post => Mouse_Is_On_Platform;

   procedure Shut_Door with
      Pre  => Mouse_Is_On_Platform,
      Post => Door_Is_Shut;

   procedure Transfer_Mouse with
      Pre  => Door_Is_Shut,
      Post => Mouse_Is_In_Holding_Area;

   procedure Reset_Trap with
      Pre  => Mouse_Is_In_Holding_Area,
      Post => Trap_Is_Reset;

private

   Trap_Reset            : Boolean := False;
   Mouse_On_Platform     : Boolean := False;
   Door_Shut             : Boolean := False;
   Mouse_In_Holding_Area : Boolean := False;
end Mousetrap;
