with Ada.Text_IO;
with Animal;

procedure Animal_Main is
  Creature1: Animal.Creature := Animal.Init; -- defaults
  Creature2: Animal.Creature := Animal.Init ("Elephant", 4, 4_000_000, 500);
begin
  Animal.Print_Creature (Creature1);
  Animal.Print_Creature (Creature2);
end Animal_Main;