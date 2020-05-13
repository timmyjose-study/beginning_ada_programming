with Ada.Text_IO;

procedure Hola_Mundo_Task is
  task type Hola_Mundo;

  task body Hola_Mundo is
  begin
    for count in 1 .. 10 loop
      Ada.Text_IO.Put_Line ("Hola, Mundo!");
      delay 0.5;
    end loop;
  end Hola_Mundo;
  
  Task_1: Hola_Mundo;
begin
  null;
end Hola_Mundo_Task