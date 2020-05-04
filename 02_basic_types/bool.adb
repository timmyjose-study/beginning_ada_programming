-- bool.adb

with Ada.Text_IO;

procedure Bool is
   BoolVal1: Boolean := True;
   BoolVal2: Boolean := True;
   BoolVal3: Boolean := False;
begin
   Ada.Text_IO.Put_Line ("BoolVal1 = " & Boolean'Image (BoolVal1));
   Ada.Text_IO.Put_Line ("BoolVal2 = " & Boolean'Image (BoolVal2));
   Ada.Text_IO.Put_Line ("BoolVal3 = " & Boolean'Image (BoolVal3));
   Ada.Text_IO.Put_Line ("True or True = " & Boolean'Image (BoolVal1 or BoolVal2));
   Ada.Text_IO.Put_Line ("True or False = " & Boolean'Image (BoolVal2 or BoolVal3));
   Ada.Text_IO.Put_Line ("True and True = " & Boolean'Image (BoolVal1 and BoolVal2));
   Ada.Text_IO.Put_Line ("True and False = " & Boolean'Image (BoolVal1 and BoolVal3));   
   Ada.Text_IO.Put_Line ("not True = " & Boolean'Image (not BoolVal1));
   Ada.Text_IO.Put_Line ("not False = " & Boolean'Image (not BoolVal3));
   Ada.Text_IO.Put_Line ("True xor True = " & Boolean'Image (BoolVal1 xor BoolVal2));
   Ada.Text_IO.Put_Line ("True xor False = " & Boolean'Image (BoolVal1 xor BoolVal3));
end Bool;

