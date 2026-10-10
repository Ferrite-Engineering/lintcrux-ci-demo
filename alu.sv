// SPDX-License-Identifier: Apache-2.0
// A small ALU with deliberate lint findings, from the LintCrux getting-started example.

module alu #(
    parameter WIDTH = 8
) (
    input  logic             clk,
    input  logic             rst_n,
    input  logic [WIDTH-1:0] a,
    input  logic [WIDTH-1:0] b,
    input  logic [2:0]       op,
    output logic [WIDTH-1:0] result,
    output logic [3:0]       nibble,
    output logic             zero
);


  logic [WIDTH-1:0] carry_scratch;


  logic             overflow_flag;

  logic [WIDTH-1:0] next_result;





  always_comb begin
    case (op)
      3'b000: next_result = a + b;
      3'b001: next_result = a - b;
      3'b010: next_result = a & b;
      3'b011: next_result = a | b;
      3'b100: next_result = a ^ b;
    endcase
  end

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      result        <= '0;
      carry_scratch <= '0;
    end else begin
      result        <= next_result;
      carry_scratch <= a + b;
    end
  end




  assign nibble = a;

  assign zero   = (result == '0) | overflow_flag;

endmodule
