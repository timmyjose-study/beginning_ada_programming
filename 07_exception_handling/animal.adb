with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Finalization;

package body Animal is
  function Init return Creature is
    TempCreature: Creature;
  begin
    TempCreature.Name := Ada.Strings.Unbounded.To_Unbounded_String ("Dog");
    TempCreature.Legs := 4;
    TempCreature.WeightInGms := 20_000;
    TempCreature.HeightInCms := 20;

    return TempCreature;
  end Init;

  function Init (
    Name: String;
    Legs: Natural;
    Weight: Positive;
    Height: Positive
    ) return Creature is

    TempCreature: Creature;
  begin
    TempCreature.Name := Ada.Strings.Unbounded.To_Unbounded_String (Name);

    if Legs > 1000 then
      raise Too_Many_Legs_Exception;
    end if;

    TempCreature.Legs := Legs;
    TempCreature.WeightInGms := Weight;

    if Height > 2000 then
      raise Too_Tall_Exception;
    end if;

    TempCreature.HeightInCms := Height;

    return TempCreature;
  end Init;

  procedure Set_Legs (Creat: in out Creature; Legs: Natural) is
  begin
    Creat.Legs := Legs;
  end Set_Legs;

  procedure Set_Weight (Creat: in out Creature; Weight: Positive) is
  begin
    Creat.WeightInGms := Weight;
  end Set_Weight;

  procedure Set_Height (Creat: in out Creature; Height: Positive) is
  begin
    Creat.HeightInCms := Height;
  end Set_Height;

  function Get_Legs (Creat: in Creature) return Natural is
  begin
    return Creat.Legs;
  end Get_Legs;

  function Get_Weight (Creat: in Creature) return Positive is
  begin
    return Creat.WeightInGms;
  end Get_Weight;

  function Get_Height (Creat: in Creature) return Positive is
  begin
    return Creat.HeightInCms;
  end Get_Height;

  procedure Print_Creature (Creat: in Creature) is
  begin
    Private_Print_Creature (Creat);
  end Print_Creature;

  procedure Private_Print_Creature (Creat: in Creature) is
  begin
    Ada.Text_IO.Put_Line ("Name: " & Ada.Strings.Unbounded.To_String (Creat.Name));
    Ada.Text_IO.Put_Line ("Legs: " & Natural'Image (Creat.Legs));
    Ada.Text_IO.Put_Line ("Weight (gms): " & Positive'Image (Creat.WeightInGms));
    Ada.Text_IO.Put_Line ("Height (cms): " & Positive'Image (Creat.HeightInCms));
    Ada.Text_IO.New_Line (2);
  end Private_Print_Creature;

  overriding procedure Finalize (Creat: in out Creature) is
begin
  Ada.Text_IO.Put_Line ("Resetting values to default...");
  Creat.Name := Ada.Strings.Unbounded.Null_Unbounded_String;
  Creat.Legs := 0;
  Creat.WeightInGms := 1;
  Creat.HeightInCms := 1;
end Finalize;

end Animal;