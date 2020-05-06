with Ada.Text_IO;

procedure Lab1 is
  procedure Header is 
  begin
    Ada.Text_IO.Put_Line ("#############################################################");
    Ada.Text_IO.Put_Line ("#############################################################");
  end Header;

  procedure Footer is
  begin
    Ada.Text_IO.Put_Line ("#############################################################");
    Ada.Text_IO.Put_Line ("#############################################################");
  end Footer;

  procedure Spaced_Line is
  begin
    Ada.Text_IO.Put_Line ("##                                                         ##");
  end Spaced_Line;
begin
  Header;
  Spaced_Line;
  Ada.Text_IO.Put_Line ("##          OOOOOOOOOOO  OOOOOOOOOOO  OOOOOOOOOOO          ##");
  Ada.Text_IO.Put_Line ("##          OO       OO  OO       OO  OO       OO          ##");
  Ada.Text_IO.Put_Line ("##          OO       OO  OO       OO  OO       OO          ##");
  Ada.Text_IO.Put_Line ("##          OO       OO  OO       OO  OO       OO          ##");
  Ada.Text_IO.Put_Line ("##          OOOOOOOOOOO  OO       OO  OOOOOOOOOOO          ##");
  Ada.Text_IO.Put_Line ("##          OO       OO  OO       OO  OO       OO          ##");
  Ada.Text_IO.Put_Line ("##          OO       OO  OO       OO  OO       OO          ##");
  Ada.Text_IO.Put_Line ("##          OO       OO  OO       OO  OO       OO          ##");
  Ada.Text_IO.Put_Line ("##          OO       OO  OOOOOOOOOO   OO       OO          ##");
  Spaced_Line;
  Footer;
end Lab1;

