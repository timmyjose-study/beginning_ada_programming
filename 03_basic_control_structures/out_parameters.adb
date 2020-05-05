-- this is the third parameter mode - this is alao as referenc type, but it is intended for use as a return value
-- from a subprogram. 
-- The value has to be set from within the subprogram before being read. As with in-out parameters, passing in a 
-- literal is an error since we are working with references.

with Ada.Text_IO;

procedure Out_Parameters is
  procedure Update_In (X: out Integer) is
  begin
    X := 42;
  end Update_In;

  function Update_All (X: out Integer; Y: out String) return Integer is
  begin
    X := 100;
    Y := "World";

    return 199;
  end Update_All;

  X, Z: Integer := 0;
  Y: String (1 .. 5) := "Hello";
begin
  Update_In (X);
  Ada.Text_IO.Put_Line ("X = " & Integer'Image (X));

  Z := Update_All (X, Y);
  Ada.Text_IO.Put_Line ("X = " & Integer'Image (X) & ", Y = " & Y & ", Z = " & Integer'Image (Z));
end Out_Parameters;