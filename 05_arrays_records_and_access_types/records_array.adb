with Ada.Text_IO;
with Ada.Float_Text_IO;
with Ada.Strings.Unbounded;

procedure Records_Array is
  type Bird is record
    BirdName: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
    Average_Weight: Float := 0.0;
    Average_Wingspan: Float := 0.0;
    Migrating: Boolean := False;
  end record;

  Birds: array (1 .. 3) of Bird;
begin
  Birds (1).BirdName := Ada.Strings.Unbounded.To_Unbounded_String ("Canadian Goose");
  Birds (1).Average_Weight := 7.5;
  Birds (1).Average_Wingspan := 160.0;
  Birds (1).Migrating := True;

  Birds (2).BirdName := Ada.Strings.Unbounded.To_Unbounded_String ("Sparrow");
  Birds (2).Average_Weight := 0.03;
  Birds (2).Average_Wingspan := 0.15;

  Birds (3).BirdName := Ada.Strings.Unbounded.To_Unbounded_String ("Finch");
  Birds (3).Average_Weight := 0.047;
  Birds (3).Average_Wingspan := 0.17;

  -- simply print the array of records
  for Idx in Birds'Range loop
    Ada.Text_IO.Put_Line ("Bird Name: " & Ada.Strings.Unbounded.To_String (Birds (Idx).BirdName));
    Ada.Text_IO.Put ("Average weight: ");
    Ada.Float_Text_IO.Put (Birds (Idx).Average_Weight, Aft => 2, Exp => 0);
    Ada.Text_IO.New_Line;
    Ada.Text_IO.Put ("Average wingspan: ");
    Ada.Float_Text_IO.Put (Birds (Idx).Average_Wingspan, Aft => 2, Exp => 0);
    Ada.Text_IO.New_Line;
    Ada.Text_IO.Put_Line ("Migratory? " & Boolean'Image (Birds (Idx).Migrating));
    Ada.Text_IO.New_Line (2);
  end loop;
end Records_Array;