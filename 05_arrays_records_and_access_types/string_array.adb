with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure String_Array is
  type StringArray is array (1 .. 2, 1 .. 6) of Unbounded_String;

  ArrayString: StringArray := ((To_Unbounded_String ("John"), To_Unbounded_String ("Michael"), To_Unbounded_String ("Matthew"), To_Unbounded_String ("Bob"), 
  To_Unbounded_String ("Jacob"), To_Unbounded_String ("Heiko")), 
  ((To_Unbounded_String ("Big"), To_Unbounded_String ("Mighty"), To_Unbounded_String ("Artistic"), 
  To_Unbounded_String ("Bright"), To_Unbounded_String ("Quick"), To_Unbounded_String ("Brilliant"))));
begin
  for Row_Index in ArrayString'Range (1) loop
    for Col_Index in ArrayString'Range (2) loop
      Ada.Text_IO.Put (" ");
      Ada.Text_IO.Put (To_String (ArrayString (Row_Index, Col_Index)));
      Ada.Text_IO.Put (" ");
    end loop;
    Ada.Text_IO.New_Line (2);
  end loop;
end String_Array;