package body Animal is
  function Init (
    Name: in String;
    Legs: in Natural;
    WeightInGrams: in Positive;
    HeightInCm: in Positive
    ) return Creature is

    TempCreature: Creature;
  begin
    TempCreature.Name := Ada.Strings.Unbounded.To_Unbounded_String (Name);
    TempCreature.Legs := Legs;
    TempCreature.WeightInGrams := WeightInGrams;
    TempCreature.HeightInCm := HeightInCm;

    return TempCreature;
  end Init;

  function Init return Creature is
    TempCreature: Creature;
  begin
    TempCreature.Name := Ada.Strings.Unbounded.To_Unbounded_String ("Dog");
    TempCreature.Legs := 4;
    TempCreature.WeightInGrams := 3000;
    TempCreature.HeightInCm := 40;
    return TempCreature;
  end Init;

  procedure Set_Legs (Creat: in out Creature; Legs: in Natural) is
  begin
    Creat.Legs := Legs;
  end Set_Legs;

  procedure Set_Weight (Creat: in out Creature; Weight: in Positive) is
  begin
    Creat.WeightInGrams := Weight;
  end Set_Weight;

  procedure Set_Height (Creat: in out Creature; Height: in Positive) is 
  begin
    Creat.HeightInCm := Height;
  end Set_Height;

  function Get_Legs (Creat: in out Creature) return Natural is
  begin 
    return Creat.Legs;
  end Get_Legs;

  function Get_Weight (Creat: in out Creature) return Positive is
  begin
    return Creat.WeightInGrams;
  end Get_Weight;

  function Get_Height (Creat: in out Creature) return Positive is
  begin
    return Creat.HeightInCm;
  end Get_Height;

  overriding procedure Finalize (Creat: in out Creature) is
begin
  Ada.Text_IO.Put_Line ("Resetting values to default...");
  Creat.Name := Ada.Strings.Unbounded.Null_Unbounded_String;
  Creat.Legs := 0;
  Creat.WeightInGrams := 1;
  Creat.HeightInCm := 1;
end Finalize;

procedure Print_Creature (Creat: in out Creature) is
begin
  Private_Print_Creature (Creat);
end Print_Creature;

procedure Private_Print_Creature (Creat: in out Creature) is
begin
  Ada.Text_IO.Put_Line ("The animal: ");
  Ada.Text_IO.Put_Line ("    Name: " & Ada.Strings.Unbounded.To_String (Creat.Name));
  Ada.Text_IO.Put_Line ("    Number of legs: " & Natural'Image (Creat.Legs));
  Ada.Text_IO.Put_Line ("    Weight in grams: " & Positive'Image (Creat.WeightInGrams));
  Ada.Text_IO.Put_Line ("    Height in cms: " & Positive'Image (Creat.HeightInCm));
end Private_Print_Creature;
end Animal;