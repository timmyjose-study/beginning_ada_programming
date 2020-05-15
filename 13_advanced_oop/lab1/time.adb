package body Time is
   function Init_Time (Hours, Minutes : in Natural) return Time_Rec is
      TR : Time_Rec;
   begin
      TR.Hours   := Hours;
      TR.Minutes := Minutes;
      return TR;
   end Init_Time;

   procedure Print_Time (TR : in Time_Rec) is
   begin
      Ada.Text_IO.Put_Line
        ("Time { Hours = " & Natural'Image (TR.Hours) & ", Minutes = " &
         Natural'Image (TR.Minutes) & " }");
   end Print_Time;

   function Get_Minutes (TR : in Time_Rec) return Natural is
   begin
      return TR.Hours * 60 + TR.Minutes;
   end Get_Minutes;

   function "+" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Time_Rec is
      Temp          : Time_Rec;
      Total_Minutes : Natural := 0;
   begin
      Total_Minutes := Get_Minutes (Val1) + Get_Minutes (Val2);
      Temp.Hours    := Total_Minutes / 60;
      Temp.Minutes  := Total_Minutes rem 60;
      return Temp;
   end "+";

   function "+" (Val1 : in Time_Rec; Val2 : in Natural) return Time_Rec is
      Temp          : Time_Rec;
      Total_Minutes : Natural := 0;
   begin
      Total_Minutes := Get_Minutes (Val1) + Val2;
      Temp.Hours    := Total_Minutes / 60;
      Temp.Minutes  := Total_Minutes rem 60;
      return Temp;
   end "+";

   function "+" (Val1 : in Natural; Val2 : in Time_Rec) return Time_Rec is
      Temp          : Time_Rec;
      Total_Minutes : Natural := 0;
   begin
      Total_Minutes := Val1 + Get_Minutes (Val2);
      Temp.Hours    := Total_Minutes / 60;
      Temp.Minutes  := Total_Minutes rem 60;
      return Temp;
   end "+";

   function "-" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Time_Rec is
      Temp          : Time_Rec := Val1;
      Total_Minutes : Natural  := 0;
   begin
      if Get_Minutes (Val1) >= Get_Minutes (Val2) then
         Total_Minutes := Get_Minutes (Val1) - Get_Minutes (Val2);
         Temp.Hours    := Total_Minutes / 60;
         Temp.Minutes  := Total_Minutes rem 60;
      else
         Ada.Text_IO.Put_Line
           (Ada.Text_IO.Standard_Error, "Error: value is too small");
      end if;

      return Temp;
   end "-";

   function "-" (Val1 : in Time_Rec; Val2 : in Natural) return Time_Rec is
      Temp          : Time_Rec := Val1;
      Total_Minutes : Natural  := 0;
   begin
      if Get_Minutes (Val1) >= Val2 then
         Total_Minutes := Get_Minutes (Val1) - Val2;
         Temp.Hours    := Total_Minutes / 60;
         Temp.Minutes  := Total_Minutes rem 60;
      else
         Ada.Text_IO.Put_Line
           (Ada.Text_IO.Standard_Error, "Error: value is too small");
      end if;

      return Temp;
   end "-";

   function "-" (Val1 : in Natural; Val2 : in Time_Rec) return Time_Rec is
      Temp          : Time_Rec := Val2;
      Total_Minutes : Natural  := 0;
   begin
      if Val1 >= Get_Minutes (Val2) then
         Total_Minutes := Val1 - Get_Minutes (Val2);
         Temp.Hours    := Total_Minutes / 60;
         Temp.Minutes  := Total_Minutes rem 60;
      else
         Ada.Text_IO.Put_Line
           (Ada.Text_IO.Standard_Error, "Error: value is too small");
      end if;
     
      return Temp;
   end "-";

   function "*" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Time_Rec is
      Temp          : Time_Rec;
      Total_Minutes : Natural := 0;
   begin
      Ada.Text_IO.Put_Line ("Total minutes = " & Natural'Image (Get_Minutes(Val1)));
      Ada.Text_IO.Put_Line ("Total minutes = " & Natural'Image (Get_Minutes(Val2)));
      Total_Minutes := Get_Minutes (Val1) * Get_Minutes (Val2);
      Ada.Text_IO.Put_Line ("Total minutes = " & Natural'Image (Total_Minutes));
      Temp.Hours    := Total_Minutes / 60;
      Temp.Minutes  := Total_Minutes rem 60;
      return Temp;
   end "*";

   function "*" (Val1 : in Time_Rec; Val2 : in Natural) return Time_Rec is
      Temp          : Time_Rec;
      Total_Minutes : Natural := 0;
   begin
      Total_Minutes := Get_Minutes (Val1) * Val2;
      Temp.Hours    := Total_Minutes / 60;
      Temp.Minutes  := Total_Minutes rem 60;
      return Temp;
   end "*";

   function "*" (Val1 : in Natural; Val2 : in Time_Rec) return Time_Rec is
      Temp          : Time_Rec;
      Total_Minutes : Natural := 0;
   begin
      Total_Minutes := Val1 * Get_Minutes (Val2);
      Temp.Hours    := Total_Minutes / 60;
      Temp.Minutes  := Total_Minutes rem 60;
      return Temp;
   end "*";

   function "/" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Time_Rec is
      Temp          : Time_Rec := Val1;
      Total_Minutes : Natural  := 0;
   begin
      if Get_Minutes (Val2) /= 0 then
         Total_Minutes := Get_Minutes (Val1) / Get_Minutes (Val2);
         Temp.Hours    := Total_Minutes / 60;
         Temp.Minutes  := Total_Minutes rem 60;
      else
         Ada.Text_IO.Put_Line
           (Ada.Text_IO.Standard_Error, "Error: divide by zero");
      end if;

      return Temp;
   end "/";

   function "/" (Val1 : in Time_Rec; Val2 : in Natural) return Time_Rec is
      Temp          : Time_Rec := Val1;
      Total_Minutes : Natural  := 0;
   begin
      if Val2 /= 0 then
         Total_Minutes := Get_Minutes (Val1) / Val2;
         Temp.Hours    := Total_Minutes / 60;
         Temp.Minutes  := Total_Minutes rem 60;
      else
         Ada.Text_IO.Put_Line
           (Ada.Text_IO.Standard_Error, "Error: divide by zero");
      end if;

      return Temp;
   end "/";

   function "/" (Val1 : in Natural; Val2 : in Time_Rec) return Time_Rec is
      Temp          : Time_Rec := Val2;
      Total_Minutes : Natural  := 0;
   begin
      if Get_Minutes (Val2) /= 0 then
         Total_Minutes := Val1 / Get_Minutes (Val2);
         Temp.Hours    := Total_Minutes / 60;
         Temp.Minutes  := Total_Minutes rem 60;
      else
         Ada.Text_IO.Put_Line
           (Ada.Text_IO.Standard_Error, "Error: divide by zero");
      end if;

      return Temp;
   end "/";

   function "<" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Boolean is
   begin
      return Get_Minutes (Val1) < Get_Minutes (Val2);
   end "<";

   function ">" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Boolean is
   begin
      return Get_Minutes (Val1) > Get_Minutes (Val2);
   end ">";

   function "=" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Boolean is
   begin
      return Get_Minutes (Val1) = Get_Minutes (Val2);
   end "=";
end Time;
