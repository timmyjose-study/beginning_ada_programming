with Ada.Text_IO;

procedure Enumerated_Types is
   type Robot_Actions is
     (Move_Forward, Turn_Left, Rotate_Left, Turn_Right, Rotate_Right, Stop);

   Bot_State : Robot_Actions := Stop;

   procedure Process_Action (Action : in Robot_Actions) is
   begin
      if Action = Move_Forward then
         Ada.Text_IO.Put_Line ("The robot is moving forward.");
      elsif Action = Turn_Left then
         Ada.Text_IO.Put_Line ("The robot is turning left.");
      elsif Action = Rotate_Left then
         Ada.Text_IO.Put_Line ("The robot is rotating left.");
      elsif Action = Turn_Right then
         Ada.Text_IO.Put_Line ("The robot is turning right.");
      elsif Action = Rotate_Right then
         Ada.Text_IO.Put_Line ("The robot is rotating right.");
      else
         Ada.Text_IO.Put_Line ("The robot is stopped.");
      end if;
   end Process_Action;
begin
   Process_Action (Bot_State);
   Bot_State := Move_Forward;
   Process_Action (Bot_State);
   Bot_State := Turn_Left;
   Process_Action (Bot_State);
   Bot_State := Rotate_Left;
   Process_Action (Bot_State);
   Bot_State := Turn_Right;
   Process_Action (Bot_State);
   Bot_State := Rotate_Right;
   Process_Action (Bot_State);
   Bot_State := Stop;
   Process_Action (Bot_State);
end Enumerated_Types;
