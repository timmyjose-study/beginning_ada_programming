with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Command_Line;
with Ada.Task_Identification;

procedure Command_Line_Factorial is
  function Factorial (N: Natural) return Natural is
    function Factorial_Helper (Acc, N: Natural) return Natural is
    begin
      case N is
        when 0 => return Acc;
        when others => return Factorial_Helper (Acc * N, N - 1);
      end case;
    end Factorial_Helper;
  begin
    return Factorial_Helper (1, N);
  end Factorial;
begin
  if Ada.Command_Line.Argument_Count = 0 then
    Ada.Text_IO.Put_Line ("Usage: factorial Number [Number*]");
    Ada.Task_Identification.Abort_Task (Ada.Task_Identification.Current_Task);
  end if;

  for Idx in 1 .. Ada.Command_Line.Argument_Count loop
    declare
      N: Natural := Natural'Value (Ada.Command_Line.Argument (Idx));
    begin
      Ada.Text_IO.Put_Line ("The factorial of "
      & Natural'Image (N)
      & " is " & Natural'Image (Factorial (N)));
    end;
  end loop;
end Command_Line_Factorial;
