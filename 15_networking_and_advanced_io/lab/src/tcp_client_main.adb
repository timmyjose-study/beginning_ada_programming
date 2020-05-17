with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;
with Ada.Streams;
use type Ada.Streams.Stream_Element_Offset;

with GNAT.Sockets;

procedure TCP_Client_Main is
   Address : GNAT.Sockets.Sock_Addr_Type :=
     (GNAT.Sockets.Family_Inet, GNAT.Sockets.Inet_Addr ("127.0.0.1"), 50000);
   Socket  : GNAT.Sockets.Socket_Type;
   Channel : GNAT.Sockets.Stream_Access;

   Data : Ada.Strings.Unbounded.Unbounded_String :=
     Ada.Strings.Unbounded.Null_Unbounded_String;
begin
   GNAT.Sockets.Create_Socket (Socket);
   GNAT.Sockets.Connect_Socket (Socket, Address);
   Channel := GNAT.Sockets.Stream (Socket);

   Ada.Text_IO.Put_Line ("Enter the message you'd like to send the server:");
   Data := Ada.Text_IO.Unbounded_IO.Get_Line;

   declare
      Offset      : Ada.Streams.Stream_Element_Offset := 1;
      Data_Fixed  : constant String := Ada.Strings.Unbounded.To_String (Data);
      Data_Stream : Ada.Streams.Stream_Element_Array (1 .. Data_Fixed'Length);
   begin
      for Idx in Data_Fixed'Range loop
         Data_Stream (Offset) :=
           Ada.Streams.Stream_Element (Character'Pos (Data_Fixed (Idx)));
         Offset := Offset + 1;
      end loop;
      Ada.Streams.Write (Channel.all, Data_Stream);
   end;
   GNAT.Sockets.Close_Socket (Socket);
end TCP_Client_Main;
