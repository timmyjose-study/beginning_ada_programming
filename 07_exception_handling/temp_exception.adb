with Ada.Text_IO;
with Ada.Float_Text_IO;

procedure Temp_Exception is
  function Convert_F_To_C (Fahr: in Float) return Float is
  begin
    if Fahr < -459.67 then
      raise Constraint_Error;
    else 
      return (Fahr - 32.0) / (5.0 / 9.0);
    end if;
  end Convert_F_To_C;

  Fahr: Float := 0.0;
begin
  Fahr := 100.0;
  Ada.Text_IO.Put ("100 Fahr = ");
  Ada.Float_Text_IO.Put (Convert_F_To_C (Fahr), Aft => 2, Exp => 0);
  Ada.Text_IO.Put_Line (" Celsius");

  Fahr := -100.0;
  Ada.Text_IO.Put ("-100 Fahr = ");
  Ada.Float_Text_IO.Put (Convert_F_To_C (Fahr), Aft => 2, Exp => 0);
  Ada.Text_IO.Put_Line (" Celsius");

  Fahr := -1632.0;
  Ada.Text_IO.Put ("-1632 Fahr = ");
  Ada.Float_Text_IO.Put (Convert_F_To_C (Fahr), Aft => 2, Exp => 0);
  Ada.Text_IO.Put_Line (" Celsius");
exception
  when Constraint_Error => Ada.Text_IO.Put_Line ("Don't be ridiculous - such low temperatures don't exist");
  when others => Ada.Text_IO.Put_Line ("Something else went wrong");
end Temp_Exception;