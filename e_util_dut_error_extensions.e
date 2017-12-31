File name     : e_util_dut_error_extensions.e
Title         : DUT Error Extensions
Project       : Utilities examples
Created       : 2017
Description   : 
              : Extending the dut_error_struct, to perform actions when a DUT
              : error is about to be reported.
              :
              : This code is an example, demonstrating the capabilities.
              : You can edit it, according to your requirements and
              : methodology.      
              : 
Notes         : 
              :  the dut_error_struct api:
              :
              :    get_check_name()                       : string;
              :    get_action_block_text()                : list of string;
              :    get_message()                          : string;
              :    source_struct()                        : any_struct;
              :    source_location()                      : string;
              :    source_struct_name()                   : string;
              :    source_method_name()                   : string;
              :    check_effect()                         : check_effect;
              :    set_check_effect(effect:check_effect);
              : 
              : With combination of using reflection - you can get even more
              : data about the calling struct, as demonstrated in the code 
              : below.
              :
              :
Example       : See usage example dut_error_usage_ex.e
              : Running:
              :  (add this directory to SPECMAN_PATH)
        
              specman -c 'load dut_error_usage_ex.e; test'


  
  
<'


// Demonstrating multiple things we can do upon DUT error:

extend dut_error_struct {
    pre_error() is also {
        
        if source_method_name() == "post_generate" {
            out("\nProblem in generation? ", source_location());
            // Can provide more information.... such as - the related struct, 
            // the constraint on it, etc....
            // Don't count this as an ERROR nor WARNING. Ignore it.
            set_check_effect(IGNORE);
        };
        
        
    };
    
    
    write() is first {
        out(source_struct() is a any_unit ? "UNIT " : "STRUCT ",
            source_struct_name(), " reporting of error: ");
          
    
        // Special output for errors coming from the ahb package:
        
        // Using reflection, can get lots of info about the reporting struct.
        // For example - in which package it was defined
        
        // If using annotation - can use them as well.
        // For example - different messages for annotated features
        
        var reporter_rf : rf_struct = 
          rf_manager.get_struct_of_instance(source_struct());
        if reporter_rf.get_package().get_name() == "ahb" {
            out(append("xxxxxx another bug in AHB package, ",
                           "\nreported ", source_location()));
        }; 
    };
    
};
'>
