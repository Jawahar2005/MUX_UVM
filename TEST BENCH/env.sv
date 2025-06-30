class mux_environment extends uvm_env;
  
  //Factory Registration
  `uvm_component_utils (mux_environment)
  
  //Handle Creation
  mux_agent agent;
  mux_scoreboard scb;
  
  //Standart Constructor
  function new (string name ="mux_environment", uvm_component parent);
    super.new (name, parent);
    `uvm_info("env_class", "constructor", UVM_NONE)
  endfunction
  
  //build phase
  function void build_phase (uvm_phase phase);
    super.build_phase (phase);
    agent = mux_agent::type_id::create("agent", this);
    scb   = mux_scoreboard::type_id::create("scb", this);
  endfunction
  
  //connect phase
  function void connect_phase (uvm_phase phase);
    super.connect_phase (phase);
    `uvm_info ("agent class", "connect phase", UVM_NONE)
    
    agent.mon.item_collected_port.connect (scb.item_collected_export);
  endfunction
endclass   
