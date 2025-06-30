class mux_sequencer extends uvm_sequencer #(mux_sequence_item);
  
  //Factory Registration
  `uvm_component_utils (mux_sequencer)
  
  //Constructor
  function new (string name ="mux_sequencer", uvm_component parent);
    super.new (name, parent);
    `uvm_info("sequencer Class", "constructor", UVM_NONE)
  endfunction
  
endclass
