class mux_agent extends uvm_agent;
  
  //Factory Registration
  `uvm_component_utils (mux_agent)
  
  //Handle Creation
  
  mux_driver drv;
  mux_monitor mon;
  mux_sequencer seqr;
  
  //Constructor
  function new (string name ="mux_agent", uvm_component parent);
    super.new (name, parent);
    `uvm_info ("Agent class", "constructor", UVM_NONE)
  endfunction
  
  //Build phase
  function void build_phase (uvm_phase phase);
    super.build_phase (phase);
    `uvm_info("agent Class", "build_phase", UVM_NONE)
    
    drv  = mux_driver ::type_id::create("mux_driver", this);
    mon  = mux_monitor ::type_id::create("mux_monitor", this);
    seqr = mux_sequencer ::type_id::create("mux_sequencer", this);
  endfunction
  
  //connect phase
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("agent Class", "connect phase", UVM_NONE)
     
    drv.seq_item_port.connect(seqr.seq_item_export);

  endfunction
endclass    
    
  
