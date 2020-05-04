with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Characters.Latin_1;

procedure Lab3 is
  Banner: Ada.Strings.Unbounded.Unbounded_String;
begin
  Banner := Ada.Strings.Unbounded.To_Unbounded_String("#############################################################");
  Ada.Strings.Unbounded.Append(Banner, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Banner, "#############################################################");
  Ada.Strings.Unbounded.Append(Banner, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Banner, "##                                                         ##");
  Ada.Strings.Unbounded.Append(Banner, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Banner, "##          OOOOOOOOOOO  OOOOOOOOOOO  OOOOOOOOOOO          ##");
  Ada.Strings.Unbounded.Append(Banner, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Banner, "##          OO       OO  OO       OO  OO       OO          ##");
  Ada.Strings.Unbounded.Append(Banner, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Banner, "##          OO       OO  OO       OO  OO       OO          ##");
  Ada.Strings.Unbounded.Append(Banner, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Banner, "##          OO       OO  OO       OO  OO       OO          ##");
  Ada.Strings.Unbounded.Append(Banner, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Banner, "##          OOOOOOOOOOO  OO       OO  OOOOOOOOOOO          ##");
  Ada.Strings.Unbounded.Append(Banner, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Banner, "##          OO       OO  OO       OO  OO       OO          ##");
  Ada.Strings.Unbounded.Append(Banner, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Banner, "##          OO       OO  OO       OO  OO       OO          ##");
  Ada.Strings.Unbounded.Append(Banner, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Banner, "##          OO       OO  OO       OO  OO       OO          ##");
  Ada.Strings.Unbounded.Append(Banner, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Banner, "##          OO       OO  OOOOOOOOOO   OO       OO          ##");
  Ada.Strings.Unbounded.Append(Banner, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Banner, "##                                                         ##");
  Ada.Strings.Unbounded.Append(Banner, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Banner, "#############################################################");
  Ada.Strings.Unbounded.Append(Banner, Ada.Characters.Latin_1.LF);
  Ada.Strings.Unbounded.Append(Banner, "#############################################################");
  Ada.Strings.Unbounded.Append(Banner, Ada.Characters.Latin_1.LF);
  Ada.Text_IO.Put_Line (Ada.Strings.Unbounded.To_String(Banner));
end Lab3;