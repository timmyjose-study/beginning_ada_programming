pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: Community 2019 (20190517-83)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_lab4" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#3dfda6c3#;
   pragma Export (C, u00001, "lab4B");
   u00002 : constant Version_32 := 16#050ff2f0#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#0f7d71d4#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#cd2959fb#;
   pragma Export (C, u00005, "ada__numericsS");
   u00006 : constant Version_32 := 16#085b6ffb#;
   pragma Export (C, u00006, "systemS");
   u00007 : constant Version_32 := 16#34742901#;
   pragma Export (C, u00007, "system__exception_tableB");
   u00008 : constant Version_32 := 16#55f506b9#;
   pragma Export (C, u00008, "system__exception_tableS");
   u00009 : constant Version_32 := 16#ae860117#;
   pragma Export (C, u00009, "system__soft_linksB");
   u00010 : constant Version_32 := 16#4d58644d#;
   pragma Export (C, u00010, "system__soft_linksS");
   u00011 : constant Version_32 := 16#bd45c2cc#;
   pragma Export (C, u00011, "system__secondary_stackB");
   u00012 : constant Version_32 := 16#4dcf97e2#;
   pragma Export (C, u00012, "system__secondary_stackS");
   u00013 : constant Version_32 := 16#d90c4a0d#;
   pragma Export (C, u00013, "ada__exceptionsB");
   u00014 : constant Version_32 := 16#16307b94#;
   pragma Export (C, u00014, "ada__exceptionsS");
   u00015 : constant Version_32 := 16#5726abed#;
   pragma Export (C, u00015, "ada__exceptions__last_chance_handlerB");
   u00016 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00016, "ada__exceptions__last_chance_handlerS");
   u00017 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00017, "system__exceptionsB");
   u00018 : constant Version_32 := 16#6038020d#;
   pragma Export (C, u00018, "system__exceptionsS");
   u00019 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00019, "system__exceptions__machineB");
   u00020 : constant Version_32 := 16#d27d9682#;
   pragma Export (C, u00020, "system__exceptions__machineS");
   u00021 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00021, "system__exceptions_debugB");
   u00022 : constant Version_32 := 16#76d1963f#;
   pragma Export (C, u00022, "system__exceptions_debugS");
   u00023 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00023, "system__img_intB");
   u00024 : constant Version_32 := 16#0a808f39#;
   pragma Export (C, u00024, "system__img_intS");
   u00025 : constant Version_32 := 16#ced09590#;
   pragma Export (C, u00025, "system__storage_elementsB");
   u00026 : constant Version_32 := 16#259825ff#;
   pragma Export (C, u00026, "system__storage_elementsS");
   u00027 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00027, "system__tracebackB");
   u00028 : constant Version_32 := 16#5679b13f#;
   pragma Export (C, u00028, "system__tracebackS");
   u00029 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00029, "system__traceback_entriesB");
   u00030 : constant Version_32 := 16#0800998b#;
   pragma Export (C, u00030, "system__traceback_entriesS");
   u00031 : constant Version_32 := 16#bb296fbb#;
   pragma Export (C, u00031, "system__traceback__symbolicB");
   u00032 : constant Version_32 := 16#c84061d1#;
   pragma Export (C, u00032, "system__traceback__symbolicS");
   u00033 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00033, "ada__exceptions__tracebackB");
   u00034 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00034, "ada__exceptions__tracebackS");
   u00035 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00035, "system__address_imageB");
   u00036 : constant Version_32 := 16#a9b7f2c1#;
   pragma Export (C, u00036, "system__address_imageS");
   u00037 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00037, "system__wch_conB");
   u00038 : constant Version_32 := 16#13264d29#;
   pragma Export (C, u00038, "system__wch_conS");
   u00039 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00039, "system__wch_stwB");
   u00040 : constant Version_32 := 16#3e376128#;
   pragma Export (C, u00040, "system__wch_stwS");
   u00041 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00041, "system__wch_cnvB");
   u00042 : constant Version_32 := 16#1c91f7da#;
   pragma Export (C, u00042, "system__wch_cnvS");
   u00043 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00043, "interfacesS");
   u00044 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00044, "system__wch_jisB");
   u00045 : constant Version_32 := 16#9ce1eefb#;
   pragma Export (C, u00045, "system__wch_jisS");
   u00046 : constant Version_32 := 16#86dbf443#;
   pragma Export (C, u00046, "system__parametersB");
   u00047 : constant Version_32 := 16#40b73bd0#;
   pragma Export (C, u00047, "system__parametersS");
   u00048 : constant Version_32 := 16#75bf515c#;
   pragma Export (C, u00048, "system__soft_links__initializeB");
   u00049 : constant Version_32 := 16#5697fc2b#;
   pragma Export (C, u00049, "system__soft_links__initializeS");
   u00050 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00050, "system__stack_checkingB");
   u00051 : constant Version_32 := 16#86e40413#;
   pragma Export (C, u00051, "system__stack_checkingS");
   u00052 : constant Version_32 := 16#d398a95f#;
   pragma Export (C, u00052, "ada__tagsB");
   u00053 : constant Version_32 := 16#12a0afb8#;
   pragma Export (C, u00053, "ada__tagsS");
   u00054 : constant Version_32 := 16#796f31f1#;
   pragma Export (C, u00054, "system__htableB");
   u00055 : constant Version_32 := 16#8c99dc11#;
   pragma Export (C, u00055, "system__htableS");
   u00056 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00056, "system__string_hashB");
   u00057 : constant Version_32 := 16#2ec7b76f#;
   pragma Export (C, u00057, "system__string_hashS");
   u00058 : constant Version_32 := 16#3cdd1378#;
   pragma Export (C, u00058, "system__unsigned_typesS");
   u00059 : constant Version_32 := 16#b8e72903#;
   pragma Export (C, u00059, "system__val_lluB");
   u00060 : constant Version_32 := 16#51139e9a#;
   pragma Export (C, u00060, "system__val_lluS");
   u00061 : constant Version_32 := 16#269742a9#;
   pragma Export (C, u00061, "system__val_utilB");
   u00062 : constant Version_32 := 16#a4fbd905#;
   pragma Export (C, u00062, "system__val_utilS");
   u00063 : constant Version_32 := 16#ec4d5631#;
   pragma Export (C, u00063, "system__case_utilB");
   u00064 : constant Version_32 := 16#378ed9af#;
   pragma Export (C, u00064, "system__case_utilS");
   u00065 : constant Version_32 := 16#510c5068#;
   pragma Export (C, u00065, "ada__task_identificationB");
   u00066 : constant Version_32 := 16#c716434e#;
   pragma Export (C, u00066, "ada__task_identificationS");
   u00067 : constant Version_32 := 16#fde20231#;
   pragma Export (C, u00067, "system__task_primitivesS");
   u00068 : constant Version_32 := 16#352452d1#;
   pragma Export (C, u00068, "system__os_interfaceB");
   u00069 : constant Version_32 := 16#b9c37c0a#;
   pragma Export (C, u00069, "system__os_interfaceS");
   u00070 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00070, "interfaces__cB");
   u00071 : constant Version_32 := 16#467817d8#;
   pragma Export (C, u00071, "interfaces__cS");
   u00072 : constant Version_32 := 16#64ad9f76#;
   pragma Export (C, u00072, "interfaces__c__extensionsS");
   u00073 : constant Version_32 := 16#b870d14d#;
   pragma Export (C, u00073, "system__os_constantsS");
   u00074 : constant Version_32 := 16#7a0a06a1#;
   pragma Export (C, u00074, "system__task_primitives__operationsB");
   u00075 : constant Version_32 := 16#1951cab5#;
   pragma Export (C, u00075, "system__task_primitives__operationsS");
   u00076 : constant Version_32 := 16#89b55e64#;
   pragma Export (C, u00076, "system__interrupt_managementB");
   u00077 : constant Version_32 := 16#1a73cd21#;
   pragma Export (C, u00077, "system__interrupt_managementS");
   u00078 : constant Version_32 := 16#f65595cf#;
   pragma Export (C, u00078, "system__multiprocessorsB");
   u00079 : constant Version_32 := 16#30f7f088#;
   pragma Export (C, u00079, "system__multiprocessorsS");
   u00080 : constant Version_32 := 16#2b2125d3#;
   pragma Export (C, u00080, "system__os_primitivesB");
   u00081 : constant Version_32 := 16#0fa60a0d#;
   pragma Export (C, u00081, "system__os_primitivesS");
   u00082 : constant Version_32 := 16#e0fce7f8#;
   pragma Export (C, u00082, "system__task_infoB");
   u00083 : constant Version_32 := 16#8841d2fa#;
   pragma Export (C, u00083, "system__task_infoS");
   u00084 : constant Version_32 := 16#2281c1c8#;
   pragma Export (C, u00084, "system__taskingB");
   u00085 : constant Version_32 := 16#34147ee0#;
   pragma Export (C, u00085, "system__taskingS");
   u00086 : constant Version_32 := 16#6ec3c867#;
   pragma Export (C, u00086, "system__stack_usageB");
   u00087 : constant Version_32 := 16#3a3ac346#;
   pragma Export (C, u00087, "system__stack_usageS");
   u00088 : constant Version_32 := 16#4e0ce0a1#;
   pragma Export (C, u00088, "system__crtlS");
   u00089 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00089, "system__ioB");
   u00090 : constant Version_32 := 16#961998b4#;
   pragma Export (C, u00090, "system__ioS");
   u00091 : constant Version_32 := 16#1036f432#;
   pragma Export (C, u00091, "system__tasking__debugB");
   u00092 : constant Version_32 := 16#de1ac8b1#;
   pragma Export (C, u00092, "system__tasking__debugS");
   u00093 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00093, "system__concat_2B");
   u00094 : constant Version_32 := 16#0afbb82b#;
   pragma Export (C, u00094, "system__concat_2S");
   u00095 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00095, "system__concat_3B");
   u00096 : constant Version_32 := 16#032b335e#;
   pragma Export (C, u00096, "system__concat_3S");
   u00097 : constant Version_32 := 16#273384e4#;
   pragma Export (C, u00097, "system__img_enum_newB");
   u00098 : constant Version_32 := 16#6917693b#;
   pragma Export (C, u00098, "system__img_enum_newS");
   u00099 : constant Version_32 := 16#9dca6636#;
   pragma Export (C, u00099, "system__img_lliB");
   u00100 : constant Version_32 := 16#19143a2a#;
   pragma Export (C, u00100, "system__img_lliS");
   u00101 : constant Version_32 := 16#0b29e756#;
   pragma Export (C, u00101, "system__tasking__utilitiesB");
   u00102 : constant Version_32 := 16#0f670827#;
   pragma Export (C, u00102, "system__tasking__utilitiesS");
   u00103 : constant Version_32 := 16#0a1cacd7#;
   pragma Export (C, u00103, "system__tasking__initializationB");
   u00104 : constant Version_32 := 16#fc2303e6#;
   pragma Export (C, u00104, "system__tasking__initializationS");
   u00105 : constant Version_32 := 16#3b415298#;
   pragma Export (C, u00105, "system__soft_links__taskingB");
   u00106 : constant Version_32 := 16#e939497e#;
   pragma Export (C, u00106, "system__soft_links__taskingS");
   u00107 : constant Version_32 := 16#17d21067#;
   pragma Export (C, u00107, "ada__exceptions__is_null_occurrenceB");
   u00108 : constant Version_32 := 16#e1d7566f#;
   pragma Export (C, u00108, "ada__exceptions__is_null_occurrenceS");
   u00109 : constant Version_32 := 16#6213e14a#;
   pragma Export (C, u00109, "system__tasking__task_attributesB");
   u00110 : constant Version_32 := 16#e81a3c25#;
   pragma Export (C, u00110, "system__tasking__task_attributesS");
   u00111 : constant Version_32 := 16#2e4883f4#;
   pragma Export (C, u00111, "system__tasking__queuingB");
   u00112 : constant Version_32 := 16#6dba2805#;
   pragma Export (C, u00112, "system__tasking__queuingS");
   u00113 : constant Version_32 := 16#9fcf5d7f#;
   pragma Export (C, u00113, "system__tasking__protected_objectsB");
   u00114 : constant Version_32 := 16#15001baf#;
   pragma Export (C, u00114, "system__tasking__protected_objectsS");
   u00115 : constant Version_32 := 16#92cd7102#;
   pragma Export (C, u00115, "system__tasking__protected_objects__entriesB");
   u00116 : constant Version_32 := 16#7daf93e7#;
   pragma Export (C, u00116, "system__tasking__protected_objects__entriesS");
   u00117 : constant Version_32 := 16#100eaf58#;
   pragma Export (C, u00117, "system__restrictionsB");
   u00118 : constant Version_32 := 16#4329b6aa#;
   pragma Export (C, u00118, "system__restrictionsS");
   u00119 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00119, "ada__finalizationS");
   u00120 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00120, "ada__streamsB");
   u00121 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00121, "ada__streamsS");
   u00122 : constant Version_32 := 16#92d882c5#;
   pragma Export (C, u00122, "ada__io_exceptionsS");
   u00123 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00123, "system__finalization_rootB");
   u00124 : constant Version_32 := 16#47a91c6b#;
   pragma Export (C, u00124, "system__finalization_rootS");
   u00125 : constant Version_32 := 16#f4e097a7#;
   pragma Export (C, u00125, "ada__text_ioB");
   u00126 : constant Version_32 := 16#3913d0d6#;
   pragma Export (C, u00126, "ada__text_ioS");
   u00127 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00127, "interfaces__c_streamsB");
   u00128 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00128, "interfaces__c_streamsS");
   u00129 : constant Version_32 := 16#ec083f01#;
   pragma Export (C, u00129, "system__file_ioB");
   u00130 : constant Version_32 := 16#af2a8e9e#;
   pragma Export (C, u00130, "system__file_ioS");
   u00131 : constant Version_32 := 16#e4774a28#;
   pragma Export (C, u00131, "system__os_libB");
   u00132 : constant Version_32 := 16#d8e681fb#;
   pragma Export (C, u00132, "system__os_libS");
   u00133 : constant Version_32 := 16#2a8e89ad#;
   pragma Export (C, u00133, "system__stringsB");
   u00134 : constant Version_32 := 16#684d436e#;
   pragma Export (C, u00134, "system__stringsS");
   u00135 : constant Version_32 := 16#f5c4f553#;
   pragma Export (C, u00135, "system__file_control_blockS");
   u00136 : constant Version_32 := 16#ec9cfed1#;
   pragma Export (C, u00136, "system__random_numbersB");
   u00137 : constant Version_32 := 16#cb43df61#;
   pragma Export (C, u00137, "system__random_numbersS");
   u00138 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00138, "system__img_unsB");
   u00139 : constant Version_32 := 16#a3292f8f#;
   pragma Export (C, u00139, "system__img_unsS");
   u00140 : constant Version_32 := 16#15692802#;
   pragma Export (C, u00140, "system__random_seedB");
   u00141 : constant Version_32 := 16#534b46a0#;
   pragma Export (C, u00141, "system__random_seedS");
   u00142 : constant Version_32 := 16#fc54e290#;
   pragma Export (C, u00142, "ada__calendarB");
   u00143 : constant Version_32 := 16#31350a81#;
   pragma Export (C, u00143, "ada__calendarS");
   u00144 : constant Version_32 := 16#383fd226#;
   pragma Export (C, u00144, "system__val_unsB");
   u00145 : constant Version_32 := 16#09db6ec1#;
   pragma Export (C, u00145, "system__val_unsS");
   u00146 : constant Version_32 := 16#e31b7c4e#;
   pragma Export (C, u00146, "system__memoryB");
   u00147 : constant Version_32 := 16#512609cf#;
   pragma Export (C, u00147, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  system.memory%s
   --  system.memory%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  ada.io_exceptions%s
   --  ada.numerics%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  interfaces.c.extensions%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.multiprocessors%s
   --  system.multiprocessors%b
   --  system.os_constants%s
   --  system.os_interface%s
   --  system.os_interface%b
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.task_primitives%s
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  system.tasking%b
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_llu%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.val_uns%s
   --  system.val_uns%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  system.random_seed%s
   --  system.random_seed%b
   --  system.random_numbers%s
   --  system.random_numbers%b
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.tasking.initialization%s
   --  system.tasking.task_attributes%s
   --  system.tasking.task_attributes%b
   --  system.tasking.initialization%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%s
   --  system.tasking.utilities%b
   --  ada.task_identification%s
   --  ada.task_identification%b
   --  lab4%b
   --  END ELABORATION ORDER

end ada_main;
