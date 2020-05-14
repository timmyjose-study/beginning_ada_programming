package body Shape is
   function Get_Area (S : in Shape) return Float is
   begin
      Ada.Text_IO.Put_Line
        (Ada.Text_IO.Standard_Error, "This function should not be called");
      return 0.0;
   end Get_Area;

   function Get_Perimeter (S : in Shape) return Float is
   begin
      Ada.Text_IO.Put_Line
        (Ada.Text_IO.Standard_Error, "This function should not be called");
      return 0.0;
   end Get_Perimeter;

   procedure Print_Description (S: in Shape) is
   begin
     Ada.Text_IO.Put_Line (Ada.Text_IO.Standard_Error, "This function should not be called");
   end Print_Description;
end Shape;
