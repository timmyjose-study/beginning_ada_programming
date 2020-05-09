with Ada.Text_IO;
with GNAT.Regpat; 

procedure Regex_Example is
  Regex_Pattern: String := "([0-9]+)";
  Sample_Text: String := 
    "There are 12 cats in the 1" 
    & " large house on the hill! They're all eating from " 
    & "12 bowls 4 meals a day!";
  Found: Boolean := True;
  String_First: Positive := Sample_Text'First;
  String_Index: Positive := Sample_Text'First;
  String_Last: Positive := 1;

  Compiled_Exp: GNAT.Regpat.Pattern_Matcher := GNAT.Regpat.Compile (Regex_Pattern);

  procedure Search_String (
    Compiled_Regex: in GNAT.Regpat.Pattern_Matcher;
    String_To_Parse: in String;
    First: out Positive;
    Last: out Positive
    ) is
    
    Result: GNAT.Regpat.Match_Array (0 .. 1);
  begin
    GNAT.Regpat.Match (Compiled_Regex, String_To_Parse, Result);
    
    if not GNAT.Regpat."=" (Result (1), GNAT.Regpat.No_Match) then
      First := Result (1).First;
      Last := Result (1).Last;
    else
      Last := String_To_Parse'Last; -- no match
    end if;
  end Search_String;
begin
  loop
    Search_String (
      Compiled_Regex => Compiled_Exp,
      String_To_Parse => Sample_Text (String_Index .. Sample_Text'Last),
      First => String_First,
      Last => String_Last
      );

    String_index := String_Last + 1;
    exit when String_Last = Sample_Text'Last;
    Ada.Text_IO.Put_Line ("Found number: " & Sample_Text (String_First .. String_Last));
  end loop;
end Regex_Example;