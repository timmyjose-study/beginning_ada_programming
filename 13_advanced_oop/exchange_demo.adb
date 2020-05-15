with Ada.Text_IO;
with Exchange;

procedure Exchange_Demo is
  procedure Swap_Integer is new Exchange.Swap (Integer);
  procedure Swap_Positive is new Exchange.Swap (Positive);
  procedure Swap_Natural is new Exchange.Swap (Natural);

  type My_Custom_Int is new Integer range -5 .. 5;

  procedure Swap_Int is new Exchange.Swap (Swap_Element_T => My_Custom_Int);

  generic 
    type T is private;
    with function Image (Item: in T) return String;
  procedure Print_Swap_Details (Message: String; X, Y: in out T); 

  procedure Print_Swap_Details (Message: String; X, Y: in out T) is
  begin
    Ada.Text_IO.Put (Message & ", X = " & T'Image (X) & ", Y = " & T'Image (Y));
  end Print_Swap_Details; 

  procedure Print_Swap_Details_Int is new Print_Swap_Details (Integer, Image => Integer'Image);
  procedure Print_Swap_Details_Int is new Print_Swap_Details (Natural, Image => Natural'Image);
  procedure Print_Swap_Details_Int is new Print_Swap_Details (Positive, Image => Positive'Image);
  procedure Print_Swap_Details_Int is new Print_Swap_Details (My_Custom_Int, Image => My_Custom_Int'Image);

begin
  declare
    Int_1: Integer := 1;
    Int_2: Integer := 2;
    Pos_1: Positive := 100;
    Pos_2: Positive := 200;
    Nat_1: Natural := 0;
    Nat_2: Natural := 99;
    My_Int_1: My_Custom_Int := -3;
    My_Int_2: My_Custom_Int := 4;
  begin
    Print_Swap_Details_All ("Before swap: ", Int_1, Int_2);
    Swap_Int (Int_1, Int_2);
    Print_Swap_Details_All ("After swap: ", Int_1, Int_2);

    Print_Swap_Details_All ("Before swap: ", Pos_1, Pos_2);
    Swap_Int (Pos_1, Pos_2);
    Print_Swap_Details_All ("After swap: ", Pos_1, Pos_2);

    Print_Swap_Details_All ("Before swap: ", Nat_1, Nat_2);
    Swap_Int (Nat_1, Nat_2);
    Print_Swap_Details_All ("After swap: ", Nat_1, Nat_2);

    Print_Swap_Details_All ("Before swap: ", My_Int_1, My_Int_2);
    Swap_Int (My_Int_1, My_Int_2);
    Print_Swap_Details_All ("After swap: ", My_Int_1, My_Int_2);
  end;
  end Exchange_Demo; 