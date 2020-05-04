with Ada.Text_IO;
with Ada.NUmerics.Discrete_Random;

procedure Lab1 is
  Buffer: String(1 .. 3);
  Len: Natural := 0;
  Value: Integer := 0;

  -- generating random numbers
  subtype Vals is Positive range 1 .. 100;
  package Random100 is new Ada.Numerics.Discrete_Random(Result_Subtype => Vals);

  Generator: Random100.Generator;
  Secret: Vals := 1;

  Guess_Count: Positive := 1;
begin
  -- generate the secret random number in the range 1 .. 100
  Random100.Reset (Gen => Generator);
  Secret := Random100.Random (Gen => Generator);

  loop
    Ada.Text_IO.Put_Line ("Enter your guess (1 to 100)");
    Ada.Text_IO.Get_Line (Buffer, Len); -- Len here is implicit - bounds checking is in place
    Value := Integer'Value (Buffer (1 .. Len));

    if Value < Secret then
      Ada.Text_IO.Put_Line ("Too small!");
      Guess_Count := Guess_Count + 1;
    elsif Value > Secret then
      Ada.Text_IO.Put_Line ("Too big!");
      Guess_Count := Guess_Count + 1;
    else
      Ada.Text_IO.Put_Line ("Correct! You took " & Positive'Image (Guess_Count) & " guesses");
      exit;
    end if;
  end loop;
end Lab1;
