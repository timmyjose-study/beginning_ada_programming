with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;
with Ada.Characters.Handling;

procedure String_Manipulations is
   procedure To_Lower (S : in out Ada.Strings.Unbounded.Unbounded_String) is
   begin
      S :=
        Ada.Strings.Unbounded.To_Unbounded_String
          (Ada.Characters.Handling.To_Lower
             (Ada.Strings.Unbounded.To_String (S)));
   end To_Lower;

   procedure To_Upper (S : in out Ada.Strings.Unbounded.Unbounded_String) is
   begin
      S :=
        Ada.Strings.Unbounded.To_Unbounded_String
          (Ada.Characters.Handling.To_Upper
             (Ada.Strings.Unbounded.To_String (S)));
   end To_Upper;

   S1 : Ada.Strings.Unbounded.Unbounded_String :=
     Ada.Strings.Unbounded.Null_Unbounded_String;
   S2 : Ada.Strings.Unbounded.Unbounded_String :=
     Ada.Strings.Unbounded.Null_Unbounded_String;
begin
   Ada.Text_IO.Put ("Enter the first string: ");
   S1 := Ada.Text_IO.Unbounded_IO.Get_Line;

   Ada.Text_IO.Put ("Enter the second string: ");
   S2 := Ada.Text_IO.Unbounded_IO.Get_Line;

   Ada.Text_IO.Put_Line
     ("Before case-changing, S1 is " & Ada.Strings.Unbounded.To_String (S1) &
      ", and S2 is " & Ada.Strings.Unbounded.To_String (S2));
   To_Lower (S1);
   To_Upper (S2);

   Ada.Text_IO.Put_Line
     ("After case-changing, S1 is " & Ada.Strings.Unbounded.To_String (S1) &
      ", and S2 is " & Ada.Strings.Unbounded.To_String (S2));
end String_Manipulations;
