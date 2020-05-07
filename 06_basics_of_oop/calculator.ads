with Ada.Text_IO;

package Calculator is
  function Addition (Input1: in Integer; Input2: in Integer) return Integer;
  function Subtraction (Input1: in Integer; Input2: in Integer) return Integer;
  function Multiplication (Input1: in Integer; Input2: in Integer) return Integer;
  function Division (Input1: in Integer; Input2: in Integer) return Integer;
  function Addition (Input1: in Float; Input2: in Float) return Float;
  function Subtraction (Input1: in Float; Input2: in Float) return Float;
  function Multiplication (Input1: in Float; Input2: in Float) return Float;
  function Division (Input1: in Float; Input2: in Float) return Float;
end Calculator;