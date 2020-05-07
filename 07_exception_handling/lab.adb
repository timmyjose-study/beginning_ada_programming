with Ada.Text_IO;
with Animal;

procedure Lab is
  Creature1: Animal.Creature := Animal.Init;
  Creature2: Animal.Creature;
begin
  Animal.Print_Creature (Creature1);

  Creature2 := Animal.Init ("Elephant", 4, 4_000_000, 500);
  Animal.Print_Creature (Creature2);

  declare
    Bad_Creature: Animal.Creature := Animal.Init ("Kakrafoon Tiger", 11000, 20_000_000, 2000);
  begin
    Animal.Print_Creature (Bad_Creature);
  exception
      when Animal.Too_Many_Legs_Exception => Ada.Text_IO.Put_Line ("Way too many legs!");
      when Animal.Too_Tall_Exception => Ada.Text_IO.Put_Line ("Too tall!");
      when others => Ada.Text_IO.Put_Line ("Some other error");
  end;
end Lab;
