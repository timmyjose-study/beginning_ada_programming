with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;
with Ada.Characters.Latin_1;

procedure Concat_Address is
  Flat_Number: Positive := 1;
  Floor_Number: Positive := 1;
  House_Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String ("F1");
  Street_Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String ("Hollywood Street");
  City_Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String ("Sacramento");
  State_Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String ("California");
  Zip_Code: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.To_Unbounded_String ("90201");

  Full_Address: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
begin
  Full_Address := Ada.Strings.Unbounded.To_Unbounded_String ("Flat ");
  Ada.Strings.Unbounded.Append(Full_Address, Ada.Strings.Unbounded.To_Unbounded_String(Positive'Image (Flat_Number)));
  Ada.Strings.Unbounded.Append (Full_Address, ", ");
  Ada.Strings.Unbounded.Append (Full_Address, " Floor ");
  Ada.Strings.Unbounded.Append (Full_Address, Ada.Strings.Unbounded.To_Unbounded_String(Positive'Image (Floor_Number)));
  Ada.Strings.Unbounded.Append (Full_Address, ", ");
  Ada.Strings.Unbounded.Append (Full_Address, House_Name);
  Ada.Strings.Unbounded.Append (Full_Address, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append (Full_Address, Street_Name);
  Ada.Strings.Unbounded.Append (Full_Address, ", ");
  Ada.Strings.Unbounded.Append (Full_Address, City_Name);
  Ada.Strings.Unbounded.Append (Full_Address, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append (Full_Address, State_Name);
  Ada.Strings.Unbounded.Append (Full_Address, ", ");
  Ada.Strings.Unbounded.Append (Full_Address, Zip_Code);

  Ada.Text_IO.Unbounded_IO.Put_Line (Full_Address);
end Concat_Address;