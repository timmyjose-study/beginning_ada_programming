with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Array_Demo is
  subtype Vals is Integer range 1 .. 100;

  Dim_1: Vals := 1;
  Dim_2: Vals := 1;

  type Matrix_Int_Type is array (Vals range <>, Vals range <>) of Vals;

  package CustomRandom is new Ada.Numerics.Discrete_Random (Result_Subtype => Vals);
  Gen: CustomRandom.Generator;

  function Generate_Next_Random_Value return Vals is
  begin
    CustomRandom.Reset (Gen => Gen);
    return CustomRandom.Random (Gen => Gen);
  end Generate_Next_Random_Value;

  procedure Setup_Matrix (Mat: out Matrix_Int_Type) is 
  begin
    for Idx1 in Mat'Range (1) loop
      for Idx2 in Mat'Range (2) loop
        Mat (Idx1, Idx2) := Generate_Next_Random_Value;
      end loop;
    end loop;
  end Setup_Matrix;

  procedure Display_Matrix (Mat: in Matrix_Int_Type) is 
  begin
    for Idx1 in Mat'Range (1) loop
      for Idx2 in Mat'Range (2) loop
        Ada.Integer_Text_IO.Put (Mat (Idx1, Idx2));
      end loop;
      Ada.Text_IO.New_Line;
    end loop;
  end Display_Matrix;
begin
  Ada.Integer_Text_IO.Get (Dim_1);
  Ada.Integer_Text_IO.Get (Dim_2);

  -- this type must be declared here to be dynamic
  declare
    Matrix: Matrix_Int_Type(1 .. Dim_1, 1..Dim_2) := (others => (others => 1));
  begin
    Setup_Matrix (Matrix);
    Display_Matrix (Matrix);
  end;
end Array_Demo;