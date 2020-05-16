pragma Assertion_Policy (Check);

package Function_Check is
  -- custom function to be used as the logic/implementation for an aspect
  function Is_Formatted_Correctly (Command: in String) return Boolean;

  function Evaluate(Command: in String) return Boolean
    with Pre => Is_Formatted_Correctly (Command);
end Function_Check;