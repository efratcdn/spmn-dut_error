# spmn-dut_error
Title : DUT Error Extensions
Version : 1.0
Requires : Specman {15.01..}
Modified : December 2017
Description :

[ More e code examples in https://github.com/efratcdn/spmn-e-utils ]

Extending the dut_error_struct, to perform actions when a DUT error is about to be reported.
This code is an example, demonstrating the capabilities.
You can edit it, according to your requirements and methodology.
the dut_error_struct api
  get_check_name()                       : string;
  get_action_block_text()                : list of string;
  get_message()                          : string;
  source_struct()                        : any_struct;
  source_location()                      : string;
  source_struct_name()                   : string;
  source_method_name()                   : string;
  check_effect()                         : check_effect;
  set_check_effect(effectcheck_effect);
With combination of using reflection - you can get even more data about the calling struct.
Running the example: specman -c 'load dut_error_usage_ex.e; test'
