with Ada.Text_IO;
with Ada.Float_Text_IO;

procedure Simple_Array is
  type FloatArray is array (1 .. 20) of Float;
  ArrayFloat: FloatArray;

  type IntArray is array (-5 .. 35) of Integer;
  ArrayInt: IntArray;

  procedure Display_Float_Array (Arr: in FloatArray) is
  begin
    for Index in Arr'Range loop
      Ada.Text_IO.Put (" ");
      Ada.Float_Text_IO.Put (Arr (Index), Aft => 2, Exp => 0);
      Ada.Text_Io.Put (" ");
    end loop;
    Ada.Text_IO.New_Line;
  end Display_Float_Array;

  procedure Display_Integer_Array (Arr: in IntArray) is
  begin
    for Index in Arr'First .. Arr'Last loop
      Ada.Text_IO.Put (" " & Integer'Image (Arr (Index)) & " ");
    end loop;
    Ada.Text_IO.New_Line;
  end Display_Integer_Array;
begin
  -- default assignment to the entire array
  ArrayFloat := (others => 0.0);
  Display_Float_Array (ArrayFloat);

  -- default assignment to the entire array with exceptions for certains indices
  ArrayInt := (-5 => 1, -4 => 2, -3 => 3, -2 => 4, -1 => 5, 0 => 6, others => 0);
  Display_Integer_Array (ArrayInt);

  -- initialising/updating an array in a loop
  for Index in ArrayInt'Range loop
    ArrayInt (Index) := ArrayInt (Index) + 100;
  end loop;
  Display_Integer_Array (ArrayInt);
end Simple_Array;
