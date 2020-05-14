with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Employee.Manager;

procedure Emp_Main is
begin
   declare
      Boss : Employee.Manager.Manager_Record :=
        Employee.Manager.Init_Manager
          (Ada.Strings.Unbounded.To_Unbounded_String ("Alberto"),
           Ada.Strings.Unbounded.To_Unbounded_String ("Gonzalez"), 48,
           Employee.Manager.Project_Manager);
   begin
      Employee.Manager.Print_Description (Boss);
   end;
end Emp_Main;
