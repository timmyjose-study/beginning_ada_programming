with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
with Calculator;

procedure Calculator_Client is
  Integer1: Integer := 0;
  Integer2: Integer := 0;
  Sum_Integer: Integer := 0;
  Diff_Integer: Integer := 0;
  Prod_Integer: Integer := 0;
  Quot_Integer: Integer := 0;
  Float1: Float := 0.0;
  Float2: Float := 0.0;
  Sum_Float: Float := 0.0;
  Diff_Float: Float := 0.0;
  Prod_Float: Float := 0.0;
  Quot_Float: Float := 0.0;
begin
  Ada.Text_IO.Put_Line ("Enter the first integer: ");
  Ada.Integer_Text_IO.Get (Integer1);
  Ada.Text_IO.Put_Line ("Enter the second integer: ");
  Ada.Integer_Text_IO.Get (Integer2);

  Sum_Integer := Calculator.Addition (Integer1, Integer2);
  Diff_Integer := Calculator.Subtraction (Integer1, Integer2);
  Prod_Integer := Calculator.Multiplication (Integer1, Integer2);
  Quot_Integer := Calculator.Division (Integer1, Integer2);
  Ada.Text_IO.Put_Line ("Sum = " & Integer'Image (Sum_Integer) 
  & ", Diff = " & Integer'Image (Diff_Integer) & ", Prod = " & Integer'Image (Prod_Integer)
  & ", Quot = " & Integer'Image (Quot_Integer));

  Ada.Text_IO.Put_Line ("Enter the first float: ");
  Ada.Float_Text_IO.Get (Float1);
  Ada.Text_IO.Put_Line ("Enter the second float: ");
  Ada.Float_Text_IO.Get (Float2);

  Sum_Float := Calculator.Addition (Float1, Float2);
  Diff_Float := Calculator.Subtraction (Float1, Float2);
  Prod_Float := Calculator.Multiplication (Float1, Float2);
  Quot_Float := Calculator.Division (Float1, Float2);
  Ada.Text_IO.Put ("Sum = ");
  Ada.Float_Text_IO.Put (Sum_Float, Aft => 3, Exp => 0);
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put ("Diff = ");
  Ada.Float_Text_IO.Put (Diff_Float, Aft => 3, Exp => 0);
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put ("Prod = ");
  Ada.Float_Text_IO.Put (Prod_Float, Aft => 3, Exp => 0);
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put ("Quot = ");
  Ada.Float_Text_IO.Put (Quot_Float, Aft => 3, Exp => 0);
end Calculator_Client;