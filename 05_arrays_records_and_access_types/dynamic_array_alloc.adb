with Ada.Text_IO;
with Ada.Integer_Text_IO; 
with Ada.Numerics.Discrete_Random;

procedure Dynamic_Array_Alloc is
  Dim_1: Positive := 1;
  Dim_2: Positive := 1;

  -- dynamic array type
  type Matrix_Int_Type is array (Positive range <>, Positive range <>) of Integer;

  package RandomInt is new Ada.Numerics.Discrete_Random (Result_Subtype => Integer);
  Gen: RandomInt.Generator;
begin
  Ada.Integer_Text_IO.Get (Dim_1);
  Ada.Integer_Text_IO.Get (Dim_2);

  RandomInt.Reset (Gen => Gen);

  declare
    Matrix_Int: Matrix_Int_Type (1 .. Dim_1, 1 .. Dim_2) := (others => (others => 0));
  begin
    for Idx1 in Matrix_Int'Range (1) loop
      for Idx2 in Matrix_Int'Range (2) loop
        Matrix_Int (Idx1, Idx2) := RandomInt.Random (Gen => Gen);
      end loop;
    end loop;

    for Idx1 in Matrix_Int'Range (1) loop
      for Idx2 in Matrix_Int'Range (2) loop
        Ada.Integer_Text_IO.Put (Matrix_Int (Idx1, Idx2));
      end loop;
      Ada.Text_IO.New_Line;
    end loop;
    Ada.Text_IO.New_Line (2);
  end;
end Dynamic_Array_Alloc;