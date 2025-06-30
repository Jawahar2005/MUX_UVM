class mux_scoreboard extends uvm_scoreboard;
  
  //Factory Registration
  `uvm_component_utils (mux_scoreboard);
  
  //Analysis Port
  uvm_analysis_imp #(mux_sequence_item, mux_scoreboard)  item_collected_export;
  
  //Constructor 
  function new (string name="mux_scoreboard", uvm_component parent);
    super.new (name, parent);
    `uvm_info("Scoreboard","constructor", UVM_NONE)
  endfunction
  
  //build phase
  function void build_phase (uvm_phase phase);
    super.build_phase (phase);
    `uvm_info("scoreboard", "build_phase", UVM_NONE)
    item_collected_export = new("item_collected_export", this);
  endfunction
  
  
  //write task
  virtual function void write(mux_sequence_item sq_item);
    `uvm_info ("scoreboard", $sformatf("Checking output for rst=%0b, s=%0d", sq_item.rst, sq_item.s), UVM_NONE)

    if (sq_item.rst) begin
      
      if (sq_item.y !== 0) begin
        $error("[%0t] Reset active but output y=%0d not zero. TEST FAILED", $time, sq_item.y);
      end else begin
        $display("[%0t] Reset active and output y=0. TEST PASSED", $time);
      end
    end else begin
      if (sq_item.y !== sq_item.i[sq_item.s]) begin
        $error("[%0t] Output mismatch: expected i[s]=%0d, got y=%0d. TEST FAILED", $time, sq_item.i[sq_item.s], sq_item.y);
      end else begin
        $display("[%0t] Output y=%0d matches expected i[s]=%0d. TEST PASSED", $time, sq_item.y,sq_item.i[sq_item.s]);
      end
    end
  endfunction

  
endclass
    
