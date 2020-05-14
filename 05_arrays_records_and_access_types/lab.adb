with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Float_Text_IO;
with Ada.Numerics.Discrete_Random;
with Ada.Numerics.Float_Random;
with Ada.Unchecked_Deallocation;

procedure Lab is
  -- integer random number generation
  subtype Vals is Natural range 0 .. 1000;
  package RandomInt is new Ada.Numerics.Discrete_Random (Result_Subtype => Vals);
  Val_Generator: RandomInt.Generator;
  GeneratedVal: Vals := 0;

  function Generate_Random_Integer return Vals is
  begin
    RandomInt.Reset (Gen => Val_Generator);
    return RandomInt.Random (Gen => Val_Generator);
  end Generate_Random_Integer;

  -- float random number generation
  Float_Generator: Ada.Numerics.Float_Random.Generator;

  function Generate_Random_Float return Float is
  begin
    Ada.Numerics.Float_Random.Reset (Gen => Float_Generator);
    -- returns a value in the range [0.0, 1.0], so adjust accordingly
    return 400.0 + Ada.Numerics.float_Random.Random (Float_Generator) * 5000.0;
  end Generate_Random_Float;

  type Employee is record
    First_Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
    Last_Name: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
    Title: Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
    Salary: Float := 0.0;
    Vacation_Hours: Natural := 0;
    Sick_Leaves: Natural := 0;
    Years_With_Company: Natural := 0;
  end record;

  type Employee_Access is access Employee;

  -- destructor
  procedure Deallocate is new Ada.Unchecked_Deallocation (Employee, Employee_Access);

  function Read_Employee return Employee_Access is
    Emp_Acc: Employee_Access := new Employee;
  begin
    Emp_Acc.all.First_Name := Ada.Strings.Unbounded.To_Unbounded_String (Ada.Text_IO.Get_Line);
    Emp_Acc.all.Last_Name := Ada.Strings.Unbounded.To_Unbounded_String (Ada.Text_IO.Get_Line);
    Emp_Acc.all.Title := Ada.Strings.Unbounded.To_Unbounded_String (Ada.Text_IO.Get_Line);
    Emp_Acc.all.Salary := Generate_Random_Float;
    Emp_Acc.all.Vacation_Hours := Generate_Random_Integer;
    Emp_Acc.all.Sick_Leaves := Generate_Random_Integer;
    Emp_Acc.all.Years_With_Company := Generate_Random_Integer rem 30; -- sensible values

    return Emp_Acc;
  end Read_Employee;

  procedure Display_Employee (Emp: Employee_Access) is 
  begin
    Ada.Text_IO.Put_Line ("First Name: " & Ada.Strings.Unbounded.To_String (Emp.all.First_Name));
    Ada.Text_IO.Put_Line ("Last Name: " & Ada.Strings.Unbounded.To_String (Emp.all.Last_Name));
    Ada.Text_IO.Put_Line ("Title: " & Ada.Strings.Unbounded.To_String (Emp.all.Title));
    Ada.Text_IO.Put ("Salary: ");
    Ada.Float_Text_IO.Put (Emp.Salary, Aft => 2, Exp => 0);
    Ada.Text_IO.New_Line;
    Ada.Text_IO.Put_Line ("Vacation Hours: " & Natural'Image (Emp.Vacation_Hours));
    Ada.Text_IO.Put_Line ("Sick Leaves: " & Natural'Image (Emp.Sick_Leaves));
    Ada.Text_IO.Put_Line ("Years with Company: " & Natural'Image (Emp.Years_With_Company));

    Ada.Text_IO.New_Line (2);
  end Display_Employee;

  Company: array (1 .. 2) of Employee_Access;
begin
  for Idx in 1 .. 2 loop
    Ada.Text_IO.Put_Line ("Enter details of employee " & Positive'Image (Idx));
    Company (Idx) := Read_Employee;
  end loop;

  for Idx in 1 .. 2 loop
    Display_Employee (Company (Idx));
  end loop;

  for Idx in 1 .. 2 loop
    Deallocate (Company (Idx));
  end loop;

  -- should be CONSTRAINT ERROR
  --Display_Employee (Company (Company'First));
end Lab;