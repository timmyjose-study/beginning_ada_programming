with Ada.Text_IO;

procedure Declare_Exceptions_Handling is
  Val1: Integer := 192;
  Val2: Integer := 0;
begin
  Ada.Text_IO.Put_Line ("Demo of how to continue post catching/handling an exception");

  declare
  begin
    Ada.Text_IO.Put_Line ("Before attempting to divide by zero...");
    Val1 := Val1 / Val2;
    Ada.Text_IO.Put_Line ("This line will not be printed");
  exception
    when Constraint_Error => Ada.Text_IO.Put_Line ("Error: attempted to divide by zero.");
    when others => Ada.Text_IO.Put_Line ("Error: something else.");
  end;

  Ada.Text_IO.Put_Line ("We continue on our merry way!");
end Declare_Exceptions_Handling;