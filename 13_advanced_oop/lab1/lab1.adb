with Ada.Text_IO;
with Time; use Time;

procedure Lab1 is
  Time_1, Time_2: Time_Rec;
  Nat_1, Nat_2: Natural;
begin 
  Time_1 := Init_Time (Hours => 23, Minutes => 59);
  Time_2 := Init_Time (Hours => 11, Minutes => 20);
  Nat_1 := 12;
  Nat_2 := 1289;

  declare
    S1: Time_Rec := Time_1 + Time_2;
    S2: Time_Rec := Time_1 + Nat_1;
    S3: Time_Rec := Nat_2 + Time_1;

    D1: Time_Rec := Time_1 - Time_2;
    D2: Time_Rec := Time_1 - Nat_1;
    D3: Time_Rec := Nat_2 - Time_1;

    P1: Time_Rec := Time_1 * Time_2;

    Q1: Time_Rec := Time_1 / Time_2;
  begin
    Ada.Text_IO.Put ("Time_1 = ");
    Print_Time (Time_1);
    Ada.Text_IO.Put ("Time_2 = " );
    Print_Time (Time_2);
    Ada.Text_IO.Put ("Nat_1 = ");
    Print_Time (Time_1);
    Ada.Text_IO.Put ("Nat_2 = " );
    Print_Time (Time_2);

    Ada.Text_IO.Put ("Time_1 + Time_2  = ");
    Print_Time (S1);

    Ada.Text_IO.Put ("Time_1 + Nat_1  = ");
    Print_Time (S2);

    Ada.Text_IO.Put ("Nat_2 + Time_1  = ");
    Print_Time (S2);

    Ada.Text_IO.Put ("Time_1 + Time_2  = ");
    Print_Time (S1);

    Ada.Text_IO.Put ("Time_1 - Time_2  = ");
    Print_Time (D1);

    Ada.Text_IO.Put ("Time_1 * Time_2  = ");
    Print_Time (P1);

    Ada.Text_IO.Put ("Time_1 / Time_2  = ");
    Print_Time (Q1);
  end;
end Lab1;
