procedure Limited_String is
  subtype Address_Type is String (1 .. 3);

  Address_Val_1: Address_Type := "ABC";
  Address_Val_2: Address_Type := (others => ' ');
begin
  null;
end Limited_String;