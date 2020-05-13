-- see limited_types.adb for further elucidation

with Ada.Text_IO;

procedure Non_Limited_Types is
   type New_Integer is record
      Tracking_Number : Integer;
   end record;

   Val1 : New_Integer;
   Val2 : New_Integer;
begin
   Val1.Tracking_Number := 100;
   Val2.Tracking_Number := 100;

   if Val1 = Val2 then
      Ada.Text_IO.Put_Line ("Val1 and Val2 are equal");
   else
      Ada.Text_IO.Put_Line ("Val1 and Val2 are not equal.");
   end if;

   Val2.Tracking_Number := 99;

   if Val1 = Val2 then
      Ada.Text_IO.Put_Line ("Val1 and Val2 are equal.");
   else
      Ada.Text_IO.Put_Line ("Val1 and Val2 are not equal.");
   end if;
end Non_Limited_Types;
