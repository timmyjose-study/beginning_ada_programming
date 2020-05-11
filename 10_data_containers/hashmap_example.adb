with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Containers.Hashed_Maps;
with Ada.Characters.Handling;
with Ada.Strings.Unbounded;
with Ada.Strings.Hash;

procedure Hashmap_Example is
  -- again, make the type visible for the container
  use type Ada.Strings.Unbounded.Unbounded_String;

  -- the equivalence function for the hashmap
  function Equivalent_Keys (
    Left: Ada.Strings.Unbounded.Unbounded_String;
    Right: Ada.Strings.Unbounded.Unbounded_String
    ) return Boolean is
  begin
    return Left = Right;
  end Equivalent_Keys;

  -- the hash function for the hashmap
  function Hash_Func (
    Key: Ada.Strings.Unbounded.Unbounded_String
    ) return Ada.Containers.Hash_Type is
  begin
    return Ada.Strings.Hash (Ada.Strings.Unbounded.To_String (Key));
  end Hash_Func;

  function To_Lower ( Key: in Ada.Strings.Unbounded.Unbounded_String )
    return Ada.Strings.Unbounded.Unbounded_String is
  begin
    return Ada.Strings.Unbounded.To_Unbounded_String (
      Ada.Characters.Handling.To_Lower (
        Ada.Strings.Unbounded.To_String (Key)));
  end To_Lower;

  -- specialised hashmap type
  package Attendance_Map is new Ada.Containers.Hashed_Maps (
  Key_Type => Ada.Strings.Unbounded.Unbounded_String,
  Equivalent_Keys => Equivalent_Keys,
  Hash => Hash_Func,
  Element_Type => Boolean
  );

  Wedding_Attendance: Attendance_Map.Map;

  User_Input: Natural := 0;
  String_Input: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
  Confirmation: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;

  procedure Populate_Hash_Map (Map: in out Attendance_Map.Map) is
  begin
    Map.Insert (
      Key => Ada.Strings.Unbounded.To_Unbounded_String ("Quagmire"),
      New_Item => True
      );

    Map.Insert (
      Key => Ada.Strings.Unbounded.To_Unbounded_String ("Homer Simpson"),
      New_Item => False
      );
  end Populate_Hash_Map;

  procedure Print_Hash_Map (
    Position: Attendance_Map.Cursor
    ) is 
  begin
    Ada.Text_IO.Put_Line (Ada.Strings.Unbounded.To_String (Attendance_Map.Key (Position))
    & " => " & Boolean'Image(Attendance_Map.Element (Position)));
  end Print_Hash_Map;
begin
  Populate_Hash_Map (Wedding_Attendance);

  loop
    Ada.Text_IO.Put_Line ("--- Menu ---");
    Ada.Text_IO.Put_Line (" - 1 - Enter new value.");
    Ada.Text_IO.Put_Line (" - 2 - Delete existing value.");
    Ada.Text_IO.Put_Line (" - 3 - Print entire hashmap.");
    Ada.Text_IO.Put_Line (" - 4 - Exit application.");

    declare
    begin
      Ada.Integer_Text_IO.Get (User_Input);
    exception
      when Ada.Text_IO.Data_Error =>
        Ada.Text_IO.Put_Line ("Error: entered input is not an integer");
        User_Input := 0;
      when others =>
        Ada.Text_IO.Put_Line ("Something went wrong.");
        User_Input := 0;
    end;
    Ada.Text_IO.Skip_Line;
    Ada.Text_IO.New_Line;

    case User_Input is
      when 1 => 
        Ada.Text_IO.Put_Line ("Enter a new value.");
        Ada.Text_IO.Put ("   Name -> ");
        String_Input := Ada.Text_IO.Unbounded_IO.Get_Line;
        Ada.Text_IO.New_Line;

        Ada.Text_IO.Put ("Attending? [y/yes/n/no]: ");
        Confirmation := Ada.Text_IO.Unbounded_IO.Get_Line;
        Ada.Text_IO.New_Line;

        if To_Lower (Confirmation) = Ada.Strings.Unbounded.To_Unbounded_String ("n")
          or To_Lower (Confirmation) = Ada.Strings.Unbounded.To_Unbounded_String ("no") then
          Attendance_Map.Insert (
            Container => Wedding_Attendance,
            Key => String_Input,
            New_Item => False
            );
        elsif To_Lower (Confirmation) = Ada.Strings.Unbounded.To_Unbounded_String ("y") or
          To_Lower (Confirmation) = Ada.Strings.Unbounded.To_Unbounded_String ("yes") then
          Attendance_Map.Insert (
            Container => Wedding_Attendance,
            Key => String_Input,
            New_Item => True
            );
        else 
          Ada.Text_IO.Put_Line ("Warning: unknown confirmation value");
        end if;
      when 2 => 
        Ada.Text_IO.Put ("Delete a value -> ");
        String_Input := Ada.Text_IO.Unbounded_IO.Get_Line;
        Ada.Text_IO.New_Line;

        declare
        begin
          Attendance_Map.Delete (
            Container => Wedding_Attendance,
            Key => String_Input
            );
        exception
          when Constraint_Error => 
            Ada.Text_IO.Put_Line ("Name " & Ada.Strings.Unbounded.To_String (String_Input) 
            & " was not found in the map.");
          when others =>
            Ada.Text_IO.Put_Line ("Something went wrong.");
        end;
      when 3 => 
        Wedding_Attendance.Iterate (Print_Hash_Map'Access);
        Ada.Text_IO.New_Line;
      when 4 =>
        exit;
      when others => Ada.Text_IO.Put_Line ("Don't be ridiculous.");
    end case;
  end loop;
end Hashmap_Example;