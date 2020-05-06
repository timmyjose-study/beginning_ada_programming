with Ada.Text_IO;
with Ada.Unchecked_Deallocation;

procedure Access_Type_Example is
  type Int_Access is access all Integer;
  type Float_Access is access all Float;
  type String_Access is access all String;

  type Test_Rec is record
    Int_Point: Int_Access;
    Float_Point: Float_Access;
    String_Point: String_Access;
  end record;

  -- access type for the record

  type Rec_Access is access Test_Rec;
  Rec_Point: Rec_Access;
  Backup_Ac: Rec_Access;

  Test_Int: aliased Integer := 94;

  -- Overloaded functions for deallocation (explicit)
  procedure Deallocate is new Ada.Unchecked_Deallocation (Test_Rec, Rec_Access);
  procedure Deallocate is new Ada.Unchecked_Deallocation (String, String_Access);
  procedure Deallocate is new Ada.Unchecked_Deallocation (Integer, Int_Access);
  procedure Deallocate is new Ada.Unchecked_Deallocation (Float, Float_Access);
begin
  -- allocate the access types
  Rec_Point := new Test_Rec;
  Rec_Point.Int_Point := Test_Int'Access; -- pointer to Test_Int (analogous to &Test_Int in C)
  Rec_Point.Float_Point := new float'(0.0); -- normal syntax for allocating access types
  Rec_Point.String_Point := new String'("Hello, world");

  Backup_Ac := Rec_Point; -- aliased pointer

  -- print contents by dereferencing the access types
  Ada.Text_IO.Put_Line ("The contents of our dynamically allocated record...");
  Ada.Text_IO.Put_Line ("    Integer: " & Integer'Image (Backup_Ac.Int_Point.all));
  Ada.Text_IO.Put_Line ("    Float: " & Float'Image (Backup_Ac.Float_Point.all));
  Ada.Text_IO.Put_Line ("    String: " & Backup_Ac.String_Point.all);

  Backup_Ac.Int_Point.all := 100;
  Backup_Ac.Float_Point.all := 1.2345;
  Backup_Ac.String_Point.all := "Hello, Ada!!";

  -- print out contents of memory again
  Ada.Text_IO.Put_Line ("The contents of our dynamically allocated record...");
  Ada.Text_IO.Put_Line ("    Integer: " & Integer'Image (Backup_Ac.Int_Point.all));
  Ada.Text_IO.Put_Line ("    Float: " & Float'Image (Backup_Ac.Float_Point.all));
  Ada.Text_IO.Put_Line ("    String: " & Backup_Ac.String_Point.all);

  -- print out contents of memory again - should be identical to that already printed above
  Ada.Text_IO.Put_Line ("The contents of our dynamically allocated record...");
  Ada.Text_IO.Put_Line ("    Integer: " & Integer'Image (Rec_Point.Int_Point.all));
  Ada.Text_IO.Put_Line ("    Float: " & Float'Image (Rec_Point.Float_Point.all));
  Ada.Text_IO.Put_Line ("    String: " & Rec_Point.String_Point.all);

  -- deallocate the access types
  -- the Int_Point cannot be deallocated since it is aliased
  --Deallocate (Rec_Point.Int_Point);
  Deallocate (Rec_Point.Float_Point);
  Deallocate (Rec_Point.String_Point);
  Deallocate (Rec_Point);

  -- this should not compile
  Ada.Text_IO.Put_Line ("The contents of our dynamically allocated record...");
  -- this should raise a constraint error since the aliased pointer has been deallocated (but does not, for some reason - check on this)
  Ada.Text_IO.Put_Line ("    Integer: " & Integer'Image (Backup_Ac.Int_Point.all));
end Access_Type_Example;