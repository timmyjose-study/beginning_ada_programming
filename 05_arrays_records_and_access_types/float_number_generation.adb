with Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Numerics.Float_Random;

procedure Float_Number_Generation is
  Gen: Ada.Numerics.Float_Random.Generator;
  Val: Float;
begin
  Ada.Numerics.Float_Random.Reset (Gen => Gen);

  for Idx in 1 .. 100 loop
    Ada.Float_Text_IO.Put (Ada.Numerics.Float_Random.Random (Gen => Gen), Exp => 0);
    Ada.Text_IO.New_Line;
  end loop;
end Float_Number_Generation;