<'

import e_util_dut_error_extensions.e;

import ahb_uvc; // to demonstrate errors coming from multiple modules

unit module_env {
    legal : bool;
      keep not legal;
    val   : int;
    
    post_generate() is also {
        check that val == 555 else 
          dut_error("val expected to be 555 but is ", val);
    };
    
    scenario() @sys.any is {
        raise_objection(TEST_DONE);
        
        check LEGAL that legal;
        wait cycle;
        
        drop_objection(TEST_DONE);
    };
    
    run() is also {
        start scenario();
    };
};

extend sys {
    module_env is instance;
    
    pre_generate() is also {
        // so that will continue runnig after first error
        specman("set check WARNING");
    };
};



'>
