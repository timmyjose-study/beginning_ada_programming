-- Limited types are types that cannot be compared for equality.
-- They are useful in creating types representing entities that cannot naturally be compared

with Ada.Text_IO;

procedure Limited_Types is
  type New_Integer is limited record
    Tracking_Number: Integer;
    end record;

  Val1: New_Integer;
  Val2: New_Integer;
begin
  Val1.Tracking_Number := 100;
  Val2.Tracking_Number := 100;

  --- this does not compile since New_Integer is a limited type
  if Val1 = Val2 then
    Ada.Text_IO.Put_Line ("Val1 and Val2 are equal.");
  else
    Ada.Text_IO.Put_Line ("Val1 and Val2 are not equal.");
  end if;
end Limited_Types;