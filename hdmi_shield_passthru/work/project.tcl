set projDir "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/planAhead"
set projName "hdmi_shield_passthru"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/mojo_top_0.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/reset_conditioner_1.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/edid_rom_2.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/hdmi_passthru_3.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/i2c_slave_4.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/dvi_decoder_5.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/dvi_encoder_6.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/edge_detector_7.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/pipeline_8.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/tmds_decoder_14.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/tmds_decoder_14.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/tmds_decoder_14.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/serdes_n_to_1_17.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/tmds_encoder_19.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/tmds_encoder_19.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/tmds_encoder_19.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/fifo_2x_reducer_22.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/serdes_n_to_1_17.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/serdes_n_to_1_17.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/serdes_n_to_1_17.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/serdes_1_to_5_29.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/bit_align_30.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/channel_align_31.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/serdes_1_to_5_29.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/bit_align_30.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/channel_align_31.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/serdes_1_to_5_29.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/bit_align_30.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/channel_align_31.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/async_fifo_40.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/async_fifo_51.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/async_fifo_51.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/async_fifo_51.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/simple_dual_ram_62.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/simple_dual_ram_63.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/simple_dual_ram_63.v" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/work/verilog/simple_dual_ram_63.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/constraint/hdmi.ucf" "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/constraint/hdmi_clock.ucf" "C:/Program\ Files/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set coreSources [list "C:/Users/HOME/Documents/GitHub/mojo-code-examples/hdmi_shield_passthru/coreGen/clk_wiz_v3_6.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $coreSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1