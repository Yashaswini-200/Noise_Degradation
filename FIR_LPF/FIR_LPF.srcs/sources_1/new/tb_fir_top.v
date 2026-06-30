`timescale 1ns / 1ps

module tb_fir_top;

parameter DATA_WIDTH = 16;

reg clk;
reg rst;
reg clk_en;

reg signed [DATA_WIDTH-1:0] x_in;

wire signed [DATA_WIDTH-1:0] y_out;

/////////////////////////////////////////////////////////////
// DUT
/////////////////////////////////////////////////////////////

fir_top DUT
(
    .clk(clk),
    .rst(rst),
    .clk_en(clk_en),
    .x_in(x_in),
    .y_out(y_out)
);

/////////////////////////////////////////////////////////////
// Clock Generation
/////////////////////////////////////////////////////////////

initial
begin
    clk = 0;
    forever #5 clk = ~clk;      //100 MHz
end

/////////////////////////////////////////////////////////////
// Stimulus
/////////////////////////////////////////////////////////////

integer i;
/////////////////////////////////////////////////////////////
// File Handling
/////////////////////////////////////////////////////////////

integer infile;
integer outfile;
integer status;

reg signed [15:0] sample;
initial
begin

    //--------------------------------------------------
    // Open Files
    //--------------------------------------------------

    infile = $fopen("C:/Users/YASHASWINI/OneDrive/projects/FIR_LPF/input_samples.txt","r");

    if (infile == 0) begin
        $display("ERROR: Failed to open input file.");
        $display("Check the absolute path.");
        $finish;
    end
    
    $display("Input file opened successfully.");
    

    outfile = $fopen("C:/Users/YASHASWINI/OneDrive/projects/FIR_LPF/output_samples.txt","w");

    //--------------------------------------------------
    // Initialize
    //--------------------------------------------------

    rst    = 1;
    clk_en = 1;
    x_in   = 0;

    //--------------------------------------------------
    // Reset
    //--------------------------------------------------

    #20;
    rst = 0;

    //--------------------------------------------------
    // Read MATLAB Samples
    //--------------------------------------------------

    for(i=0; i<4096; i=i+1)
    begin

        @(posedge clk);

       if (!$feof(infile))
        begin
            status = $fscanf(infile,"%d\n",sample);

            $display("i=%0d sample=%0d", i, sample);

            x_in = sample;
        
            #1;

            if(i == 100)
            begin
            
                $display("====================================");
                $display("Sample %0d", i);
                $display("====================================");
            
                $display("pair0  = %d", DUT.pair0);
                $display("pair1  = %d", DUT.pair1);
                $display("pair2  = %d", DUT.pair2);
                $display("pair3  = %d", DUT.pair3);
                $display("pair4  = %d", DUT.pair4);
                $display("pair5  = %d", DUT.pair5);
                $display("pair6  = %d", DUT.pair6);
                $display("pair7  = %d", DUT.pair7);
                $display("pair8  = %d", DUT.pair8);
                $display("pair9  = %d", DUT.pair9);
                $display("pair10 = %d", DUT.pair10);
                $display("pair11 = %d", DUT.pair11);
                $display("pair12 = %d", DUT.pair12);
                $display("pair13 = %d", DUT.pair13);
                $display("pair14 = %d", DUT.pair14);
                $display("pair15 = %d", DUT.pair15);
                $display("pair16 = %d", DUT.pair16);
                $display("pair17 = %d", DUT.pair17);
                $display("pair18 = %d", DUT.pair18);
                $display("pair19 = %d", DUT.pair19);
                $display("pair20 = %d", DUT.pair20);
                $display("pair21 = %d", DUT.pair21);
            
                $display("------------------------------------");
            
                $display("prod0  = %d", DUT.prod0);
                $display("prod1  = %d", DUT.prod1);
                $display("prod2  = %d", DUT.prod2);
                $display("prod3  = %d", DUT.prod3);
                $display("prod4  = %d", DUT.prod4);
                $display("prod5  = %d", DUT.prod5);
                $display("prod6  = %d", DUT.prod6);
                $display("prod7  = %d", DUT.prod7);
                $display("prod8  = %d", DUT.prod8);
                $display("prod9  = %d", DUT.prod9);
                $display("prod10 = %d", DUT.prod10);
                $display("prod11 = %d", DUT.prod11);
                $display("prod12 = %d", DUT.prod12);
                $display("prod13 = %d", DUT.prod13);
                $display("prod14 = %d", DUT.prod14);
                $display("prod15 = %d", DUT.prod15);
                $display("prod16 = %d", DUT.prod16);
                $display("prod17 = %d", DUT.prod17);
                $display("prod18 = %d", DUT.prod18);
                $display("prod19 = %d", DUT.prod19);
                $display("prod20 = %d", DUT.prod20);
                $display("prod21 = %d", DUT.prod21);
            
                $display("------------------------------------");
                $display("acc = %d", DUT.acc_sum);
                $display("y   = %d", DUT.y_out);
                $display("====================================");
            
            end 
        end 
        
    end

   //--------------------------------------------------
// Flush Pipeline
//--------------------------------------------------

for(i=0;i<50;i=i+1)
begin
    @(posedge clk);
    x_in = 0;
end

//--------------------------------------------------
// Wait one more clock
//--------------------------------------------------

@(posedge clk);
#1;

$fclose(infile);
$fclose(outfile);

$finish;
end
/////////////////////////////////////////////////////////////
// Save Output Samples
/////////////////////////////////////////////////////////////

always @(posedge clk)
begin

    if(!rst)
        $fwrite(outfile,"%d\n",y_out);

end

/////////////////////////////////////////////////////////////
// Monitor
/////////////////////////////////////////////////////////////

initial
begin

    $display("---------------------------------------------");
    $display("Time\tInput\tOutput");
    $display("---------------------------------------------");

    $monitor("%0t\t%d\t%d",$time,x_in,y_out);

end

endmodule
