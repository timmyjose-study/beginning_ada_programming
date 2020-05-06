with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;

procedure Complex_Array is
  type IntArray is array (1 .. 6, 1 .. 10) of Integer;
  ArrayInt: IntArray;

  type FloatArray is array (-5 .. 20, 1 .. 15) of Float;
  ArrayFloat: FloatArray;

  procedure Display_Integer_Array (Arr: IntArray) is
  begin
    for Row_Index in Arr'Range (1) loop
      for Col_Index in Arr'Range (2) loop
        Ada.Integer_Text_IO.Put (Arr (Row_Index, Col_Index));
      end loop;
      Ada.Text_IO.New_Line;
    end loop;
    Ada.Text_IO.New_Line (2);
  end Display_Integer_Array;

  procedure Display_Float_Array (Arr: FloatArray) is 
  begin
    for Row_Index in Arr'Range (1) loop
      for Col_Index in Arr'Range (2) loop
        Ada.Float_Text_IO.Put (Arr (Row_Index, Col_Index), Aft => 2, Exp => 0);
        Ada.Text_IO.Put (" ");
      end loop;
      Ada.Text_IO.New_Line;
    end loop;
    Ada.Text_IO.New_Line (2);
  end Display_Float_Array;

begin
  -- nested default initialisations ara allowed
  ArrayInt := (others => (others => 0));
  Display_Integer_Array (ArrayInt);

  for Row_Index in ArrayInt'Range (1) loop
    for Col_Index in ArrayInt'Range (2) loop
      ArrayInt (Row_Index, Col_Index) := Row_Index + Col_Index;
    end loop;
  end loop;
  Display_Integer_Array (ArrayInt);


  ArrayFloat := (others => (others => 0.0));
  Display_Float_Array (ArrayFloat);

  for Row_Index in ArrayFloat'Range (1) loop
    for Col_Index in ArrayFLoat'Range (2) loop
      ArrayFLoat (Row_Index, Col_Index) := Float(Row_Index * Col_Index) + 1.23;
    end loop;
  end loop;
  Display_Float_Array (ArrayFLoat);
end Complex_Array;