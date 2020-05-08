with Ada.Text_IO;
with GNAT.OS_Lib;

procedure System_Interop_Demo is
  function Exec_Command (
    Command: in String;
    Arguments: in String
    ) return Integer is

    Return_Code: Integer := 0;
    Argument_List: GNAT.OS_Lib.Argument_List := (1 => new String'(Arguments));
  begin
    GNAT.OS_Lib.Spawn (
      Program_Name => Command,
      Args => Argument_List,
      Output_File_Descriptor => GNAT.OS_Lib.Standout,
      Return_Code => Return_Code
      );

    return Return_Code;
  end Exec_Command;

  Return_Value: Integer := 0;
begin
  Return_Value := Exec_Command (
    Command => "/Users/z0ltan/software/ada/bin/gnatmake",
    Arguments => "--version"
    );
end System_Interop_Demo;