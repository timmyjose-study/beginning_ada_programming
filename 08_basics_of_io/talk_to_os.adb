with Ada.Text_IO;
with GNAT.OS_Lib; -- for OS stuff, naturally

procedure Talk_To_OS is
  function OS_Command (
    Command: in String;
    Arguments: in String
    ) return Integer is
    Return_Value: Integer := 0;

    Arguments_List: GNAT.OS_Lib.Argument_List := 
      (--1 => new String'(Command),
    1 => new String'(Arguments));

    File_Descriptor: GNAT.OS_Lib.File_Descriptor := GNAT.OS_Lib.Standout;
  begin
    GNAT.OS_Lib.Spawn (
      Program_Name => Command,
      Args => Arguments_List,
      Output_File_Descriptor => File_Descriptor,
      Return_Code => Return_Value
      );

    return Return_Value;
  end OS_Command;

  Return_Int: Integer := 0;
begin
  Return_Int := OS_Command (
    Command => "/bin/ls",
    Arguments => "-l"
    );
  Ada.Text_IO.Put_Line (Integer'Image (Return_Int));
end Talk_To_OS;