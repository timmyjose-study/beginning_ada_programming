with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Calculator; use Calculator;

procedure Calculator_Main is
   X, Y   : Integer;
   Choice : Integer range 1 .. 5;
begin
   Main_Loop :
   loop
      declare
      begin
         Ada.Text_IO.New_Line;
         Ada.Text_IO.Put ("Enter the first number: ");
         Ada.Integer_Text_IO.Get (X);

         Ada.Text_IO.Put ("Enter the second number: ");
         Ada.Integer_Text_IO.Get (Y);
         Ada.Text_IO.Put_Line (" -- Enter your choice of operation --");
         Ada.Text_IO.Put_Line ("- 1 Add");
         Ada.Text_IO.Put_Line ("- 2 Subtract");
         Ada.Text_IO.Put_Line ("- 3 Multiply");
         Ada.Text_IO.Put_Line ("- 4 Divide");
         Ada.Text_IO.Put_Line ("- 5 Exit");

         Ada.Integer_Text_IO.Get (Choice);

         case Choice is
            when 1 =>
               Ada.Integer_Text_IO.Put (Add (X, Y));
            when 2 =>
               Ada.Integer_Text_IO.Put (Sub (X, Y));
            when 3 =>
               Ada.Integer_Text_IO.Put (Mul (X, Y));
            when 4 =>
               Ada.Integer_Text_IO.Put (Div (X, Y));
            when 5 =>
               exit Main_Loop;
         end case;

      exception
         when others =>
            Ada.Text_IO.Put_Line ("Don't be ridiculous");
      end;
   end loop Main_Loop;
end Calculator_Main;
