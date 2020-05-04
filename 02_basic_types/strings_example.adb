-- stringsexample.adb

with Ada.Text_IO;
with Ada.Strings;
with Ada.Strings.Fixed;

-- the default type for strings in Ada is Fixed-Length Strings.

procedure Strings_Example is
   SomeVal: String := "Hello, world";
   SomeVal2: String := "Hallo, world";
   LongString: String (1..250);
   LongText: String := "Hello there back!";
   -- the following does not compile: unconstrained subtype not allowed (needs initialisation)
   -- UnAssigned: String;
begin
   -- this will not work - we need Move to copy the contents of a smaller string into a 
   -- fixed-length string
   -- LongString := SomeVal;
   Ada.Strings.Fixed.Move (SomeVal, LongString);
   Ada.Text_IO.Put_Line (SomeVal);
   Ada.Text_IO.Put_Line (LongString);
   
   -- this is fine
   Ada.Strings.Fixed.Move (SomeVal, LongText);
   Ada.Text_IO.Put_Line (Natural'Image (LongText'Length));
   
   -- this is also fine
   SomeVal2 := SomeVal;
   Ada.Text_IO.Put_Line (SomeVal);
   
   -- also fine
   Ada.Strings.Fixed.Move ("Hullo, world", SomeVal2);
   Ada.Text_IO.Put_Line (SomeVal2);
   
   --LongText := "Hi";
   Ada.Strings.Fixed.Move ("Hi", LongText);
   Ada.Text_IO.Put_Line (LongText);
   
   -- this works since the string type is fixed-length 
   LongText := "Hello there back!";
   Ada.Text_IO.Put_Line (LongText);
end Strings_Example;
  
