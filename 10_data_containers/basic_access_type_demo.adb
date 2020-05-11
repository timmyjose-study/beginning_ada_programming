with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;

procedure Basic_Access_Type_Demo is
  type Integer_Access is access all Integer;

  type Point is record
    X: Integer_Access;
    Y: Integer_Access;
  end record;

  type Point_Access is access Point;

  procedure Deallocate is new Ada.Unchecked_Deallocation (Point, Point_Access);
  procedure Deallocate is new Ada.Unchecked_Deallocation (Integer, Integer_Access);

  P: Point_Access;
begin
  P := new Point'((X => new Integer'(100), Y => new Integer'(200)));
  Ada.Text_IO.Put_Line ("Point { X = " & Integer'Image (P.all.X.all) & ", Y = " & Integer'Image (P.all.Y.all) & " }");

  Deallocate (P.X);
  Deallocate (P.Y);
  Deallocate (P);
end Basic_Access_Type_Demo;