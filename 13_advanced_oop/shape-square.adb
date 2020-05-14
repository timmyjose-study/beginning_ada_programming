package body Shape.Square is
   function Init_Square
     (Name : Ada.Strings.Unbounded.Unbounded_String; Side : Float)
      return Square
   is
      S : Square;
   begin
      S.Name := Name;
      S.Side := Side;

      return S;
   end Init_Square;

   function Get_Area (S : in Square) return Float is
   begin
      return S.Side * S.Side;
   end Get_Area;

   function Get_Perimeter (S : in Square) return Float is
   begin
      return 4.0 * S.Side;
   end Get_Perimeter;

   procedure Print_Description (
     S: in Square
     ) is
   begin
     Ada.Text_IO.Put_Line ("Name : " & Ada.Strings.Unbounded.To_String (S.Name));
     Ada.Text_IO.Put ("Side: ");
     Ada.Float_Text_IO.Put (S.Side, Aft => 2, Exp => 0);
     Ada.Text_IO.New_Line;
     Ada.Text_IO.Put ("Area = ");
     Ada.Float_Text_IO.Put (Get_Area (S), Aft => 2, Exp => 0);
     Ada.Text_IO.New_Line;
     Ada.Text_IO.Put ("Perimeter = ");
     Ada.Float_Text_IO.Put (Get_Perimeter (S), Aft => 2, Exp => 0);
     Ada.Text_IO.New_Line;
   end Print_Description;
end Shape.Square;
