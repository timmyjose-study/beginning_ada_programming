with Ada.Strings.Unbounded;

-- subtyping is explicitly denotedby the dot in the package name
package Employee.Manager is
  type Manager_Record is new Employee_Record with private;

  type Manager_Position is
    (VP, Project_Manager, Product_Manager, Test_Manager, Dev_Manager);
  
  procedure Print_Description (Manager: in Manager_Record);

  function Init_Manager
   (First_Name : in Ada.Strings.Unbounded.Unbounded_String;
    Last_Name  : in Ada.Strings.Unbounded.Unbounded_String; Age : in Age_Val;
    Position   : in Manager_Position) return Manager_Record;

private

-- the extra fields that this subtype declares
type Manager_Record is new Employee_Record with record
  Position: Manager_Position;
end record;
end Employee.Manager;
