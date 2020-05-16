with Ada.Text_IO;

generic
   Max : Positive;
   type T is private;
   with function Image (Item : T) return String;
package Queue is
   Queue_Full  : exception;
   Queue_Empty : exception;

   procedure Show_Queue;
   function Is_Full return Boolean;
   function Is_Empty return Boolean;
   function Length return Natural;
   procedure Enqueue (New_Item : T);
   function Dequeue return T;
end Queue;
