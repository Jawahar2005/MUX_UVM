class mux_sequence_item extends uvm_sequence_item;
  
  //Factory Registration
  `uvm_object_utils (mux_sequence_item);
  
  //Sequence_items
  logic clk;
  logic rst;
  rand logic [15:0][32:0] i;
  rand logic [3:0] s;
  logic [32:0] y;
  
  //Constructor 
  function new(string name = "mux_sequence_item");
    super.new (name);
    `uvm_info("Sequence item class","Constructor",UVM_NONE)
  endfunction
endclass
