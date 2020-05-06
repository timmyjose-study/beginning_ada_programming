-- this is the default mode for parameters - immutable copy
-- this example should throw a compile-time error: "assignment to in mode parameter is not allowed"

procedure In_Parameters is
 procedure In_Parameter_Demo(num1: in Integer) is
 begin
   num1 := num1 + 10;
 end In_Parameter_Demo;

 procedure Default_In_Parameter_Demo(num1: Integer) is
 begin
   num1 := num1 + 10;
 end Default_In_Parameter_Demo;

begin
  In_Parameter_Demo(100);
  Default_In_Parameter_Demo(100);
end In_Parameters;