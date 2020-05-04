with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Numerics.Discrete_Random;

procedure Lab2 is
  subtype Vals is Positive range 1 .. 100;
  package Random100 is new Ada.Numerics.Discrete_Random(Result_Subtype => Vals);

  Gen: Random100.Generator;
  Random_Val: Vals := 1;
  Keep_Going: Ada.Strings.Unbounded.Unbounded_String;
begin
  Random100.Reset (Gen => Gen);

  loop
    Random_Val := Random100.Random (Gen => Gen);

    case Random_Val is
      when 1 .. 10 => Ada.Text_IO.Put_Line ("The random value is in the range 1 .. 10, its value is " & Vals'Image (Random_Val));
      when 11 .. 20 => Ada.Text_IO.Put_Line ("The random value is in the range 11 .. 20, its value is " & Vals'Image (Random_Val));
      when 21 .. 30 => Ada.Text_IO.Put_Line ("The random value is in the range 21 .. 30, its value is " & Vals'Image (Random_Val));
      when 31 .. 40 => Ada.Text_IO.Put_Line ("The random value is in the range 31 .. 40, its value is " & Vals'Image (Random_Val));
      when 41 .. 50 => Ada.Text_IO.Put_Line ("The random value is in the range 41 .. 50, its value is " & Vals'Image (Random_Val));
      when 51 .. 60 => Ada.Text_IO.Put_Line ("The random value is in the range 51 .. 60, its value is " & Vals'Image (Random_Val));
      when 61 .. 70 => Ada.Text_IO.Put_Line ("The random value is in the range 61 .. 70, its value is " & Vals'Image (Random_Val));
      when 71 .. 80 => Ada.Text_IO.Put_Line ("The random value is in the range 71 .. 80, its value is " & Vals'Image (Random_Val));
      when 81 .. 90 => Ada.Text_IO.Put_Line ("The random value is in the range 81 .. 90, its value is " & Vals'Image (Random_Val));
      when 91 .. 100 => Ada.Text_IO.Put_Line ("The random value is in the range 91 .. 100, its value is " & Vals'Image (Random_Val));
      when others => Ada.Text_IO.Put_Line ("Impossible!");
    end case;

    Ada.Text_IO.Put_Line ("Continue? [y/n]");
    Keep_Going := Ada.Strings.Unbounded.To_Unbounded_String(Ada.Text_IO.Get_Line);

    if Ada.Strings.Unbounded.To_String(Keep_Going) = "n" or Ada.Strings.Unbounded.To_String(Keep_Going) = "no" then
      exit;
    end if;
  end loop;
end Lab2;
