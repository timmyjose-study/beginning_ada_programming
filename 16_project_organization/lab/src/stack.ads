generic
  Max: Positive;
  type Element_Type is private;
package Stack is
  procedure Push (New_Item: in Element_Type);
  function Pop return Element_Type;
  function Top return Element_Type;
  function Size return Natural;
  function Is_Empty return Boolean;
  function Is_Full return Boolean;

  Stack_Empty_Error: exception;
  Stack_Full_Error: exception;
end Stack;
