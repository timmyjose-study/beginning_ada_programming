with Ada.Text_IO;
with Time; use Time;

procedure Time_Main is
   T1           : Time_Rec := Init_Time (Hours => 12, Minutes => 23);
   T2           : Time_Rec := Init_Time (Hours => 11, Minutes => 59);
   T1_Plus_T2   : Time_Rec;
   T1_Plus_N1   : Time_Rec;
   T1_Minus_T2  : Time_Rec;
   T1_Minus_N2  : Time_Rec;
   N1           : Natural  := 123;
   N2           : Natural  := 34;
   Current_Time : Time_Rec;
begin
   Ada.Text_IO.Put_Line ("T1 = T1? " & Boolean'Image (T1 = T1));
   Ada.Text_IO.Put_Line ("T1 = T2? " & Boolean'Image (T1 = T2));

   T1_Plus_T2 := T1 + T2;
   Ada.Text_IO.Put ("T1 + T2  = ");
   Put (T1_Plus_T2);
   Ada.Text_IO.New_Line;

   T1_Plus_N1 := T1 + N1;
   Ada.Text_IO.Put ("T1 + N1 = ");
   Put (T1 + N1);
   Ada.Text_IO.New_Line;

   T1_Minus_T2 := T1 - T2;
   Ada.Text_IO.Put ("T1 - T2 = ");
   Put (T1 - T2);
   Ada.Text_IO.New_Line;

   T1_Minus_N2 := T1 - N2;
   Ada.Text_IO.Put ("T1 - N2 = ");
   Put (T1 - N2);
   Ada.Text_IO.New_Line;

   Put_Line (Current_Time);
   Current_Time := "+" (Current_Time, 200);
   Put_Line (Current_Time);
   Current_Time := Current_Time + T1;
   Put_Line (Current_Time);
   Ada.Text_IO.New_Line;
end Time_Main;
