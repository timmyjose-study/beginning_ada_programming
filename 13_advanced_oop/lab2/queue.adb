package body Queue is
   Q     : array (1 .. Max) of T;
   F_Idx : Natural := 1;
   R_Idx : Natural := 1;

   procedure Show_Queue is
   begin
      if Is_Empty then
         raise Queue_Empty;
      end if;

      for Idx in F_Idx .. R_Idx - 1 loop
         Ada.Text_IO.Put (Image (Q (Idx)));
      end loop;
      Ada.Text_IO.New_Line;
   end Show_Queue;

   function Is_Empty return Boolean is
   begin
      return F_Idx = R_Idx;
   end Is_Empty;

   function Is_Full return Boolean is
   begin
      return R_Idx = Max + 1;
   end Is_Full;

   function Length return Natural is
   begin
      return R_Idx - F_Idx;
   end Length;

   procedure Enqueue (New_Item : T) is
   begin
      if Is_Full then
         raise Queue_Full;
      end if;

      Q (R_Idx) := New_Item;
      R_Idx     := R_Idx + 1;
   end Enqueue;

   function Dequeue return T is
      Ret : T;
   begin
      if Is_Empty then
         raise Queue_Empty;
      end if;

      Ret   := Q (F_Idx);
      F_Idx := F_Idx + 1;

      return Ret;
   end Dequeue;
end Queue;
