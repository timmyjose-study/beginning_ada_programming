with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;
with Ada.Containers.Hashed_Maps;
with Ada.Characters.Handling;
with Ada.Strings.Hash;

procedure Lab is
   use type Ada.Strings.Unbounded.Unbounded_String;

   type Guest is record
      Name              : Ada.Strings.Unbounded.Unbounded_String;
      Age               : Natural range 0 .. 150;
      Vegetarian        : Boolean := False;
      Bringing_Children : Boolean := False;
   end record;

   function Guest_To_String
     (G : in Guest) return Ada.Strings.Unbounded.Unbounded_String
   is
      Guest_Info : Ada.Strings.Unbounded.Unbounded_String :=
        Ada.Strings.Unbounded.Null_Unbounded_String;
   begin
      Ada.Strings.Unbounded.Append (Guest_Info, "{  ");
      Ada.Strings.Unbounded.Append (Guest_Info, "Name: ");
      Ada.Strings.Unbounded.Append (Guest_Info, G.Name);
      Ada.Strings.Unbounded.Append (Guest_Info, ", ");
      Ada.Strings.Unbounded.Append (Guest_Info, "Age: ");
      Ada.Strings.Unbounded.Append (Guest_Info, Natural'Image (G.Age));
      Ada.Strings.Unbounded.Append (Guest_Info, ", ");
      Ada.Strings.Unbounded.Append (Guest_Info, "Vegetarian? ");
      Ada.Strings.Unbounded.Append (Guest_Info, Boolean'Image (G.Vegetarian));
      Ada.Strings.Unbounded.Append (Guest_Info, ", ");
      Ada.Strings.Unbounded.Append (Guest_Info, "Bringing Children? ");
      Ada.Strings.Unbounded.Append
        (Guest_Info, Boolean'Image (G.Bringing_Children));
      Ada.Strings.Unbounded.Append (Guest_Info, " }");

      return Guest_Info;
   end Guest_To_String;

   function Equivalent_Keys
     (Left  : Ada.Strings.Unbounded.Unbounded_String;
      Right : Ada.Strings.Unbounded.Unbounded_String) return Boolean
   is
   begin
      return Left = Right;
   end Equivalent_Keys;

   function Hash_Func
     (Key : in Ada.Strings.Unbounded.Unbounded_String) return Ada.Containers
     .Hash_Type
   is
   begin
      return Ada.Strings.Hash (Ada.Strings.Unbounded.To_String (Key));
   end Hash_Func;

   function To_Lower
     (Key : in Ada.Strings.Unbounded.Unbounded_String)
      return Ada.Strings.Unbounded.Unbounded_String
   is
   begin
      return Ada.Strings.Unbounded.To_Unbounded_String
          (Ada.Characters.Handling.To_Lower
             (Ada.Strings.Unbounded.To_String (Key)));
   end To_Lower;

   package Attendance_Map is new Ada.Containers.Hashed_Maps
     (Key_Type     => Ada.Strings.Unbounded.Unbounded_String,
      Element_Type => Guest, Equivalent_Keys => Equivalent_Keys,
      Hash         => Hash_Func);

   Wedding_Attendance : Attendance_Map.Map;

   User_Input   : Natural                                := 0;
   String_Input : Ada.Strings.Unbounded.Unbounded_String :=
     Ada.Strings.Unbounded.Null_Unbounded_String;

   procedure Populate_Hash_Map (Map : in out Attendance_Map.Map) is
   begin
      Attendance_Map.Insert
        (Container => Map,
         Key       => Ada.Strings.Unbounded.To_Unbounded_String ("Aunt Annie"),
         New_Item  =>
           (Name => Ada.Strings.Unbounded.To_Unbounded_String ("Aunt Annie"),
            Age  => 79, Vegetarian => False, Bringing_Children => True));

      Attendance_Map.Insert
        (Container => Map,
         Key       => Ada.Strings.Unbounded.To_Unbounded_String ("Quagmire"),
         New_Item  =>
           (Name => Ada.Strings.Unbounded.To_Unbounded_String ("Quagmire"),
            Age  => 23, Vegetarian => False, Bringing_Children => False));

      Attendance_Map.Insert
        (Container => Map,
         Key => Ada.Strings.Unbounded.To_Unbounded_String ("Homer Simpson"),
         New_Item  =>
           (Name =>
              Ada.Strings.Unbounded.To_Unbounded_String ("Homer Simpson"),
            Age => 49, Vegetarian => True, Bringing_Children => False));
   end Populate_Hash_Map;

   procedure Print_Hash_Map (Position : in Attendance_Map.Cursor) is
   begin
      Ada.Text_IO.Put_Line
        (Ada.Strings.Unbounded.To_String (Attendance_Map.Key (Position)) &
         " => " &
         Ada.Strings.Unbounded.To_String
           (Guest_To_String (Attendance_Map.Element (Position))));
   end Print_Hash_Map;
begin
   Populate_Hash_Map (Wedding_Attendance);
   loop
      Ada.Text_IO.New_Line;
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
            Ada.Text_IO.Put_Line ("Error: input is not a number!");
            User_Input := 0;
         when others =>
            Ada.Text_IO.Put_Line ("Something went wrong.");
            User_Input := 0;
      end;

      Ada.Text_IO.Skip_Line;
      Ada.Text_IO.New_Line;

      case User_Input is
         when 1 =>
            declare
               New_Guest     : Guest;
               Natural_Input : Natural range 0 .. 150 := 0;
            begin
               Ada.Text_IO.Put_Line ("Enter a new value.");
               Ada.Text_IO.Put (" Name -> ");
               String_Input   := Ada.Text_IO.Unbounded_IO.Get_Line;
               New_Guest.Name := String_Input;

               Ada.Text_IO.Put (" Age -> ");
               Ada.Integer_Text_IO.Get (Natural_Input);
               New_Guest.Age := Natural_Input;
               Ada.Text_IO.Skip_Line;

               Ada.Text_IO.Put (" Vegetarian? (y/n) -> ");
               String_Input := Ada.Text_IO.Unbounded_IO.Get_Line;
               if Ada.Strings.Unbounded.To_String (String_Input) = "y" or
                 Ada.Strings.Unbounded.To_String (String_Input) = "yes"
               then
                  New_Guest.Vegetarian := True;
               end if;

               Ada.Text_IO.Put (" Bringing children? -> ");
               String_Input := Ada.Text_IO.Unbounded_IO.Get_Line;
               if Ada.Strings.Unbounded.To_String (String_Input) = "y" or
                 Ada.Strings.Unbounded.To_String (String_Input) = "yes"
               then
                  New_Guest.Bringing_Children := True;
               end if;

               Attendance_Map.Insert
                 (Container => Wedding_Attendance, Key => New_Guest.Name,
                  New_Item  => New_Guest);
            end;

         when 2 =>
            Ada.Text_IO.Put ("Delete a value -> ");
            String_Input := Ada.Text_IO.Unbounded_IO.Get_Line;
            Ada.Text_IO.New_Line;

            declare
            begin
               Attendance_Map.Delete
                 (Container => Wedding_Attendance, Key => String_Input);
            exception
               when Constraint_Error =>
                  Ada.Text_IO.Put_Line
                    ("Key " & Ada.Strings.Unbounded.To_String (String_Input) &
                     " was not found in the database");
               when others =>
                  Ada.Text_IO.Put_Line ("Something went wrong.");
            end;

         when 3 =>
            Attendance_Map.Iterate
              (Container => Wedding_Attendance,
               Process   => Print_Hash_Map'Access);

         when 4 =>
            Ada.Text_IO.Put_Line ("Adios!");
            exit;

         when others =>
            Ada.Text_IO.Put_Line ("Don't be ridiculous");
      end case;
   end loop;
end Lab;
