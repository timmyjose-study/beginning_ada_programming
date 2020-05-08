with Ada.Text_IO;
with GNAT.OS_Lib;

procedure OS_Interop_Demo is
  Result: Integer;
  Arguments: GNAT.OS_Lib.Argument_List := ( 1 => new String'("-l") );
begin
  GNAT.OS_Lib.Spawn (
    Program_Name => "/bin/ls",
    Args => Arguments,
    Output_File_Descriptor => GNAT.OS_Lib.Standout,
    Return_Code => Result
    );
end OS_Interop_Demo;