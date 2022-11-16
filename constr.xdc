#inputs
set_property PACKAGE_PIN V16 [get_ports Req[1]]
	set_property IOSTANDARD LVCMOS33 [get_ports Req[1]]
set_property PACKAGE_PIN W16 [get_ports Req[2]]
	set_property IOSTANDARD LVCMOS33 [get_ports Req[2]]
set_property PACKAGE_PIN W17 [get_ports Req[3]]
	set_property IOSTANDARD LVCMOS33 [get_ports Req[3]]
set_property PACKAGE_PIN W15 [get_ports Blk]
	set_property IOSTANDARD LVCMOS33 [get_ports Blk]
set_property PACKAGE_PIN R2 [get_ports Reset]
	set_property IOSTANDARD LVCMOS33 [get_ports Reset]

#clock
set_property PACKAGE_PIN U17 [get_ports clk]
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF]

#outputs
set_property PACKAGE_PIN V14 [get_ports FLR1]
	set_property IOSTANDARD LVCMOS33 [get_ports FLR1]
set_property PACKAGE_PIN V13 [get_ports FLR2]
	set_property IOSTANDARD LVCMOS33 [get_ports FLR2]
set_property PACKAGE_PIN V3 [get_ports FLR3]
	set_property IOSTANDARD LVCMOS33 [get_ports FLR3]
set_property PACKAGE_PIN W3 [get_ports Door]
	set_property IOSTANDARD LVCMOS33 [get_ports Door]
  
