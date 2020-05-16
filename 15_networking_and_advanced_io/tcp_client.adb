with Ada.Text_IO;
with GNAT.Sockets;

procedure TCP_Client is
   Server_Address : GNAT.Sockets.Sock_Addr_Type :=
     (GNAT.Sockets.Family_Inet, GNAT.Sockets.Inet_Addr ("127.0.0.1"), 50000);
   Socket  : GNAT.Sockets.Socket_Type;
   Channel : GNAT.Sockets.Stream_Access;

   Data : String := "Hello world!";
begin
   GNAT.Sockets.Create_Socket (Socket);
   GNAT.Sockets.Connect_Socket (Socket, Server_Address);
   Channel := GNAT.Sockets.Stream (Socket);

   String'Write (Channel, Data);
   String'Read (Channel, Data);

   Ada.Text_IO.Put_Line (Data);
end TCP_Client;
