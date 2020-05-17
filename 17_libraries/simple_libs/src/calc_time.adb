with Ada.Text_IO;

package body Calc_Time is
   function Init return Time_Rec is
      Temp : Time_Rec;
   begin
      return Temp;
   end Init;

   function Init (Minutes : in Natural) return Time_Rec is
      Temp : Time_Rec;
   begin
      Temp.Hours   := Minutes / 60;
      Temp.Minutes := Minutes rem 60;
      return Temp;
   end Init;

   function Init (Hours, Minutes : in Natural) return Time_Rec is
      Temp : Time_Rec;
   begin
      declare
         Total_Minutes : Natural := Hours * 60 + Minutes;
      begin
         Temp.Hours   := Total_Minutes / 60;
         Temp.Minutes := Total_Minutes rem 60;
      end;
      return Temp;
   end Init;

   function Add_Hours (TR : in Time_Rec; Hours : in Natural) return Time_Rec is
      Temp : Time_Rec;
   begin
      declare
         Total_Minutes : Natural := Get_Minutes (TR) + Hours * 60;
      begin
         Temp.Hours   := Total_Minutes / 60;
         Temp.Minutes := Total_Minutes rem 60;
      end;
      return Temp;
   end Add_Hours;

   function Add_Minutes
     (TR : in Time_Rec; Minutes : in Natural) return Time_Rec
   is
      Temp : Time_Rec;
   begin
      declare
         Total_Minutes : Natural := Get_Minutes (TR) + Minutes;
      begin
         Temp.Hours   := Total_Minutes / 60;
         Temp.Minutes := Total_Minutes rem 60;
      end;
      return Temp;
   end Add_Minutes;

   function Subtract_Hours
     (TR : in Time_Rec; Hours : in Natural) return Time_Rec
   is
      Temp : Time_Rec := TR;
   begin
      if Get_Minutes (TR) >= Hours * 60 then
         declare
            Total_Minutes : Natural := Get_Minutes (TR) - Hours * 60;
         begin
            Temp.Hours   := Total_Minutes / 60;
            Temp.Minutes := Total_Minutes rem 60;
         end;
      end if;
      return Temp;
   end Subtract_Hours;

   function Subtract_Minutes
     (TR : in Time_Rec; Minutes : in Natural) return Time_Rec
   is
      Temp : Time_Rec;
   begin
      if Get_Minutes (TR) >= Minutes then
         declare
            Total_Minutes : Natural := Get_Minutes (TR) - Minutes;
         begin
            Temp.Hours   := Total_Minutes / 60;
            Temp.Minutes := Total_Minutes rem 60;
         end;
      end if;
      return Temp;
   end Subtract_Minutes;

   function Get_Minutes (TR : in Time_Rec) return Natural is
   begin
      return TR.Hours * 60 + TR.Minutes;
   end Get_Minutes;

   procedure Put (TR : in Time_Rec) is
   begin
      Ada.Text_IO.Put
        ("Time_Rec { Hours: " & Natural'Image (TR.Hours) & ", Minutes: " &
         Natural'Image (TR.Minutes) & " }");
   end Put;

   procedure Put_Line (TR : in Time_Rec) is
   begin
      Put (TR);
      Ada.Text_IO.New_Line;
   end Put_Line;
end Calc_Time;
