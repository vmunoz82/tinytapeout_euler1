WOKWI_PROJECT_ID=341271902949474898

# Simulate using Icarus Verilog
sim:
	iverilog -o user_module_$(WOKWI_PROJECT_ID).vvp \
	user_module_$(WOKWI_PROJECT_ID).v \
	tb/user_module_$(WOKWI_PROJECT_ID)_tb.v

	vvp user_module_$(WOKWI_PROJECT_ID).vvp

