with Ada.Text_IO;
with Ada.Float_Text_IO;
with Gener;

procedure Generic_Main is
   type Some_Int is new Integer range 0 .. 5000;
   type Some_Float is new Float range -5.0 .. 125.00;

   -- specialise the generic package
   package Generic_Package is new Gener (Custom_Integer_Type => Some_Int,
      Custom_Float_Type                                      => Some_Float);

   procedure Put_Line_Int (Val1 : in Some_Int; Val2 : in Some_Int) is
   begin
      Ada.Text_IO.Put_Line
        ("Val1 is " & Some_Int'Image (Val1) & ", and Val2 is " &
         Some_Int'Image (Val2));
   end Put_Line_Int;

   procedure Put_Line_Int (Val : in Some_Int) is
   begin
      Ada.Text_IO.Put_Line ("Val is " & Some_Int'Image (Val));
   end Put_Line_Int;

   procedure Put_Line_Float (Val1 : in Some_Float; Val2 : in Some_Float) is
   begin
      Ada.Text_IO.Put ("Val1 is ");
      Ada.Float_Text_IO.Put (Float (Val1), Aft => 3, Exp => 0);
      Ada.Text_IO.Put (", and Val2 is ");
      Ada.Float_Text_IO.Put (Float (Val2), Aft => 3, Exp => 0);
      Ada.Text_IO.New_Line;
   end Put_Line_Float;

   procedure Put_Line_Float (Val : in Some_Float) is
   begin
      Ada.Text_IO.Put ("Val is ");
      Ada.Float_Text_IO.Put (Float (Val), Aft => 3, Exp => 0);
      Ada.Text_IO.New_Line;
   end Put_Line_Float;

   Int_Test1   : Some_Int   := 10;
   Int_Test2   : Some_Int   := 20;
   Float_Test1 : Some_Float := -1.0;
   Float_Test2 : Some_Float := -2.0;
begin
   Put_Line_Int (Int_Test1, Int_Test2);
   Generic_Package.Swap (Int_Test1, Int_Test2);
   Put_Line_Int (Int_Test1, Int_Test2);

   Ada.Text_IO.Put ("Min value: ");
   Put_Line_Int (Generic_Package.Min (Int_Test1, Int_Test2));

   Ada.Text_IO.Put ("Max value: ");
   Put_Line_Int (Generic_Package.Max (Int_Test1, Int_Test2));

   Put_Line_Float (Float_Test1, Float_Test2);
   Generic_Package.Swap (Float_Test1, Float_Test2);
   Put_Line_Float (Float_Test1, Float_Test2);

   Ada.Text_IO.Put ("Min value: ");
   Put_Line_Float (Generic_Package.Min (Float_Test1, Float_Test2));

   Ada.Text_IO.Put ("Max value: ");
   Put_Line_Float (Generic_Package.Max (Float_Test1, Float_Test2));
end Generic_Main;
