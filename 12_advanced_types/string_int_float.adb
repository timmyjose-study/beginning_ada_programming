with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;

procedure String_Int_Float is
   Sample_Int   : Integer := 199;
   Sample_Float : Float   := 2.71828;

   String_Integer : String := "1918";
   String_Float   : String := "1.1414578";

   Int_Out   : Integer := 0;
   Float_Out : Float   := 0.0;
begin
   Ada.Text_IO.Put_Line (Integer'Image (Sample_Int));
   Ada.Text_IO.Put_Line (Float'Image (Sample_Float));

   Int_Out := Integer'Value (String_Integer);
   Ada.Integer_Text_IO.Put (Int_Out);

   Float_Out := Float'Value (String_Float);
   Ada.Float_Text_IO.Put (Float_Out, Fore => 5, Aft => 5, Exp => 0);
end String_Int_Float;
