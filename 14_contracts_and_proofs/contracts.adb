with Ada.Text_IO;

package body Contracts is
   procedure Simulate is
   begin
      for Iter in 1 .. 423 loop
         Label_Bottles;

         if Iter rem Bottles_In_A_Box = 0 then
            Packaging_Block :
            declare
            begin
               Package_Bottles;
            exception
               when Constraint_Error =>
                  Ada.Text_IO.Put_Line
                    (Ada.Text_IO.Standard_Error,
                     "Error: constraint error - contract violated");
               when others =>
                  Ada.Text_IO.Put_Line
                    (Ada.Text_IO.Standard_Error,
                     "Error: something else went wrong");
            end Packaging_Block;
         end if;
      end loop;
      Print_Report;
   end Simulate;

   procedure Label_Bottles is
   begin
      Bottles_Finished := Bottles_Finished + 1;
   end Label_Bottles;

   procedure Package_Bottles is
   begin
      Bottles_Finished := Bottles_Finished - Bottles_In_A_Box;
      Boxes_Packed     := Boxes_Packed + 1;
   end Package_Bottles;

   procedure Print_Report is
   begin
      Ada.Text_IO.Put_Line ("--- Current Report ---");
      Ada.Text_IO.Put_Line
        (" Bottles finished: " & Natural'Image (Bottles_Finished));
      Ada.Text_IO.Put_Line (" Boxes packed: " & Natural'Image (Boxes_Packed));
      Ada.Text_IO.New_Line;
   end Print_Report;
end Contracts;
