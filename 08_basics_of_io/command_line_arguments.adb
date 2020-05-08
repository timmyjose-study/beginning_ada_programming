with Ada.Text_IO;
with Ada.Command_Line;

procedure Command_Line_Arguments is
begin
  Ada.Text_IO.Put_Line ("Program Name: " & Ada.Command_Line.Command_Name);

  Ada.Text_IO.Put_Line ("Number of command-line arguments = " & Natural'Image (Ada.Command_Line.Argument_Count));
  if Ada.Command_Line.Argument_Count > 0 then
    Ada.Text_IO.Put_Line ("Number of arguments = " & Natural'Image (Ada.Command_Line.Argument_Count));

    for Index in 1 .. Ada.Command_Line.Argument_Count loop
      Ada.Text_IO.Put_Line ("Argument at index " & Positive'Image (Index) 
      & " is " & Ada.Command_Line.Argument (Index));
    end loop;
  end if;
end Command_Line_Arguments;