with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;

procedure Replace_String is
  Main_String: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String ("Hello there! We're having very nice weather today!");
  Place_Holder: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
begin
  Ada.Text_IO.Put ("======> Original main string: ");
  Ada.Text_IO.Unbounded_IO.Put_Line (Main_String);
  Ada.Text_IO.New_Line;

  -- delete a value inside the main string - basically create a new string with 
  -- the deleted portion missing - immutable
  Place_Holder := Ada.Strings.Unbounded.Delete (Main_String, 4, 10);
  Ada.Text_IO.Put ("=====> main string after deletion: ");
  Ada.Text_IO.Unbounded_IO.Put_Line (Main_String);
  Ada.Text_IO.Put ("Deleted portion: ");
  Ada.Text_IO.Unbounded_IO.Put_Line (Place_Holder);
  Ada.Text_IO.New_Line;

  -- insert a string inside of the main string
  Place_Holder := Ada.Strings.Unbounded.Insert (Main_String, 20, " [Well, here is some oddly inserted text!]");
  Ada.Text_IO.Put ("======> main string after text insertion: ");
  Ada.Text_IO.Unbounded_IO.Put_Line (Main_String);
  Ada.Text_IO.Put ("Deleted portion: ");
  Ada.Text_IO.Unbounded_IO.Put_Line (Place_Holder);
  Ada.Text_IO.New_Line;

  -- overwrite a portion of the string
  Place_Holder := Ada.Strings.Unbounded.Overwrite (Main_String, 10, "I like cats!");
  Ada.Text_IO.Put ("======> main string after text overwriting ");
  Ada.Text_IO.Unbounded_IO.Put_Line (Main_String);
  Ada.Text_IO.Put ("Deleted portion: ");
  Ada.Text_IO.Unbounded_IO.Put_Line (Place_Holder);
  Ada.Text_IO.New_Line;

  -- cut out a pience of the main string and replace it with a different substring
  Place_Holder := Ada.Strings.Unbounded.Replace_Slice (Main_String, 4, 0, "[ Random text in this string! ]");
  Ada.Text_IO.Put ("======> main string after replace slice");
  Ada.Text_IO.Unbounded_IO.Put_Line (Main_String);
  Ada.Text_IO.Put ("Deleted portion: ");
  Ada.Text_IO.Unbounded_IO.Put_Line (Place_Holder);
end Replace_String;