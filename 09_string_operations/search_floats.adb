with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
with Ada.Float_Text_IO;
with GNAT.Regpat;

procedure Search_Floats is
  Pattern: String := "([0-9]*\.[0-9]+)";
  Text: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
  Compiled_Exp: GNAT.Regpat.Pattern_Matcher := GNAT.Regpat.Compile (Pattern);

  procedure Search_String (
    Compiled_Exp: GNAT.Regpat.Pattern_Matcher;
    String_To_Search: String;
    First: out Positive;
    Last: out Positive
    ) is

    Result: GNAT.Regpat.Match_Array (0 .. 1);
  begin
    GNAT.Regpat.Match (Compiled_Exp, String_To_Search, Result);

    if not GNAT.Regpat."=" (Result (1), GNAT.Regpat.No_Match) then
      First := Result (1).First;
      Last := Result (1).Last;
    else
      Last := String_To_Search'Last; -- no match / stopping condition
    end if;
  end Search_String;
begin
  Ada.Text_IO.Put ("Enter the search string: ");
  Ada.Text_IO.Unbounded_IO.Get_Line (Text);

  declare
    String_Text: String := Ada.Strings.Unbounded.To_String (Text);
    Curr_Pos: Positive := String_Text'First;
    String_First: Positive := String_Text'First;
    String_Last: Positive := String_Text'First;
  begin
    loop
      Search_String (
        Compiled_Exp => Compiled_Exp,
        String_To_Search => String_Text (Curr_Pos .. String_Text'Last),
        First => String_First,
        Last => String_Last
        );

      Curr_Pos := String_Last + 1;
      exit when String_Last = String_Text'Last;
      Ada.Text_IO.Put ("Found float: ");
      Ada.Float_Text_IO.Put (Float'Value (String_Text (String_First .. String_Last)), Aft => 2, Exp => 0);
      Ada.Text_IO.New_Line;
    end loop;
  end;
end Search_Floats;