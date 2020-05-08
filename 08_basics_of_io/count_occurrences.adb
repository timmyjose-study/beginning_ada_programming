with Ada.Integer_Text_IO;
with Ada.Strings.Fixed;

procedure Count_Occurrences is
begin
  Ada.Integer_Text_IO.Put (Ada.Strings.Fixed.Count (Source => "the three truths", Pattern => "th"));
  Ada.Integer_Text_IO.Put (Ada.Strings.Fixed.Count (Source => "hello world", Pattern => "l"));
end Count_Occurrences;