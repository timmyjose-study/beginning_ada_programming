-- Subtypes are specialisations of an existing type.

with Ada.Text_IO;

procedure Limited_Integer is
   subtype Menu_Selection_Value is Integer range 1 .. 6;

   -- specialise the input methods for this subtype
   package Menu_Input is new Ada.Text_IO.Integer_IO
     (Num => Menu_Selection_Value);

   Selection : Menu_Selection_Value := 1;
begin
   Main_Menu :
   loop
      Ada.Text_IO.Put_Line ("--- Healthy Menu Restaurant (TM) ---");
      Ada.Text_IO.Put_Line (" - 1 - Order Apples");
      Ada.Text_IO.Put_Line (" - 2 - Order Pears");
      Ada.Text_IO.Put_Line (" - 3 - Order Oranges");
      Ada.Text_IO.Put_Line (" - 4 - Order Cantaloupes");
      Ada.Text_IO.Put_Line (" - 5 - Order Bananas");
      Ada.Text_IO.Put_Line (" - 6 - Exit");
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put ("Enter your poison of choice: ");

      Main_Menu_Input :
      declare
      begin
         Menu_Input.Get
           (Selection); -- uses the custom input defined for the new subtype
         Ada.Text_IO.New_Line;

         case Selection is
            when 1 =>
               Ada.Text_IO.Put_Line ("Apples? Decent choice!");
               Ada.Text_IO.New_Line;
            when 2 =>
               Ada.Text_IO.Put_Line ("Pears? You are a person of class!");
               Ada.Text_IO.New_Line;
            when 3 =>
               Ada.Text_IO.Put_Line ("Oranges? Excellent choice!");
               Ada.Text_IO.New_Line;
            when 4 =>
               Ada.Text_IO.Put_Line ("Cantaloupes? You monster!");
               Ada.Text_IO.New_Line;
            when 5 =>
               Ada.Text_IO.Put_Line ("Bananas? Kinky!");
               Ada.Text_IO.New_Line;
            when 6 =>
               Ada.Text_IO.Put_Line ("Adios!");
               exit Main_Menu;
            when others =>
               Ada.Text_IO.Put_Line ("Impossibru!");
         end case;
      exception
         when others =>
            Ada.Text_IO.New_Line;
            Ada.Text_IO.Put_Line ("Error: Value must be in the range 1 - 6");
            Ada.Text_IO.New_Line (2);
      end Main_Menu_Input;
   end loop Main_Menu;
end Limited_Integer;
