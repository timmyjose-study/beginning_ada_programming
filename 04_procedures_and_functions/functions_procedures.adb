with Ada.Text_IO;

procedure Functions_Procedures is
  procedure Test_Proc (Val1: in Integer; Val2: in out Integer; Val3: out Integer) is
  begin
    Ada.Text_IO.Put_Line ("Val1 = " & Integer'Image (Val1));

    Val2 := 6;
    Ada.Text_IO.Put_Line ("Val2 = " & Integer'Image (Val2));

    Val3 := 8;
    Ada.Text_IO.Put_Line ("Val3 = " & Integer'Image (Val3));
  end Test_Proc;

  function Test_Func (Val1: in Integer; Val2: out Integer) return Boolean is
  begin
    Val2 := 44;
    return True;
  end Test_Func;

  Input1: Integer := 23;
  Input2: Integer := 92;
begin
  Ada.Text_IO.Put_Line ("Input1 before Test_Proc = " & Integer'Image (Input1));
  Ada.Text_IO.Put_Line ("Input2 before Test_Proc = " & Integer'Image (Input2));
  Ada.Text_IO.New_Line;

  Test_Proc (25, Input1, Input2);

  Ada.Text_IO.Put_Line ("Input1 before Test_Proc = " & Integer'Image (Input1));
  Ada.Text_IO.Put_Line ("Input2 before Test_Proc = " & Integer'Image (Input2));
  Ada.Text_IO.New_Line;

  Ada.Text_IO.Put_Line ("Test_Func return value = " & Boolean'Image (Test_Func (54, Input2)));
  Ada.Text_IO.New_Line;
  Ada.Text_IO.Put_Line ("Input2 after Test_Func = " & Integer'Image (Input2));
end Functions_Procedures;