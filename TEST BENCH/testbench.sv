// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

//Include Classes
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

module mux_tb_top;
  
  //Interface Handle
  mux_interface intf();
  
  //Set Virtual Interface 
  initial begin
    uvm_config_db #(virtual mux_interface)::set(null,"*","vif",intf);
  end
  
  //Instantiation
  mux_16x1 mux_inst (
    .clk(intf.clk),
    .rst(intf.rst),
    .i(intf.i),
    .s(intf.s),
    .y(intf.y)
  );
  
  //Initialization
  initial begin
    intf.clk = 1'b1;
    intf.rst = 1'b1;
    intf.i   = 64'b0;
    intf.s   = 4'b0;
  end
  
  //Clock generation
  always #5 intf.clk =~intf.clk;
  
  //Test Call
  initial begin
    run_test("mux_test");
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
  
endmodule
  
  
