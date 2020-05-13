with Ada.Text_IO;
with Ada.Strings.Fixed;

procedure Custom_String_Cast is
   subtype Currency_String is String (1 .. 3);

   US_Dollar         : Currency_String := "USD";
   Euro              : Currency_String := "EUR";
   British_Pound     : Currency_String := "GPB";
   Japan_Yen         : Currency_String := "JPY";
   Australian_Dollar : Currency_String := "AUD";
   HongKong_Dollar   : Currency_String := "HKD";
   NewZealand_Dollar : Currency_String := "NZD";
   Singapore_Dollar  : Currency_String := "SGD";
   --Dumplng: Currency_String := "DUMPL"; -- compile time error
begin
   Ada.Text_IO.Put_Line
     ("US Dollar country code: " & Ada.Strings.Fixed.Head (US_Dollar, 2));
   Ada.Text_IO.Put_Line
     ("Euro country code: " & Ada.Strings.Fixed.Head (Euro, 2));
   Ada.Text_IO.Put_Line
     ("Britsh Pound country code: " &
      Ada.Strings.Fixed.Head (British_Pound, 2));
   Ada.Text_IO.Put_Line
     ("Japan Yen country code: " & Ada.Strings.Fixed.Head (Japan_Yen, 2));
   Ada.Text_IO.Put_Line
     ("Australian dollar country code" &
      Ada.Strings.Fixed.Head (Australian_Dollar, 2));
   Ada.Text_IO.Put_Line
     ("Hong Kong dollar country code: " &
      Ada.Strings.Fixed.Head (HongKong_Dollar, 2));
   Ada.Text_IO.Put_Line
     ("New Zealand dollar country code: " &
      Ada.Strings.Fixed.Head (NewZealand_Dollar, 2));
   Ada.Text_IO.Put_Line
     ("Singapore dollar country code: " &
      Ada.Strings.Fixed.Head (Singapore_Dollar, 2));

   Ada.Text_IO.Put_Line 
    ("US Dollar length = " & Integer'Image (US_Dollar'Length));
end Custom_String_Cast;
