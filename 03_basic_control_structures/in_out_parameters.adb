-- in out mode parameters are references that allow both read and write.
-- since we are using references, we cannot pass in literals - this will be a compile-time error.

with Ada.Text_IO;

procedure In_Out_Parameters is
  procedure In_Out_Parameters_Demo(X: in out Integer; Y: in out String) is
  begin
    X := x + 10;
    Y := "World";
  end In_Out_Parameters_Demo;

  X: Integer := 0;
  Y: String(1 .. 5) := "Hello";
begin
  Ada.Text_IO.Put_Line ("Before call, X = " & Integer'Image (X) & ", and Y = " & Y);
  In_Out_Parameters_Demo (X, Y);
  Ada.Text_IO.Put_Line ("After call, X = " & Integer'Image (X) & ", and Y = " & Y);
end In_Out_Parameters;