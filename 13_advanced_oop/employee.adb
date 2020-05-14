package body Employee is
  procedure Print_Description (
    Emp: in Employee_Record
    ) is
  begin
    Ada.Text_IO.Put_Line (Ada.Text_IO.Standard_Error, "this function is not implemented");
  end Print_Description;
end Employee;
