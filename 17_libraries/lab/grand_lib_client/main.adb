with Ada.Text_IO;
with Ada.Float_Text_IO;

with Grand;

procedure Main is
begin
   for Iter in 1 .. 5 loop
      Ada.Text_IO.Put_Line
        ("A random integer: " & Integer'Image (Grand.Generate_Random_Integer));
      Ada.Text_IO.Put_Line
        ("A random natural: " & Integer'Image (Grand.Generate_Random_Natural));
      Ada.Text_IO.Put_Line
        ("A random positive: " &
         Integer'Image (Grand.Generate_Random_Positive));
      Ada.Text_IO.Put ("A random float: ");
      Ada.Float_Text_IO.Put (Grand.Generate_Random_Float, Aft => 2, Exp => 0);
      Ada.Text_IO.New_Line (2);
   end loop;
end Main;
