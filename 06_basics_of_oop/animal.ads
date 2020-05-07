with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Finalization;

package Animal is
  -- declare the private type
  type Creature is new Ada.Finalization.Controlled with private;

  -- constructor
  function Init (
    Name: in String;
    Legs: in Natural;
    WeightInGrams: in Positive;
    HeightInCm: in Positive
    ) return Creature;

    -- default constructor
    function Init return Creature;

    procedure Print_Creature (Creat: in out Creature);

    -- getters and setters
    procedure Set_Legs (Creat: in out Creature; Legs: in Natural);
    procedure Set_Weight (Creat: in out Creature; Weight: in Positive);
    procedure Set_Height (Creat: in out Creature; Height: in Positive);
    function Get_Legs (Creat: in out Creature) return Natural;
    function Get_Weight (Creat: in out Creature) return Positive;
    function Get_Height (Creat: in out Creature) return Positive;

    private
    -- the actual record definition of the private type
    type Creature is new Ada.Finalization.Controlled with record
      Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
      Legs: Natural := 0;
      WeightInGrams: Positive := 1;
      HeightInCm: Positive := 1;
    end record;

    -- private version of the display procedure that doesthe actual printing
    procedure Private_Print_Creature (Creat: in out Creature);

    -- destructor - called automatically when the record instance goes out of scope (RAII)
    -- Ada allows only a single destructor to be specified
    overriding procedure Finalize (Creat: in out Creature);
end Animal;