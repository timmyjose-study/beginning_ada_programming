package Calc_Time is
   type Time_Rec is private;

   function Init return Time_Rec;

   function Init (Minutes : in Natural) return Time_Rec;

   function Init (Hours, Minutes : in Natural) return Time_Rec;

   function Add_Hours (TR : in Time_Rec; Hours : in Natural) return Time_Rec;
   function Add_Minutes
     (TR : in Time_Rec; Minutes : in Natural) return Time_Rec;
   function Subtract_Hours
     (TR : in Time_Rec; Hours : in Natural) return Time_Rec;
   function Subtract_Minutes
     (TR : in Time_Rec; Minutes : in Natural) return Time_Rec;

   procedure Put (TR : in Time_Rec);
   procedure Put_Line (TR : in Time_Rec);

private

   type Time_Rec is record
      Hours   : Natural := 0;
      Minutes : Natural := 0;
   end record;

   function Get_Minutes (TR : in Time_Rec) return Natural;
end Calc_Time;
