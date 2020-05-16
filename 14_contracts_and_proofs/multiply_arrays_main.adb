with System.Assertions;
with Ada.Text_IO;
with Multiply_Arrays;

procedure Multiply_Arrays_Main is
  My_Array: Multiply_Arrays.Int_Array (1 .. 100);
begin
  Multiply_Arrays.Init_Array (My_Array);
  Multiply_Arrays.Print_Array (My_Array);

  Multiply_Arrays.Multiply_Array_By_Two (My_Array);
  Multiply_Arrays.Print_Array (My_Array);

  declare
  begin
    -- generate an error by modifying the array explicitly
    Multiply_Arrays.Multiply_Array_By_Two (My_Array, By => 3);
    Multiply_Arrays.Print_Array (My_Array);
  exception
    when Constraint_Error =>
      Ada.Text_IO.Put_Line ("Error! Constraint check failed");
    when System.Assertions.Assert_Failure =>
      Ada.Text_IO.Put_Line ("Error! Failed constraint check");
    when others =>
      Ada.Text_IO.Put_Line ("Error! Something else went wrong");
  end;
end Multiply_Arrays_Main;
