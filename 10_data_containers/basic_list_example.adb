with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Containers.Doubly_Linked_Lists;

procedure Basic_List_Example is
   package Number_List is new Ada.Containers.Doubly_Linked_Lists
     (Element_Type => Integer);

   Numbers : Number_List.List;

   procedure Populate_List (List : in out Number_List.List) is
      Command : Natural := 0;
   begin
      loop
         declare
            Number : Integer;
         begin
            Ada.Text_IO.Put
              ("Enter your choice (0 - Quit, 1 - Append at end 2 - Append at front: )");
            Ada.Integer_Text_IO.Get (Command);

            exit when Command = 0;

            Ada.Integer_Text_IO.Get (Number);

            case Command is
               when 1 =>
                  List.Append (New_Item => Number);
               when 2 =>
                  List.Prepend (New_Item => Number);
               when others =>
                  Ada.Text_IO.Put_Line ("Don't be ridiculous!");
            end case;
         end;
      end loop;
   end Populate_List;

   procedure Display_List (Position : Number_List.Cursor) is
   begin
      -- "this" is implicit
      Ada.Text_IO.Put_Line
        ("Item => " & Integer'Image (Number_List.Element (Position)));
   end Display_List;
begin
   Populate_List (Numbers);
   Numbers.Iterate (Display_List'Access);
end Basic_List_Example;
