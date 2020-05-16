with Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with Queue;

procedure Lab2 is
   type Custom_Int is range 1 .. 100;
   package Q_100_Int is new Queue (Max => 100, T => Custom_Int,
      Image                            => Custom_Int'Image);

   package Random_Int is new Ada.Numerics.Discrete_Random
     (Result_Subtype => Custom_Int);

   function Generate_Random_Number return Custom_Int is
      Gen : Random_Int.Generator;
   begin
      Random_Int.Reset (Gen => Gen);
      return Random_Int.Random (Gen => Gen);
   end Generate_Random_Number;
begin
   Ada.Text_IO.Put_Line
     ("Is the queue empty? " & Boolean'Image (Q_100_Int.Is_Empty));

   for Iter in 1 .. 5 loop
      declare
         Random_Val : Custom_Int := Generate_Random_Number;
      begin
         Ada.Text_IO.Put_Line ("Enqueuing " & Custom_Int'Image (Random_Val));
         Q_100_Int.Enqueue (New_Item => Random_Val);
      end;
   end loop;

   Ada.Text_IO.Put_Line
     ("The current length of the queue is " &
      Integer'Image (Q_100_Int.Length) & ", and it's current state is ...");
   Q_100_Int.Show_Queue;

   for Iter in 1 .. 94 loop
      Q_100_Int.Enqueue (Generate_Random_Number);
   end loop;

   declare
   begin
      Q_100_Int.Enqueue (Generate_Random_Number);
   exception
      when Q_100_Int.Queue_Full =>
         Ada.Text_IO.Put_Line
           ("Error: Queue is full, cannot enqueue any more elements");
      when others =>
         Ada.Text_IO.Put_Line ("Error: something else went wrong");
   end;

   Ada.Text_IO.Put_Line
     ("Is the queue full? " & Boolean'Image (Q_100_Int.Is_Full));
   Ada.Text_IO.Put_Line
     ("Queue length is " & Positive'Image (Q_100_Int.Length) &
      ", and it is ...");

   Q_100_Int.Show_Queue;
   while not Q_100_Int.Is_Empty loop
      Ada.Text_IO.Put_Line ("Dequeuing " & Custom_Int'Image (Q_100_Int.Dequeue));
   end loop;

   Ada.Text_IO.Put_Line
     ("Is the queue empty? " & Boolean'Image (Q_100_Int.Is_Empty));
   Ada.Text_IO.Put_Line
     ("Length of the queue  = " & Positive'Image (Q_100_Int.Length));
end Lab2;
