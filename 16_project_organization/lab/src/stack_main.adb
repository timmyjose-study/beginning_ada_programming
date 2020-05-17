with Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with Stack;

procedure Stack_Main is
   package Stack_10_Int is new Stack (Max => 10,
      Element_Type                               => Integer);

   package Random_Int is new Ada.Numerics.Discrete_Random
     (Result_Subtype => Integer);
   Random_Int_Generator : Random_Int.Generator;

   function Generate_Random_Number return Integer is
   begin
      Random_Int.Reset (Gen => Random_Int_Generator);
      return Random_Int.Random (Gen => Random_Int_Generator);
   end Generate_Random_Number;
begin
   Ada.Text_IO.Put_Line
     ("Is stack empty? " & Boolean'Image (Stack_10_Int.Is_Empty));

   for Iter in 1 .. 5 loop
      declare
         Random_Val : Integer := Generate_Random_Number;
      begin
         Ada.Text_IO.Put_Line ("Pushing value: " & Integer'Image (Random_Val));
         Stack_10_Int.Push (Random_Val);
      end;
   end loop;

   Ada.Text_IO.Put_Line
     ("The top element of the stack is " & Integer'Image (Stack_10_Int.Top));

   while not Stack_10_Int.Is_Full loop
      declare
         Random_Val : Integer := Generate_Random_Number;
      begin
         Ada.Text_IO.Put_Line ("Pushing " & Integer'Image (Random_Val));
         Stack_10_Int.Push (Random_Val);
      end;
   end loop;

   Ada.Text_IO.Put_Line
     ("Is stack full? " & Boolean'Image (Stack_10_Int.Is_Full));
   Ada.Text_IO.Put_Line
     ("Size of stack = " & Natural'Image (Stack_10_Int.Size) &
      ", and the top element is now " & Integer'Image (Stack_10_Int.Top));

   Ada.Text_IO.Put_Line
     ("Size of the stack = " & Natural'Image (Stack_10_Int.Size));

   while not Stack_10_Int.Is_Empty loop
      declare
         Popped_Val : Integer := Stack_10_Int.Pop;
      begin
         Ada.Text_IO.Put_Line ("Popped: " & Integer'Image (Popped_Val));
      end;
   end loop;

   Ada.Text_IO.Put_Line
     ("Is stack empty? " & Boolean'Image (Stack_10_Int.Is_Empty));

   -- test out the exceptions
   declare
   begin
      Ada.Text_IO.Put_Line (Integer'Image (Stack_10_Int.Pop));
   exception
      when Stack_10_Int.Stack_Empty_Error =>
         Ada.Text_IO.Put_Line
           (Ada.Text_IO.Standard_Error, "stack is empty - cannot pop");
      when others =>
         Ada.Text_IO.Put_Line
           ("Something else went wrong while popping stack");
   end;

   declare
   begin
      while not Stack_10_Int.Is_Full loop
         Stack_10_Int.Push (Generate_Random_Number);
      end loop;

      Stack_10_Int.Push (Generate_Random_Number);
   exception
      when Stack_10_Int.Stack_Full_Error =>
         Ada.Text_IO.Put_Line
           (Ada.Text_IO.Standard_Error, "stack is full - cannot push");
      when others =>
         Ada.Text_IO.Put_Line
           ("Something else went wrong while pushing onto stack");
   end;
end Stack_Main;
