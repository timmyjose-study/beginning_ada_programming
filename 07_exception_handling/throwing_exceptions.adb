with Ada.Text_IO;

procedure Throwing_Exceptions is
  -- custom exception type
  My_Little_Exception: exception;

  procedure Throw_Exception is
  begin
    Ada.Text_IO.Put_Line ("Ready to throw an exception");
    raise My_Little_Exception;
    Ada.Text_IO.Put_Line ("This line will never be seen");
  end Throw_Exception;

  procedure Catch_Exception is
  begin
    Ada.Text_IO.Put_Line ("About to catch an exception");
    Throw_Exception;
    Ada.Text_IO.Put_Line ("Again, this line will never be seen");
  exception
    when My_Little_Exception => Ada.Text_IO.Put_Line ("Caught an instance of My_Little_Exception");
    when others => Ada.Text_IO.Put_Line ("unreachable");
  end Catch_Exception;
begin
  Ada.Text_IO.Put_Line ("===> Starting the experiment");
  Catch_Exception;
  Ada.Text_IO.Put_Line ("===> Ending the experiment");
end Throwing_Exceptions;