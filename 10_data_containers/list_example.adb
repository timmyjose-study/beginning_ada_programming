with Ada.Text_IO;
with Ada.Containers.Doubly_Linked_Lists;

procedure List_Example is
  package Wagon_List is new Ada.Containers.Doubly_Linked_Lists (Element_Type => Integer);
  
  Wagons: Wagon_List.List;

  procedure Populate_List (List: in out Wagon_List.List) is
  begin
    List.Append (New_Item => 1);
    List.Append (New_Item => 2);
    List.Append (New_Item => 5);
    List.Append (New_item => 7);
    List.Insert (Before => List.Find (5), New_Item => 4);
    List.Insert (Before => list.Find (4), new_Item => 3);
    List.Insert (before => List.Reverse_Find (7), New_Item => 6);
  end Populate_list;

  procedure Display_List (Position: in Wagon_List.Cursor) is
  begin
    Ada.Text_IO.Put_Line ("Item printed => " & Integer'Image (Wagon_List.Element (Position)));
  end Display_List;
begin
  Populate_List (Wagons);
  -- functional programming!
  Wagons.Iterate (Display_List'Access);
end List_Example;