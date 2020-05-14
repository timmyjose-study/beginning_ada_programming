package body Time is
   function Init_Time
     (Hours : in Natural; Minutes : in Natural) return Time_Rec is
   begin
     declare
       Temp_Rec: Time_Rec;
     begin
       Temp_Rec.Hours := Hours;
       Temp_Rec.Minutes := Minutes;
     return Temp_Rec;
     end;
   end Init_Time;

   procedure Put (TR : in Time_Rec) is
   begin
      Ada.Text_IO.Put
        ("Hours: " & Natural'Image (TR.Hours) & ", Minutes: " &
         Natural'Image (TR.Minutes));
   end Put;

   procedure Put_Line (TR : in Time_Rec) is
   begin
      Put (TR);
      Ada.Text_IO.New_Line;
   end Put_Line;

   function "+" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Time_Rec is
      Temp_Rec      : Time_Rec;
      Total_Minutes : Natural := 0;
   begin
      Total_Minutes    := Get_Minutes (Val1) + Get_Minutes (Val2);
      Temp_Rec.Hours   := Total_Minutes / 60;
      Temp_Rec.Minutes := Total_Minutes rem 60;

      return Temp_Rec;
   end "+";

   function "+" (Val1 : in Time_Rec; Val2 : in Natural) return Time_Rec is
      Temp_Rec      : Time_Rec;
      Total_Minutes : Natural := 0;
   begin
      Total_Minutes    := Get_Minutes (Val1) + Val2;
      Temp_Rec.Hours   := Total_Minutes / 60;
      Temp_Rec.Minutes := Total_Minutes rem 60;

      return Temp_Rec;
   end "+";

   function "+" (Val1 : in Natural; Val2 : in Time_Rec) return Time_Rec is
      Temp_Rec      : Time_Rec;
      Total_Minutes : Natural := 0;
   begin
      Total_Minutes    := Val1 + Get_Minutes (Val2);
      Temp_Rec.Hours   := Total_Minutes / 60;
      Temp_Rec.Minutes := Total_Minutes rem 60;

      return Temp_Rec;
   end "+";

   function "-" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Time_Rec is
      Temp_Rec    : Time_Rec := Val1;
      Net_Minutes : Natural  := 0;
   begin
      if Get_Minutes (Val1) >= Get_Minutes (Val2) then
         Net_Minutes      := Get_Minutes (Val1) - Get_Minutes (Val2);
         Temp_Rec.Hours   := Net_Minutes / 60;
         Temp_Rec.Minutes := Net_Minutes rem 60;
      else
         Ada.Text_IO.Put_Line
           (Ada.Text_IO.Standard_Error, "Error: not enough minutes!");
      end if;

      return Temp_Rec;
   end "-";

   function "-" (Val1 : in Time_Rec; Val2 : in Natural) return Time_Rec is
      Temp_Rec    : Time_Rec := Val1;
      Net_Minutes : Natural  := 0;
   begin
      if Get_Minutes (Val1) >= Val2 then
         Net_Minutes      := Get_Minutes (Val1) - Val2;
         Temp_Rec.Hours   := Net_Minutes / 60;
         Temp_Rec.Minutes := Net_Minutes rem 60;
      else
         Ada.Text_IO.Put_Line
           (Ada.Text_IO.Standard_Error, "Error: not enough minutes!");
      end if;

      return Temp_Rec;
   end "-";

   function "-" (Val1 : in Natural; Val2 : in Time_Rec) return Time_Rec is
      Temp_Rec    : Time_Rec := Val2;
      Net_Minutes : Natural  := 0;
   begin
      if Val1 >= Get_Minutes (Val2) then
         Net_Minutes      := Val1 + Get_Minutes (Val2);
         Temp_Rec.Hours   := Net_Minutes / 60;
         Temp_Rec.Minutes := Net_Minutes rem 60;
      else
         Ada.Text_IO.Put_Line
           (Ada.Text_IO.Standard_Error, "Error: not enough minutes!");
      end if;

      return Temp_Rec;
   end "-";

   function "=" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Boolean is
   begin
      return Get_Minutes (Val1) = Get_Minutes (Val2);
   end "=";

   -- the specification decides the visibility of the function

   function Get_Minutes (TR : in Time_Rec) return Natural is
   begin
      return TR.Hours * 60 + TR.Minutes;
   end Get_Minutes;
end Time;
