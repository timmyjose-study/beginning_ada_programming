with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Float_Text_IO;
with Ada.Strings.Unbounded;
with Ada.Numerics.Discrete_Random;
with Ada.Numerics.Float_Random;
with Ada.Unchecked_Deallocation;

procedure Lab is
   -- custom types for employee record fields

   type Age_Vals is range 0 .. 150;
   type Sick_Leaves_Vals is range 0 .. 45;
   type Years_With_Company_Vals is range 0 .. 100;
   type Salary_Vals is delta 0.01 range 0.0 .. 1_000_000.0;

   -- random number generation

   package Random_Age_Int is new Ada.Numerics.Discrete_Random
     (Result_Subtype => Age_Vals);
   Random_Age_Generator : Random_Age_Int.Generator;

   function Generate_Random_Age return Age_Vals is
   begin
      Random_Age_Int.Reset (Gen => Random_Age_Generator);
      return Random_Age_Int.Random (Gen => Random_Age_Generator);
   end Generate_Random_Age;

   package Random_Sick_Leaves_Int is new Ada.Numerics.Discrete_Random
     (Result_Subtype => Sick_Leaves_Vals);
   Random_Sick_Leaves_Generator : Random_Sick_Leaves_Int.Generator;

   function Generate_Random_Sick_Leaves return Sick_Leaves_Vals is
   begin
      Random_Sick_Leaves_Int.Reset (Gen => Random_Sick_Leaves_Generator);
      return Random_Sick_Leaves_Int.Random
          (Gen => Random_Sick_Leaves_Generator);
   end Generate_Random_Sick_Leaves;

   package Random_Years_With_Company_Int is new Ada.Numerics.Discrete_Random
     (Result_Subtype => Years_With_Company_Vals);
   Random_Years_With_Company_Generator : Random_Years_With_Company_Int
     .Generator;

   function Generate_Random_Years_With_Company return Years_With_Company_Vals
   is
   begin
      Random_Years_With_Company_Int.Reset
        (Gen => Random_Years_With_Company_Generator);
      return Random_Years_With_Company_Int.Random
          (Gen => Random_Years_With_Company_Generator);
   end Generate_Random_Years_With_Company;

   function Generate_Random_Salary return Salary_Vals is
      Seed : Ada.Numerics.Float_Random.Generator;
      Temp : Float;
   begin
      Ada.Numerics.Float_Random.Reset (Seed);
      Temp :=
        Float (Salary_Vals'First) +
        Ada.Numerics.Float_Random.Random (Seed) * Float (Salary_Vals'Last);
      return Salary_Vals (Temp);
   end Generate_Random_Salary;

   -- the employee record and access types

   type Employee is record
      First_Name : Ada.Strings.Unbounded.Unbounded_String :=
        Ada.Strings.Unbounded.Null_Unbounded_String;
      Last_Name : Ada.Strings.Unbounded.Unbounded_String :=
        Ada.Strings.Unbounded.Null_Unbounded_String;
      Title : Ada.Strings.Unbounded.Unbounded_String :=
        Ada.Strings.Unbounded.Null_Unbounded_String;
      Age                : Age_Vals                := 0;
      Sick_Leaves        : Sick_Leaves_Vals        := 0;
      Years_With_Company : Years_With_Company_Vals := 0;
      Salary             : Salary_Vals             := 0.0;
   end record;

   type Employee_Access is access Employee;

   -- destructors
   procedure Deallocate is new Ada.Unchecked_Deallocation (Employee,
      Employee_Access);

   function Read_Employee return Employee_Access is
      Emp_Acc : Employee_Access := new Employee;
   begin
      Ada.Text_IO.Put ("Enter first name: ");
      Emp_Acc.all.First_Name := Ada.Text_IO.Unbounded_IO.Get_Line;

      Ada.Text_IO.Put ("Enter last name: ");
      Emp_Acc.all.Last_Name := Ada.Text_IO.Unbounded_IO.Get_Line;

      Ada.Text_IO.Put ("Enter title: ");
      Emp_Acc.all.Title := Ada.Text_IO.Unbounded_IO.Get_Line;

      Emp_Acc.all.Age                := Generate_Random_Age;
      Emp_Acc.all.Sick_Leaves        := Generate_Random_Sick_Leaves;
      Emp_Acc.all.Years_With_Company := Generate_Random_Years_With_Company;
      Emp_Acc.all.Salary             := Generate_Random_Salary;

      return Emp_Acc;
   end Read_Employee;

   procedure Display_Employee (Emp_Acc : in Employee_Access) is
   begin
      Ada.Text_IO.New_Line;
      Ada.Text_IO.Put_Line
        ("Name: " & Ada.Strings.Unbounded.To_String (Emp_Acc.all.First_Name) &
         " " & Ada.Strings.Unbounded.To_String (Emp_Acc.all.Last_Name));
      Ada.Text_IO.Put_Line ("Title: " & Ada.Strings.Unbounded.To_String (Emp_Acc.all.Title));
      Ada.Text_IO.Put_Line ("Age: " & Age_Vals'Image (Emp_Acc.all.Age));
      Ada.Text_IO.Put_Line
        ("Sick leaves available: " &
         Sick_Leaves_Vals'Image (Emp_Acc.all.Sick_Leaves));
      Ada.Text_IO.Put_Line
        ("No. of years with company: " &
         Years_With_Company_Vals'Image (Emp_Acc.all.Years_With_Company));
      Ada.Text_IO.Put ("Salary: ");
      Ada.Float_Text_IO.Put
        (Float (Emp_Acc.all.Salary), Fore => 7, Aft => 2, Exp => 0);
      Ada.Text_IO.New_Line (2);
   end Display_Employee;

   Company : array (1 .. 2) of Employee_Access;
begin
   for Idx in 1 .. 2 loop
      Ada.Text_IO.Put_Line
        ("Enter details for employee " & Integer'Image (Idx));
      Company (Idx) := Read_Employee;
   end loop;

   for Idx in 1 .. 2 loop
      Display_Employee (Company (Idx));
   end loop;

   for Idx in 1 .. 2 loop
      Deallocate (Company (Idx));
   end loop;
end Lab;
