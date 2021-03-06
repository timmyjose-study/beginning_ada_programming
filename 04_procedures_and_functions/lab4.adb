with Ada.Text_IO;
with Ada.Task_Identification;
with Ada.Numerics.Discrete_Random;

procedure Lab4 is
  Minimul_Val: Integer := 1;
  Maximum_Val: Integer := 100;

  function Generate_Random_Int (Min: in Integer; Max: in Integer) return Integer is
    subtype Vals is Integer range Min .. Max;
    package CustomRandom is new Ada.Numerics.Discrete_Random (Result_Subtype => Vals);
    Gen: CustomRandom.Generator;
    Generated_Num: Vals := Min;

    procedure Setup_Randomization is
    begin
      CustomRandom.Reset (Gen => Gen);
    end Setup_Randomization;

  begin
    if Min >= Max then
      Ada.Task_Identification.Abort_Task (Ada.Task_Identification.Current_Task);
    end if;

    Setup_Randomization;
    Generated_Num := CustomRandom.Random (Gen => Gen);
    return Integer (Generated_Num);
  end Generate_Random_Int;

  function Count_Tries (Largest: in Integer; Index: in Integer) return Integer is
    Random_Val: Integer := Generate_Random_Int (Minimul_Val, Maximum_Val);
  begin
    if Largest > Random_Val then
      return Count_Tries (Largest, Index + 1);
    else
      return Index;
    end if;
  end Count_Tries;
begin
  Ada.Text_IO.Put_Line ("Maximum number of tries to exceed 90 = " & Integer'Image (Count_Tries (90, 1)));
end Lab4;
