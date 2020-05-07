with Ada.Strings.Unbounded;
with Ada.Finalization;

package Animal is
  type Creature is new Ada.Finalization.Controlled with private;

  function Init return Creature;

  function Init (
    Name: in String;
    Legs: in Natural;
    Weight: in Positive;
    Height: in Positive
    ) return Creature;

    procedure Print_Creature (Creat: in Creature);

    procedure Set_Legs (Creat: in out Creature; Legs: Natural);
    procedure Set_Weight (Creat: in out Creature; Weight: Positive);
    procedure Set_Height (Creat: in out Creature; Height: Positive);
    function Get_Legs (Creat: in Creature) return Natural;
    function Get_Weight (Creat: in Creature) return Positive;
    function Get_Height (Creat: in Creature) return Positive;

    Too_Many_Legs_Exception : exception;
    Too_Tall_Exception : exception;

    private

    type Creature is new Ada.Finalization.Controlled with record
      Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
      Legs: Natural := 0;
      WeightInGms: Positive := 1;
      HeightInCms: Positive := 1;
    end record;

    procedure Private_Print_Creature (Creat: in Creature);

    overriding procedure Finalize (Creat: in out Creature);
end Animal;