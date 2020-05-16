with System.Assertions;
with Ada.Text_IO;
with Function_Check;

procedure Function_Check_Main is
  Result: Boolean := False;
begin
  Result := Function_Check.Evaluate ("command: remove --dir \temp");
  
  if Result then
    Ada.Text_IO.Put_Line ("The command is formatted correctly");
  else
    Ada.Text_IO.Put_Line ("The command is not formatted correctly");
  end if;
exception
  when System.Assertions.Assert_Failure =>
    Ada.Text_IO.Put_Line ("Precondition failed!");
  when others =>
    Ada.Text_IO.Put_Line ("Error: Something else went wrong");
end Function_Check_Main;
