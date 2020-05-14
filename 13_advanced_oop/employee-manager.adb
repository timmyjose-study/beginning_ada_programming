package body Employee.Manager is
   function Init_Manager
     (First_Name : in Ada.Strings.Unbounded.Unbounded_String;
      Last_Name  : in Ada.Strings.Unbounded.Unbounded_String; Age : in Age_Val;
      Position   : in Manager_Position) return Manager_Record
   is
      Manager : Manager_Record;
   begin
      Manager.First_Name := First_Name;
      Manager.Last_Name  := Last_Name;
      Manager.Age        := Age;
      Manager.Position   := Position;

      return Manager;
   end Init_Manager;

   procedure Print_Description (Manager : in Manager_Record) is
   begin
      Ada.Text_IO.Put_Line
        ("Name: " & Ada.Strings.Unbounded.To_String (Manager.First_Name) &
         " " & Ada.Strings.Unbounded.To_String (Manager.Last_Name));
      Ada.Text_IO.Put_Line ("Age: " & Age_Val'Image (Manager.Age));
      Ada.Text_IO.Put_Line
        ("Position: " & Manager_Position'Image (Manager.Position));
   end Print_Description;
end Employee.Manager;
