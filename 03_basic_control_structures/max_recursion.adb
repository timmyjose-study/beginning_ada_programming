with Ada.Text_IO;
with Ada.Numerics;
with Ada.Numerics.Discrete_Random;
with Ada.Task_Identification;

procedure Max_Recursion is
  Minimum_Val: Integer := 1;
  Maximum_Val: Integer := 100;

  function Generate_Random_Int (Min: in Integer; Max: in Integer) return Integer is
  begin
    if Min >= Max then
      Ada.Task_Identification.Abort_Task (Ada.Task_Identification.Current_Task);
    end if;

    declare
      subtype Vals is Integer range Min .. Max;
      package CustomRandom is new Ada.Numerics.Discrete_Random (Result_Subtype => Vals);
      Gen: CustomRandom.Generator;
      GeneratedNum: Vals := Min;
    begin
      CustomRandom.Reset (Gen => Gen);
      GeneratedNum := CustomRandom.Random (Gen => Gen);

      return Integer (GeneratedNum);
    end;
  end Generate_Random_Int;

  function Count_Tries (Largest: in Integer; Index: in Integer) return Integer is
    Random_Val: Integer := Generate_Random_Int (Minimum_Val, Maximum_Val);
  begin
    if Largest > Random_Val then
      return Count_Tries (Largest, Index + 1);
    else
      return Index;
    end if;
  end Count_Tries;
begin
  Ada.Text_IO.Put_Line ("Maximum number of tries to exceeed 90 = " & Integer'Image (Count_Tries (90, 1)));
end Max_Recursion;