with Ada.Text_IO;
with Ada.IO_Exceptions;
with GNAT.Sockets;

procedure UDP_Server is
   Receiver : GNAT.Sockets.Socket_Type;
   Channel  : GNAT.Sockets.Stream_Access;

   Server_Data : String := "             ";
begin
   GNAT.Sockets.Create_Socket
     (Receiver, GNAT.Sockets.Family_Inet, GNAT.Sockets.Socket_Datagram);
   GNAT.Sockets.Set_Socket_Option
     (Receiver, GNAT.Sockets.Socket_Level, (GNAT.Sockets.Reuse_Address, True));
   GNAT.Sockets.Bind_Socket
     (Receiver,
      (GNAT.Sockets.Family_Inet, GNAT.Sockets.Inet_Addr ("127.0.0.1"), 50000));

   Ada.Text_IO.Put_Line ("Server is up and running on 127.0.0.1:50000");

   loop
      Channel := GNAT.Sockets.Stream (Receiver);

      begin
         loop
            String'Read (Channel, Server_Data);
            Ada.Text_IO.Put_Line ("Server received data: " & Server_Data);
         end loop;
      exception
         when Ada.IO_Exceptions.End_Error =>
            exit;
      end;
   end loop;
end UDP_Server;
