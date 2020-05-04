with Ada.Text_IO;

procedure Case_Statement is
  SomeVal: Integer := 3;

  type Days is (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);

  Today: Days := Wednesday;
begin
  case SomeVal is
    when 0 => Ada.Text_IO.Put_Line ("SomeVal is 0");
    when 1 => Ada.Text_IO.Put_Line ("SomeVal is 1");
    when 2 => Ada.Text_IO.Put_Line ("SomeVal is 2");
    when 3 .. 10 => Ada.Text_IO.Put_Line ("SomeVal is in the range [3, 10]");
    when 11 | 12 => Ada.Text_IO.Put_Line ("SomeVal is either 11 or 12");
    when 13 .. 19 | 99 | 100 => Ada.Text_IO.Put_Line ("SomeVal is either in the range [13, 19] or 99 or 100");
    when others => Ada.Text_IO.Put_Line ("SomeVal is some other value");
  end case;

  Ada.Text_IO.New_Line (2); -- two newlines!

  case Today is
    when Monday => Ada.Text_IO.Put_Line ("Today is Monday");
    when Tuesday => Ada.Text_IO.Put_Line ("Today is Tuesday");
    when Wednesday | Thursday => Ada.Text_IO.Put_Line ("Today is either Wednesday or Thursday");
    when Friday .. Sunday => Ada.Text_IO.Put_Line ("Today is one of Friday, Saturday, or Sunday");
    when others => Ada.Text_IO.Put_Line ("Impossibru!");
  end case;

  Ada.Text_IO.New_Line (2);
end Case_Statement;