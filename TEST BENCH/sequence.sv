class mux_sequence extends uvm_sequence;
  
  //Factory Registration
  `uvm_object_utils (mux_sequence)

  //Handle creation
  mux_sequence_item sq_item;
  
  //Constructor
  function new(string name = "mux_sequence");
    super.new (name);
    `uvm_info ("Sequence Class", "Constructor", UVM_NONE)
  endfunction
  
  //Task Body
  task body();
    
    repeat (200) begin
      
      sq_item = mux_sequence_item::type_id::create("sq_item");
      start_item(sq_item);
      sq_item.rst = 0;
      for(int index=0;index<16;index++) begin
        sq_item.i[index] = $random;
      end
      sq_item.s = $random;
      finish_item(sq_item);
    end
  endtask
endclass
