with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Containers.Vectors;
with Ada.Unchecked_Deallocation;

procedure Vector_Of_Points is
  subtype Point_Integer is Integer range -1000 .. 1000;

  type Point_Integer_Access is access Point_Integer;

  type Point is record
    X: Point_Integer_Access;
    Y: Point_Integer_Access;
  end record;

  type Point_Access is access Point;

  procedure Deallocate is new Ada.Unchecked_Deallocation (Point, Point_Access);
  procedure Deallocate is new Ada.Unchecked_Deallocation (Point_Integer, Point_Integer_Access);

  package Point_Vector is new Ada.Containers.Vectors (
  Index_Type => Positive,
  Element_Type => Point_Access
  );

  Points: Point_Vector.Vector;

  procedure Read_Points (Points: in out Point_Vector.Vector) is
    Num_Elements: Natural := 0;
  begin
    Ada.Text_IO.Put ("Enter the number of elements: ");
    Ada.Integer_Text_IO.Get (Num_Elements);

    for Iter in 1 .. Num_Elements loop
      declare 
        X: Point_Integer;
        Y: Point_Integer;
        P_Acc: Point_Access;
      begin
        Ada.Text_IO.Put ("Enter the X value: ");
        Ada.Integer_Text_IO.Get (X);
        Ada.Text_IO.Put ("Enter the Y value: ");
        Ada.Integer_Text_IO.Get (Y);

        P_Acc := new Point'((X => new Point_Integer'(X), Y => new Point_Integer'(Y)));
        Points.Append (New_Item => P_Acc);
      end;
    end loop;
  end Read_Points;

  procedure Display_Points (Points: in Point_Vector.Vector) is
  begin
    for Idx in 1 .. Points.Length loop
      declare
        P: Point_Access := Points.Element (Index => Positive (Idx));
      begin
        Ada.Text_IO.Put ("Point { X = " & Integer'Image (P.all.X.all) & ", Y = " & Integer'Image (P.all.Y.all) & " }");
      end;
    end loop;
  end Display_Points;

  procedure Deallocate_Points (Points: in out Point_Vector.Vector) is
  begin
    for Idx in 1 .. Points.Length loop
      Deallocate (Points.Element (Index => Positive (Idx)).X);
      Deallocate (Points.Element (Index => Positive (Idx)).Y);
      -- IMPORTANT: this little indirection is apparently necessary otherwise we get the dreaded
      -- actual for --- must be a variable.
     -- declare
     --   P: Point_Access := Points.Element (Index => Positive (Idx));
     -- begin
     --   Deallocate (P);
     -- end;
     Deallocate (Points (Index => Positive (Idx)));
    end loop;
  end Deallocate_Points;
begin
  Read_Points (Points);
  Display_Points (Points);
  Deallocate_Points (Points);
end Vector_Of_Points;