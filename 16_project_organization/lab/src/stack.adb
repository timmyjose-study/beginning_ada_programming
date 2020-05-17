package body Stack is
  S: array (1 .. Max) of Element_Type;
  Top_Of_Stack: Natural := 0;

  procedure Push (New_Item: in Element_Type) is
  begin
    if Is_Full then
      raise Stack_Full_Error;
    end if;

    Top_Of_Stack := Top_Of_Stack + 1;
    S (Top_Of_Stack) := New_Item;
  end Push;

  function Pop return Element_Type is
    Val: Element_Type;
  begin
    if Is_Empty then
      raise Stack_Empty_Error;
    end if;

    Val := S (Top_Of_Stack);
    Top_Of_Stack := Top_Of_Stack - 1;
    return Val;
  end Pop;

  function Top return Element_Type is
  begin
    if Is_Empty then
      raise Stack_Empty_Error;
    end if;

    return S (Top_Of_Stack);
  end Top;

  function Size return Natural is
  begin
    return Top_Of_Stack;
  end Size;

  function Is_Empty return Boolean is
  begin
    return Top_Of_Stack = 0;
  end Is_Empty;

  function Is_Full return Boolean is
  begin
    return Top_Of_Stack = Max;
  end Is_Full;
end Stack;
