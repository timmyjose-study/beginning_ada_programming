with Ada.Text_IO;

package Time is
   type Time_Rec is private;

   function Init_Time
     (Hours : in Natural; Minutes : in Natural) return Time_Rec;

   procedure Print_Time (TR : in Time_Rec);

   function "+" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Time_Rec;

   function "+" (Val1 : in Time_Rec; Val2 : in Natural) return Time_Rec;

   function "+" (Val1 : in Natural; Val2 : in Time_Rec) return Time_Rec;

   function "-" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Time_Rec;

   function "-" (Val1 : in Time_Rec; Val2 : in Natural) return Time_Rec;

   function "-" (Val1 : in Natural; Val2 : in Time_Rec) return Time_Rec;

   function "*" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Time_Rec;

   function "*" (Val1 : in Time_Rec; Val2 : in Natural) return Time_Rec;

   function "*" (Val1 : in Natural; Val2 : in Time_Rec) return Time_Rec;

   function "/" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Time_Rec;

   function "/" (Val1 : in Time_Rec; Val2 : in Natural) return Time_Rec;

   function "/" (Val1 : in Natural; Val2 : in Time_Rec) return Time_Rec;

   function "<" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Boolean;

   function ">" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Boolean;

   function "=" (Val1 : in Time_Rec; Val2 : in Time_Rec) return Boolean;

private

   type Time_Rec is record
      Hours   : Natural;
      Minutes : Natural;
   end record;

   function Get_Minutes (TR : in Time_Rec) return Natural;
end Time;
