package Grand is
   function Generate_Random_Integer return Integer
     with Export, Convention => Ada, Link_Name => "Generate_Random_Integer";

   function Generate_Random_Natural return Natural
     with Export, Convention => Ada, Link_Name => "Generate_Random_Natural";

   function Generate_Random_Positive return Positive
     with Export, Convention => Ada, Link_Name => "Generate_Random_Positive";
   
   function Generate_Random_Float return Float
     with Export, Convention => Ada, Link_Name => "Generate_Random_Float";
end Grand;
