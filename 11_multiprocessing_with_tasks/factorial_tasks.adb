with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Factorial_Tasks is
   task type Factorial_Task (Id : Positive) is
      entry Input (Value : in Natural; Delay_Time : in Duration);
      entry Output (Value : out Positive);
   end Factorial_Task;

   task body Factorial_Task is
      N : Natural  := 0;
      F : Positive := 1;

      function Factorial (N : in Natural) return Positive is
      begin
         if N = 0 then
            return 1;
         else
            return N * Factorial (N - 1);
         end if;
      end Factorial;
   begin
      accept Input (Value : in Natural; Delay_Time : in Duration) do
         N := Value;
         delay Delay_Time;
         F := Factorial (N);
      end Input;

      accept Output (Value : out Positive) do
         Value := F;
      end Output;
   end Factorial_Task;

   M, N, O       : Natural  := 0;
   M_F, N_F, O_F : Positive := 1;

   Task_1 : Factorial_Task (Id => 1);
   Task_2 : Factorial_Task (Id => 2);
   Task_3 : Factorial_Task (Id => 3);
begin
   Ada.Text_IO.Put_Line ("Enter three numbers...");
   Ada.Integer_Text_IO.Get (M);
   Ada.Integer_Text_IO.Get (N);
   Ada.Integer_Text_IO.Get (O);

   select
      Task_1.Input (Value => M, Delay_Time => 2.9);
      Task_1.Output (Value => M_F);
      Ada.Text_IO.Put_Line
        (Integer'Image (Task_1.Id) & "- " & "The factorial of " &
         Natural'Image (M) & " is " & Positive'Image (M_F));
   or
      delay 1.0;
      Ada.Text_IO.Put_Line
        ("Task " & Positive'Image (Task_1.Id) &
         " took too long to complete task");
   end select;

   select
      Task_2.Input (Value => N, Delay_Time => Duration (3.2));
      Task_2.Output (Value => N_F);
      Ada.Text_IO.Put_Line
        (Integer'Image (Task_2.Id) & "- " & "The factorial of " &
         Natural'Image (N) & " is " & Positive'Image (N_F));
   or
      delay 0.5;
      Ada.Text_IO.Put_Line
        ("Task " & Positive'Image (Task_1.Id) &
         " took too long to complete task");
   end select;

   select
      Task_3.Input (Value => O, Delay_Time => 0.0);
      Task_3.Output (Value => O_F);
      Ada.Text_IO.Put_Line
        (Integer'Image (Task_3.Id) & "- " & "The factorial of " &
         Natural'Image (O) & " is " & Positive'Image (O_F));
   or
      delay 0.1;
      Ada.Text_IO.Put_Line
        ("Task " & Positive'Image (Task_1.Id) &
         " took too long to complete task");
   end select;
end Factorial_Tasks;
