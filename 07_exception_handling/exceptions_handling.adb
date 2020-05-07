with Ada.Text_IO;

procedure Exceptions_Handling is
  Val1: Integer := 100;
  Val2: Integer := 0;
begin
  Ada.Text_IO.Put_Line ("Before attempted division by zero...");

  Val1 := Val1 / Val2;

  Ada.Text_IO.Put_Line ("After attempted division by zero");

exception 
  when Constraint_Error => Ada.Text_IO.Put_Line ("Error: division by 0.");
  when others => Ada.Text_IO.Put_Line ("Error: not sure which one");
end Exceptions_Handling;
