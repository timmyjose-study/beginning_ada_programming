with Ada.Text_IO;
with Ada.Float_Text_IO;

procedure Records_Example is
  type Car_Record is record
    Num_Oil_Changes: Natural := 0;
    Num_Collisions: Natural := 0;
    Years_Owned: Natural := 0;
    Kilometers: Natural := 0;
    Money_Spent_Maintenance: Float := 0.0;
    Money_Spent_Repairs: Float := 0.0;
    Top_Speed: Float := 0.0;
    Car_Loan_Principal: Float := 0.0;
    Model: String (1 .. 11) := "Porsche 911";
  end record;

  My_Car: Car_Record;
begin
  My_Car.Num_Oil_Changes := 23;
  My_Car.Num_Collisions := 1;
  My_Car.Years_Owned := 3;
  My_Car.Kilometers := 65923;
  My_Car.Money_Spent_Maintenance := 6981.45;
  My_Car.Money_Spent_Repairs := 7200.00;
  My_Car.Top_Speed := 215.0;
  My_Car.Car_Loan_Principal := 1948.97;

  Ada.Text_IO.Put_Line ("Name of car: " & My_Car.Model);
  Ada.Text_IO.Put_Line ("Number of oil changes " & Natural'Image (My_Car.Num_Oil_Changes));
  Ada.Text_IO.Put_Line ("Number of collisions " & Natural'Image (My_Car.Num_Collisions));
  Ada.Text_IO.Put_Line ("Number of years owned " & Natural'Image (My_Car.Years_Owned));
  Ada.Text_IO.Put_Line ("Number of kilometers " & Natural'Image (My_Car.kilometers));
  Ada.Text_IO.Put ("Money spent on maintenance " );
  Ada.Float_Text_IO.Put (My_Car.Money_Spent_Maintenance, Aft => 2, Exp => 0);
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put ("Money spent on repairs ");
  Ada.Float_Text_IO.Put (My_Car.Money_Spent_Repairs, Aft => 2, Exp => 0);
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put ("Top speed ");
  Ada.Float_Text_IO.Put (My_Car.Top_Speed, Aft => 2, Exp => 0);
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put ("Car loan principal " );
  Ada.Float_Text_IO.Put (My_Car.Car_Loan_Principal, Aft => 2, Exp => 0);
  Ada.Text_IO.New_Line;
end Records_Example;