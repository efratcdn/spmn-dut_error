<'
package ahb;

struct trans {
    addr : uint;
    post_generate() is also {
        check ADDRESS_RANGE that addr == 0  else
          dut_error("got address out of range");
    };
};
unit dummy_ahb {
    !trans;
    
    run() is also {
        gen trans;
    };
};

extend sys {
    dummy_ahb is instance;
};
'>
