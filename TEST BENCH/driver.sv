class mux_driver extends uvm_driver #(mux_sequence_item);

  //Factory Registratin
  `uvm_component_utils (mux_driver)

  //Virtual interface
  virtual mux_interface intf;

  //Handle Creation - sequence item
  mux_sequence_item sq_item;

  //Constructor
  function new(string name = "mux_driver",uvm_component parent);
    super.new (name,parent);
    `uvm_info ("driver class" , "Constructor", UVM_NONE)
  endfunction

  //Build Phase
  function void build_phase (uvm_phase phase);
    super.build_phase (phase);
    `uvm_info("driver class", "build_phase", UVM_NONE)

    if(!uvm_config_db #(virtual mux_interface)::get(this,"","vif",intf))
      `uvm_fatal("no_inif in driver","virtual interface get failed from config db");

    sq_item = mux_sequence_item::type_id::create("sq_item");
  endfunction

  //Run phase
  task run_phase (uvm_phase phase);
    forever begin
      `uvm_info("driver Class", "run_phase", UVM_NONE)
      
      seq_item_port.get_next_item (sq_item);
      drive(sq_item);
      seq_item_port.item_done ();
    end
  endtask
  
    //Drive Task
  task drive (mux_sequence_item sq_item);
    @(posedge intf.clk) 
    `uvm_info("driver class", "drive_task", UVM_NONE)
    
    intf.rst  = sq_item.rst;
    intf.i    = sq_item.i;
    intf.s    = sq_item.s;
   
  endtask
endclass
                                                 
