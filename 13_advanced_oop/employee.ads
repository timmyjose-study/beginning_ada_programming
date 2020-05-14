with Ada.Text_IO;
with Ada.Strings.Unbounded;

package Employee is
   type Age_Val is new Integer range 0 .. 150;
   type Employee_Record is tagged private;

   procedure Print_Description (Emp : in Employee_Record);

private

   type Employee_Record is tagged record
      First_Name : Ada.Strings.Unbounded.Unbounded_String;
      Last_Name  : Ada.Strings.Unbounded.Unbounded_String;
      Age        : Age_Val;
   end record;
end Employee;
