with Ada.Text_IO;

procedure Protected_Types is
   -- the protected type (for shared memory access - basically a mutex)
   protected type Protected_Value is
      entry Insert (An_Item : in Integer);
      entry Retrieve (An_Item : out Integer);
   private
      Counter    : Integer; -- the actual item being "protected"
      Accessible : Boolean := True;
   end Protected_Value;

   protected body Protected_Value is
      entry Insert (An_Item : in Integer) when Accessible is
      begin
         Accessible := False;
         Counter    := An_Item;
      end Insert;

      entry Retrieve (An_Item : out Integer) when not Accessible is
      begin
         Accessible := True;
         An_Item    := Counter;
      end Retrieve;
   end Protected_Value;

   Protected_01 : Protected_Value;

-- the task type that will work on a protected value

   task type Protected_Access (Identifier : Integer) is
      entry Start (Value : in Integer);
      entry Quit;
   end Protected_Access;

   task body Protected_Access is
      Go_Loop           : Boolean := True;
      Task_Custom_Value : Integer := 0;
      Task_Return_Value : Integer := 0;
      Serial_Number     : Integer := Identifier;
   begin
      accept Start (Value : in Integer) do
         Ada.Text_IO.Put_Line ("Starting the task");
         Task_Custom_Value := Value;
      end Start;

      while Go_Loop loop
         select
            accept Quit do
               Ada.Text_IO.Put_Line ("Task is requested to exit");
               Go_Loop := False;
            end Quit;
         else
            select
               Protected_01.Insert
                 (An_Item =>
                    Task_Custom_Value); -- entering the critical region
               delay 0.1; -- this is the critical region
               Protected_01.Retrieve
                 (An_Item => Task_Return_Value); -- exiting the critical region
               Ada.Text_IO.Put_Line
                 ("Return value is " & Integer'Image (Task_Return_Value) &
                  " for task " & Integer'Image (Serial_Number));
            or
               delay 0.5;
               Ada.Text_IO.Put_Line
                 ("ERROR! Could not acquire resource just yet...");
            end select;
         end select;
      end loop;
   end Protected_Access;

   Task_1 : Protected_Access (Identifier => 1);
   Task_2 : Protected_Access (Identifier => 2);
   Task_3 : Protected_Access (Identifier => 3);
   Task_4 : Protected_Access (Identifier => 4);
   Task_5 : Protected_Access (Identifier => 5);
begin
   Task_1.Start (Value => 1);
   Task_2.Start (Value => 2);
   Task_3.Start (Value => 3);
   Task_4.Start (Value => 4);
   Task_5.Start (Value => 5);

   delay 2.0;

   Task_1.Quit;
   Task_2.Quit;
   Task_3.Quit;
   Task_4.Quit;
   Task_5.Quit;
end Protected_Types;
