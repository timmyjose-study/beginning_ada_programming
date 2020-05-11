with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Strings.Fixed;
with Ada.Text_IO.Unbounded_IO;

procedure Lab is
  function Get_String return String is
  begin
    return Ada.Text_IO.Get_Line;
  end Get_String;

  function Count_All_Occurrences (
    Main_String: in Ada.Strings.Unbounded.Unbounded_String;
    Sub_String: in Ada.Strings.Unbounded.Unbounded_String
    ) return Natural is
    Count: Natural := 0;
  begin
    declare
      Main_Fixed_String: String := Ada.Strings.Unbounded.To_String (Main_String);
      Sub_Fixed_String: String := Ada.Strings.Unbounded.To_String (Sub_String);
      Start_Idx: Natural :=  Main_Fixed_String'First;
      Idx: Natural := 0; 
    begin
      loop
        exit when Start_Idx >= Main_Fixed_String'Last;

        Idx := Ada.Strings.Fixed.Index (Main_Fixed_String (Start_Idx .. Main_Fixed_String'Last), Sub_Fixed_String);

        if Idx /= 0 then
          Count := Count + 1;
          Start_Idx := Idx + 1;
        else
          Start_Idx := Main_Fixed_String'Last;
        end if;
      end loop;
    end;
    return Count;
  end Count_All_Occurrences;

  function Delete_All_Occurrences (
    Main_String: Ada.Strings.Unbounded.Unbounded_String;
    Sub_String: Ada.Strings.Unbounded.Unbounded_String
    ) return Ada.Strings.Unbounded.Unbounded_String is
    Result_String: Ada.Strings.Unbounded.Unbounded_String := Main_String;
  begin
    declare
      Idx: Natural := 0;
      Sub_Fixed_String: String := Ada.Strings.Unbounded.To_String (Sub_String);
    begin
      loop
        Idx := Ada.Strings.Unbounded.Index (Result_String, Sub_Fixed_String);
        exit when Idx = 0;
        Result_String := Ada.Strings.Unbounded.Delete (Result_String, Idx, Idx + Sub_Fixed_String'Length -1);
      end loop;
    return Result_String;
    end;
  end Delete_All_Occurrences;

  Main_String: Ada.Strings.Unbounded.Unbounded_String;
  Sub_String: Ada.Strings.Unbounded.Unbounded_String;
begin
  Ada.Text_IO.Put ("Enter the main string: ");
  Ada.Text_IO.Unbounded_IO.Get_Line (Main_String);

  Ada.Text_IO.Put ("Enter the sub string: ");
  Ada.Text_IO.Unbounded_IO.Get_Line (Sub_String);

  Ada.Text_IO.Put_Line ("Number of occurrences of the substring in the main string = " 
                        & Natural' Image (Count_All_Occurrences (Main_String, Sub_String)));
  Ada.Text_IO.Put_Line ("Main string with all occurrences of the sub string deleted = " 
                        & Ada.Strings.Unbounded.To_String (Delete_All_Occurrences (Main_String, Sub_String)));
end Lab;