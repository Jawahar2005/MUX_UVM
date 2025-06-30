class mux_monitor extends uvm_monitor;
  
  //Factory Registration
  `uvm_component_utils (mux_monitor)
  
  //Virtual Interface
  virtual mux_interface intf;
  
  //Handle Creation
  mux_sequence_item sq_item;
  
  //Analysis Port
  uvm_analysis_port #(mux_sequence_item) item_collected_port;
  
  //Constructor
  function new(string name = "mux_monitor", uvm_component parent);
    super.new (name, parent);
    `uvm_info("monitor class", "constructor", UVM_NONE)
  endfunction
  
  //Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("monitor class", "build_phase", UVM_NONE)
    item_collected_port = new("item_collected_port", this);
    sq_item = mux_sequence_item::type_id::create("sq_item");
    
    if(!uvm_config_db #(virtual mux_interface) :: get(this,"","vif",intf))
      `uvm_fatal("no_inif in driver","virtual interface get failed from config db");
  endfunction
  
  //Run task
  task run_phase (uvm_phase phase);
    super.run_phase (phase);
    forever begin 
      @(posedge intf.clk)
      `uvm_info ("monitor class", "run_task", UVM_NONE)
      sq_item.rst  = intf.rst;
      sq_item.i    = intf.i;
      sq_item.s    = intf.s;
      sq_item.y    = intf.y;
      
      item_collected_port.write(sq_item);
    end
  endtask
  
endclass
      
