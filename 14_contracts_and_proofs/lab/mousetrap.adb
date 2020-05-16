package body Mousetrap is
   procedure Simulate is
   begin
      -- for the first iteration
      for Iter in 1 .. 3 loop
         Ada.Text_IO.Put_Line ("For mouse " & Integer'Image (Iter));
         Init_Mousetrap;
         Shut_Door;
         Transfer_Mouse;
         Reset_Trap;
         Ada.Text_IO.New_Line (2);
      end loop;
   end Simulate;

   -- contract functions
   function Trap_Is_Reset return Boolean is
   begin
      return Trap_Reset;
   end Trap_Is_Reset;

   function Mouse_Is_On_Platform return Boolean is
   begin
      return Mouse_On_Platform;
   end Mouse_Is_On_Platform;

   function Door_Is_Shut return Boolean is
   begin
      return Door_Shut;
   end Door_Is_Shut;

   function Mouse_Is_In_Holding_Area return Boolean is
   begin
      return Mouse_In_Holding_Area;
   end Mouse_Is_In_Holding_Area;

   -- the operations of the state machine

   procedure Init_Mousetrap is
   begin
      Mouse_On_Platform := True;
      Ada.Text_IO.Put_Line ("Initialised mousetrap");
   end Init_Mousetrap;

   procedure Shut_Door is
   begin
      Door_Shut := True;
      Ada.Text_IO.Put_Line ("Door shut");
   end Shut_Door;

   procedure Transfer_Mouse is
   begin
      Mouse_In_Holding_Area := True;
      Ada.Text_IO.Put_Line ("Mouse transferred");
   end Transfer_Mouse;

   procedure Reset_Trap is
   begin
      Trap_Reset := True;
      Ada.Text_IO.Put_Line ("Trap reset");
   end Reset_Trap;
end Mousetrap;
