with Ada.Text_IO;
with Ada.IO_Exceptions;
with Ada.Streams;
use type Ada.Streams.Stream_Element_Count;

with GNAT.Sockets;

procedure TCP_Server_Main is
   Receiver   : GNAT.Sockets.Socket_Type;
   Connection : GNAT.Sockets.Socket_Type;
   Client     : GNAT.Sockets.Sock_Addr_Type;
   Channel    : GNAT.Sockets.Stream_Access;

   Server_Data : constant String := "I like cake!";
   Offset      : Ada.Streams.Stream_Element_Count;
   Client_Data : Ada.Streams.Stream_Element_Array (1 .. 256);
begin
   GNAT.Sockets.Create_Socket
     (Receiver, GNAT.Sockets.Family_Inet, GNAT.Sockets.Socket_Stream);
   GNAT.Sockets.Set_Socket_Option
     (Receiver, GNAT.Sockets.Socket_Level, (GNAT.Sockets.Reuse_Address, True));
   GNAT.Sockets.Bind_Socket
     (Receiver,
      (GNAT.Sockets.Family_Inet, GNAT.Sockets.Inet_Addr ("127.0.0.1"), 50000));
   GNAT.Sockets.Listen_Socket (Receiver);

   Ada.Text_IO.Put_Line ("Server listening on 127.0.0.1:50000");

   loop
      GNAT.Sockets.Accept_Socket (Receiver, Connection, Client);

      Ada.Text_IO.Put_Line
        ("Accepted connection from " & GNAT.Sockets.Image (Client));
      Channel := GNAT.Sockets.Stream (Connection);

      Ada.Text_IO.Put_Line ("Client says...");
      begin
         loop
            Ada.Streams.Read (Channel.all, Client_Data, Offset);
            exit when Offset = 0;
            for Idx in 1 .. Offset loop
               Ada.Text_IO.Put (Character'Val (Client_Data (Idx)));
            end loop;
            String'Write (Channel, Server_Data);
         end loop;
      exception
         when Ada.IO_Exceptions.End_Error =>
            null;
      end;
      GNAT.Sockets.Close_Socket (Connection);
   end loop;
end TCP_Server_Main;
