with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;

procedure Return_Polymorphism is
   function Return_Value return Integer is
   begin
      return 42;
   end Return_Value;

   function Return_Value return Float is
   begin
      return 2.718128;
   end Return_Value;

   function Return_Value return Ada.Strings.Unbounded.Unbounded_String is
   begin
      return Ada.Strings.Unbounded.To_Unbounded_String ("Hello!");
   end Return_Value;

   Int_Val    : Integer                                := 0;
   Float_Val  : Float                                  := 0.0;
   String_Val : Ada.Strings.Unbounded.Unbounded_String :=
     Ada.Strings.Unbounded.Null_Unbounded_String;
begin
   Int_Val     := Return_Value;
   Float_Val   := Return_Value;
   String_Val := Return_Value;

   Ada.Integer_Text_IO.Put (Int_Val);
   Ada.Text_IO.New_Line;
   Ada.Float_Text_IO.Put (Float_Val, Aft => 2, Exp => 0);
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Unbounded_IO.Put (String_Val);
   Ada.Text_IO.New_Line;
end Return_Polymorphism;
