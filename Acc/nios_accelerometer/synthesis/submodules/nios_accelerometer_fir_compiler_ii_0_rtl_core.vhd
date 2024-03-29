-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 22.1std (Release Build #915)
-- Quartus Prime development tool and MATLAB/Simulink Interface
-- 
-- Legal Notice: Copyright 2022 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from nios_accelerometer_fir_compiler_ii_0_rtl_core
-- VHDL created on Wed Mar 15 06:54:33 2023


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity nios_accelerometer_fir_compiler_ii_0_rtl_core is
    port (
        xIn_v : in std_logic_vector(0 downto 0);  -- sfix1
        xIn_c : in std_logic_vector(7 downto 0);  -- sfix8
        xIn_0 : in std_logic_vector(7 downto 0);  -- sfix8
        xOut_v : out std_logic_vector(0 downto 0);  -- ufix1
        xOut_c : out std_logic_vector(7 downto 0);  -- ufix8
        xOut_0 : out std_logic_vector(21 downto 0);  -- sfix22
        clk : in std_logic;
        areset : in std_logic
    );
end nios_accelerometer_fir_compiler_ii_0_rtl_core;

architecture normal of nios_accelerometer_fir_compiler_ii_0_rtl_core is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_memread_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_11_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_12_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_compute_q_17_q : STD_LOGIC_VECTOR (0 downto 0);
    signal d_u0_m0_wo0_wi0_r0_phasedelay0_q_16_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr1_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr1_q_14_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr2_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr3_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr3_q_13_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr4_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr4_q_12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr4_q_13_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr5_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr5_q_12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr6_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr7_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr7_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr8_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr8_q_12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr9_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr9_q_12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr10_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr11_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr12_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr13_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr13_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr13_q_12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr14_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr15_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr15_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr16_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr16_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr17_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr17_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr18_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr18_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr19_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr19_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr20_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr20_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr21_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr21_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr21_q_12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr22_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr23_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr23_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr24_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr24_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr25_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr25_q_12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr26_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr27_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr27_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr28_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr28_q_12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr29_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr29_q_12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr30_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr31_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr31_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr32_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr32_q_11_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr33_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr33_q_12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr34_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr35_q : STD_LOGIC_VECTOR (7 downto 0);
    signal d_u0_m0_wo0_wi0_r0_delayr35_q_12_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_wi0_r0_delayr36_q : STD_LOGIC_VECTOR (7 downto 0);
    signal u0_m0_wo0_mtree_add0_0_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_0_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_0_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_add0_2_a : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_add0_2_b : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_add0_2_o : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_add0_2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_add0_4_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_4_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_4_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_4_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_6_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add0_6_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add0_6_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add0_6_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add0_8_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_8_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_8_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_8_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_9_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_9_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_9_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_9_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add0_10_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add0_10_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add0_10_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add0_10_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add0_12_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add0_12_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add0_12_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add0_12_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add0_14_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_14_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_14_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_14_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_add0_16_a : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_add0_16_b : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_add0_16_o : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_add0_16_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_add1_0_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add1_0_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add1_0_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add1_0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add1_1_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add1_1_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add1_1_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add1_1_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add1_2_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add1_2_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add1_2_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add1_2_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add1_3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add1_3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add1_3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add1_3_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add1_4_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_4_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_4_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_4_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_5_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_5_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_5_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_5_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add1_6_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add1_6_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add1_6_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add1_6_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add1_7_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add1_7_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add1_7_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add1_7_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add1_8_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add1_8_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add1_8_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add1_8_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_add2_0_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add2_0_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add2_0_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add2_0_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add2_1_a : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add2_1_b : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add2_1_o : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add2_1_q : STD_LOGIC_VECTOR (17 downto 0);
    signal u0_m0_wo0_mtree_add2_2_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add2_2_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add2_2_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add2_2_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add2_3_a : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add2_3_b : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add2_3_o : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add2_3_q : STD_LOGIC_VECTOR (16 downto 0);
    signal u0_m0_wo0_mtree_add2_4_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add2_4_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add2_4_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add2_4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_add3_0_a : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add3_0_b : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add3_0_o : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add3_0_q : STD_LOGIC_VECTOR (18 downto 0);
    signal u0_m0_wo0_mtree_add3_1_a : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_add3_1_b : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_add3_1_o : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_add3_1_q : STD_LOGIC_VECTOR (19 downto 0);
    signal u0_m0_wo0_mtree_add4_0_a : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_add4_0_b : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_add4_0_o : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_add4_0_q : STD_LOGIC_VECTOR (20 downto 0);
    signal u0_m0_wo0_mtree_add5_0_a : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_add5_0_b : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_add5_0_o : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_mtree_add5_0_q : STD_LOGIC_VECTOR (21 downto 0);
    signal u0_m0_wo0_oseq_gated_reg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_add_1_a : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_add_1_b : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_add_1_o : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_add_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_sub_1_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_sub_1_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_sub_1_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_sub_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_add_1_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_add_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_add_1_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_add_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_sub_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_sub_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_sub_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_sub_3_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_sub_1_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_sub_1_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_sub_1_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_sub_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_add_1_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_add_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_add_1_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_add_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_add_1_a : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_add_1_b : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_add_1_o : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_add_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_sub_1_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_sub_1_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_sub_1_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_sub_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_sub_1_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_sub_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_sub_1_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_sub_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_sub_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_sub_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_sub_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_sub_3_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_1_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_1_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_add_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_sub_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_sub_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_sub_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_sub_3_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_add_1_a : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_add_1_b : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_add_1_o : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_add_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_add_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_add_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_add_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_add_3_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_add_1_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_add_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_add_1_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_add_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_sub_1_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_sub_1_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_sub_1_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_sub_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_3_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_3_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_add_3_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_sub_1_a : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_sub_1_b : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_sub_1_o : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_sub_1_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_sub_1_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_sub_1_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_sub_1_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_sub_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_add_3_a : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_add_3_b : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_add_3_o : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_add_3_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_add_1_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_add_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_add_1_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_add_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_1_a : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_1_b : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_1_o : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_add_3_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_add_1_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_add_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_add_1_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_add_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_sub_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_sub_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_sub_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_sub_3_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_sub_1_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_sub_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_sub_1_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_sub_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_sub_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_sub_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_sub_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_sub_3_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_1_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_1_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_1_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_sub_1_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_add_1_a : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_add_1_b : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_add_1_o : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_add_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_1_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_1_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_add_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_1_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_1_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_1_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_sub_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_1_a : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_1_b : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_1_o : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_add_1_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_3_a : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_3_b : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_3_o : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_sub_3_q : STD_LOGIC_VECTOR (12 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_a : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_b : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_o : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_sub_1_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_a : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_b : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_o : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_add_1_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_shift0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_36_shift0_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_shift0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_shift0_qint : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_shift0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_33_shift0_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_shift0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_shift0_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_shift2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_32_shift2_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_shift0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_31_shift0_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_shift0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_shift0_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_28_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_shift0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_shift0_qint : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_25_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_shift0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_shift0_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_shift2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_shift2_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift0_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift2_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_shift0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_shift0_qint : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_shift2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_shift2_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_shift0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_shift0_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift0_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift2_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_shift0_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_18_shift0_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_shift0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_shift0_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_shift2_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_shift2_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_shift0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_shift0_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_shift0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_shift0_qint : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_shift2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_shift2_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift0_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift2_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_shift0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_shift0_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_shift2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_shift2_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_11_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift0_qint : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_shift0_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_8_shift0_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift0_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_5_shift0_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift0_q : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift0_qint : STD_LOGIC_VECTOR (9 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_4_shift2_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_3_shift0_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift0_q : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift0_qint : STD_LOGIC_VECTOR (8 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift0_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_0_shift0_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_shift2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_35_shift2_qint : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_shift2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_29_shift2_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_shift2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_27_shift2_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_shift4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_24_shift4_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_23_shift4_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_shift4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_21_shift4_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_shift2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_20_shift2_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_19_shift4_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_shift4_q : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_17_shift4_qint : STD_LOGIC_VECTOR (15 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_shift2_q : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_16_shift2_qint : STD_LOGIC_VECTOR (14 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_shift4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_15_shift4_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_13_shift4_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_shift4_q : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_12_shift4_qint : STD_LOGIC_VECTOR (13 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_9_shift2_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift2_q : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_7_shift2_qint : STD_LOGIC_VECTOR (11 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift2_q : STD_LOGIC_VECTOR (10 downto 0);
    signal u0_m0_wo0_mtree_mult1_1_shift2_qint : STD_LOGIC_VECTOR (10 downto 0);

begin


    -- VCC(CONSTANT,1)@0
    VCC_q <= "1";

    -- d_u0_m0_wo0_wi0_r0_phasedelay0_q_16(DELAY,278)@10 + 6
    d_u0_m0_wo0_wi0_r0_phasedelay0_q_16 : dspba_delay
    GENERIC MAP ( width => 8, depth => 6, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => d_u0_m0_wo0_wi0_r0_phasedelay0_q_16_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_36_shift0(BITSHIFT,183)@16
    u0_m0_wo0_mtree_mult1_36_shift0_qint <= d_u0_m0_wo0_wi0_r0_phasedelay0_q_16_q & "000";
    u0_m0_wo0_mtree_mult1_36_shift0_q <= u0_m0_wo0_mtree_mult1_36_shift0_qint(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_35_shift0(BITSHIFT,184)@14
    u0_m0_wo0_mtree_mult1_35_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr1_q_14_q & "0";
    u0_m0_wo0_mtree_mult1_35_shift0_q <= u0_m0_wo0_mtree_mult1_35_shift0_qint(8 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr1(DELAY,20)@10
    u0_m0_wo0_wi0_r0_delayr1 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_0, xout => u0_m0_wo0_wi0_r0_delayr1_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr1_q_14(DELAY,279)@10 + 4
    d_u0_m0_wo0_wi0_r0_delayr1_q_14 : dspba_delay
    GENERIC MAP ( width => 8, depth => 4, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => d_u0_m0_wo0_wi0_r0_delayr1_q_14_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_35_add_1(ADD,185)@14 + 1
    u0_m0_wo0_mtree_mult1_35_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 8 => d_u0_m0_wo0_wi0_r0_delayr1_q_14_q(7)) & d_u0_m0_wo0_wi0_r0_delayr1_q_14_q));
    u0_m0_wo0_mtree_mult1_35_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_35_shift0_q(8)) & u0_m0_wo0_mtree_mult1_35_shift0_q));
    u0_m0_wo0_mtree_mult1_35_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_35_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_35_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_35_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_35_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_35_add_1_q <= u0_m0_wo0_mtree_mult1_35_add_1_o(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_35_shift2(BITSHIFT,186)@15
    u0_m0_wo0_mtree_mult1_35_shift2_qint <= u0_m0_wo0_mtree_mult1_35_add_1_q & "0";
    u0_m0_wo0_mtree_mult1_35_shift2_q <= u0_m0_wo0_mtree_mult1_35_shift2_qint(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_33_shift0(BITSHIFT,187)@13
    u0_m0_wo0_mtree_mult1_33_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr3_q_13_q & "000";
    u0_m0_wo0_mtree_mult1_33_shift0_q <= u0_m0_wo0_mtree_mult1_33_shift0_qint(10 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr2(DELAY,21)@10
    u0_m0_wo0_wi0_r0_delayr2 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr1_q, xout => u0_m0_wo0_wi0_r0_delayr2_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr3(DELAY,22)@10
    u0_m0_wo0_wi0_r0_delayr3 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr2_q, xout => u0_m0_wo0_wi0_r0_delayr3_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr3_q_13(DELAY,280)@10 + 3
    d_u0_m0_wo0_wi0_r0_delayr3_q_13 : dspba_delay
    GENERIC MAP ( width => 8, depth => 3, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr3_q, xout => d_u0_m0_wo0_wi0_r0_delayr3_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_33_sub_1(SUB,188)@13 + 1
    u0_m0_wo0_mtree_mult1_33_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 8 => d_u0_m0_wo0_wi0_r0_delayr3_q_13_q(7)) & d_u0_m0_wo0_wi0_r0_delayr3_q_13_q));
    u0_m0_wo0_mtree_mult1_33_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_33_shift0_q(10)) & u0_m0_wo0_mtree_mult1_33_shift0_q));
    u0_m0_wo0_mtree_mult1_33_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_33_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_33_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_33_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_33_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_33_sub_1_q <= u0_m0_wo0_mtree_mult1_33_sub_1_o(11 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr4(DELAY,23)@10
    u0_m0_wo0_wi0_r0_delayr4 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr3_q, xout => u0_m0_wo0_wi0_r0_delayr4_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr4_q_12(DELAY,281)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr4_q_12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr4_q, xout => d_u0_m0_wo0_wi0_r0_delayr4_q_12_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr4_q_13(DELAY,282)@12 + 1
    d_u0_m0_wo0_wi0_r0_delayr4_q_13 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr4_q_12_q, xout => d_u0_m0_wo0_wi0_r0_delayr4_q_13_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_32_shift2(BITSHIFT,191)@13
    u0_m0_wo0_mtree_mult1_32_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr4_q_13_q & "0000";
    u0_m0_wo0_mtree_mult1_32_shift2_q <= u0_m0_wo0_mtree_mult1_32_shift2_qint(11 downto 0);

    -- u0_m0_wo0_mtree_mult1_32_shift0(BITSHIFT,189)@12
    u0_m0_wo0_mtree_mult1_32_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr4_q_12_q & "00";
    u0_m0_wo0_mtree_mult1_32_shift0_q <= u0_m0_wo0_mtree_mult1_32_shift0_qint(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_32_add_1(ADD,190)@12 + 1
    u0_m0_wo0_mtree_mult1_32_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => d_u0_m0_wo0_wi0_r0_delayr4_q_12_q(7)) & d_u0_m0_wo0_wi0_r0_delayr4_q_12_q));
    u0_m0_wo0_mtree_mult1_32_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_32_shift0_q(9)) & u0_m0_wo0_mtree_mult1_32_shift0_q));
    u0_m0_wo0_mtree_mult1_32_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_32_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_32_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_32_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_32_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_32_add_1_q <= u0_m0_wo0_mtree_mult1_32_add_1_o(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_32_sub_3(SUB,192)@13 + 1
    u0_m0_wo0_mtree_mult1_32_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => u0_m0_wo0_mtree_mult1_32_add_1_q(10)) & u0_m0_wo0_mtree_mult1_32_add_1_q));
    u0_m0_wo0_mtree_mult1_32_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_mtree_mult1_32_shift2_q(11)) & u0_m0_wo0_mtree_mult1_32_shift2_q));
    u0_m0_wo0_mtree_mult1_32_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_32_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_32_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_32_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_32_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_32_sub_3_q <= u0_m0_wo0_mtree_mult1_32_sub_3_o(12 downto 0);

    -- u0_m0_wo0_mtree_add0_16(ADD,149)@14 + 1
    u0_m0_wo0_mtree_add0_16_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => u0_m0_wo0_mtree_mult1_32_sub_3_q(12)) & u0_m0_wo0_mtree_mult1_32_sub_3_q));
    u0_m0_wo0_mtree_add0_16_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => u0_m0_wo0_mtree_mult1_33_sub_1_q(11)) & u0_m0_wo0_mtree_mult1_33_sub_1_q));
    u0_m0_wo0_mtree_add0_16_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_16_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_16_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_16_a) + SIGNED(u0_m0_wo0_mtree_add0_16_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_16_q <= u0_m0_wo0_mtree_add0_16_o(13 downto 0);

    -- u0_m0_wo0_mtree_add1_8(ADD,159)@15 + 1
    u0_m0_wo0_mtree_add1_8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_add0_16_q(13)) & u0_m0_wo0_mtree_add0_16_q));
    u0_m0_wo0_mtree_add1_8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 11 => u0_m0_wo0_mtree_mult1_35_shift2_q(10)) & u0_m0_wo0_mtree_mult1_35_shift2_q));
    u0_m0_wo0_mtree_add1_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_8_a) + SIGNED(u0_m0_wo0_mtree_add1_8_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_8_q <= u0_m0_wo0_mtree_add1_8_o(14 downto 0);

    -- u0_m0_wo0_mtree_add2_4(ADD,164)@16 + 1
    u0_m0_wo0_mtree_add2_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_add1_8_q(14)) & u0_m0_wo0_mtree_add1_8_q));
    u0_m0_wo0_mtree_add2_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 11 => u0_m0_wo0_mtree_mult1_36_shift0_q(10)) & u0_m0_wo0_mtree_mult1_36_shift0_q));
    u0_m0_wo0_mtree_add2_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_4_a) + SIGNED(u0_m0_wo0_mtree_add2_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_4_q <= u0_m0_wo0_mtree_add2_4_o(15 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr5(DELAY,24)@10
    u0_m0_wo0_wi0_r0_delayr5 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr4_q, xout => u0_m0_wo0_wi0_r0_delayr5_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr5_q_12(DELAY,283)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr5_q_12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr5_q, xout => d_u0_m0_wo0_wi0_r0_delayr5_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_31_shift0(BITSHIFT,193)@12
    u0_m0_wo0_mtree_mult1_31_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr5_q_12_q & "000";
    u0_m0_wo0_mtree_mult1_31_shift0_q <= u0_m0_wo0_mtree_mult1_31_shift0_qint(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_31_sub_1(SUB,194)@12 + 1
    u0_m0_wo0_mtree_mult1_31_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q));
    u0_m0_wo0_mtree_mult1_31_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_31_shift0_q(10)) & u0_m0_wo0_mtree_mult1_31_shift0_q));
    u0_m0_wo0_mtree_mult1_31_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_31_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_31_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_31_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_31_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_31_sub_1_q <= u0_m0_wo0_mtree_mult1_31_sub_1_o(11 downto 0);

    -- u0_m0_wo0_mtree_mult1_29_shift0(BITSHIFT,195)@11
    u0_m0_wo0_mtree_mult1_29_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr7_q_11_q & "00";
    u0_m0_wo0_mtree_mult1_29_shift0_q <= u0_m0_wo0_mtree_mult1_29_shift0_qint(9 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr6(DELAY,25)@10
    u0_m0_wo0_wi0_r0_delayr6 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr5_q, xout => u0_m0_wo0_wi0_r0_delayr6_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr7(DELAY,26)@10
    u0_m0_wo0_wi0_r0_delayr7 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr6_q, xout => u0_m0_wo0_wi0_r0_delayr7_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr7_q_11(DELAY,284)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr7_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr7_q, xout => d_u0_m0_wo0_wi0_r0_delayr7_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_29_add_1(ADD,196)@11 + 1
    u0_m0_wo0_mtree_mult1_29_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => d_u0_m0_wo0_wi0_r0_delayr7_q_11_q(7)) & d_u0_m0_wo0_wi0_r0_delayr7_q_11_q));
    u0_m0_wo0_mtree_mult1_29_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_29_shift0_q(9)) & u0_m0_wo0_mtree_mult1_29_shift0_q));
    u0_m0_wo0_mtree_mult1_29_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_29_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_29_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_29_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_29_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_29_add_1_q <= u0_m0_wo0_mtree_mult1_29_add_1_o(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_29_shift2(BITSHIFT,197)@12
    u0_m0_wo0_mtree_mult1_29_shift2_qint <= u0_m0_wo0_mtree_mult1_29_add_1_q & "0";
    u0_m0_wo0_mtree_mult1_29_shift2_q <= u0_m0_wo0_mtree_mult1_29_shift2_qint(11 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr8(DELAY,27)@10
    u0_m0_wo0_wi0_r0_delayr8 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr7_q, xout => u0_m0_wo0_wi0_r0_delayr8_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr8_q_12(DELAY,285)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr8_q_12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr8_q, xout => d_u0_m0_wo0_wi0_r0_delayr8_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_28_shift0(BITSHIFT,198)@12
    u0_m0_wo0_mtree_mult1_28_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr8_q_12_q & "0000";
    u0_m0_wo0_mtree_mult1_28_shift0_q <= u0_m0_wo0_mtree_mult1_28_shift0_qint(11 downto 0);

    -- u0_m0_wo0_mtree_add0_14(ADD,147)@12 + 1
    u0_m0_wo0_mtree_add0_14_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_mtree_mult1_28_shift0_q(11)) & u0_m0_wo0_mtree_mult1_28_shift0_q));
    u0_m0_wo0_mtree_add0_14_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_mtree_mult1_29_shift2_q(11)) & u0_m0_wo0_mtree_mult1_29_shift2_q));
    u0_m0_wo0_mtree_add0_14_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_14_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_14_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_14_a) + SIGNED(u0_m0_wo0_mtree_add0_14_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_14_q <= u0_m0_wo0_mtree_add0_14_o(12 downto 0);

    -- u0_m0_wo0_mtree_add1_7(ADD,158)@13 + 1
    u0_m0_wo0_mtree_add1_7_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => u0_m0_wo0_mtree_add0_14_q(12)) & u0_m0_wo0_mtree_add0_14_q));
    u0_m0_wo0_mtree_add1_7_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 12 => u0_m0_wo0_mtree_mult1_31_sub_1_q(11)) & u0_m0_wo0_mtree_mult1_31_sub_1_q));
    u0_m0_wo0_mtree_add1_7_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_7_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_7_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_7_a) + SIGNED(u0_m0_wo0_mtree_add1_7_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_7_q <= u0_m0_wo0_mtree_add1_7_o(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_27_shift0(BITSHIFT,199)@12
    u0_m0_wo0_mtree_mult1_27_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr9_q_12_q & "0";
    u0_m0_wo0_mtree_mult1_27_shift0_q <= u0_m0_wo0_mtree_mult1_27_shift0_qint(8 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr9(DELAY,28)@10
    u0_m0_wo0_wi0_r0_delayr9 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr8_q, xout => u0_m0_wo0_wi0_r0_delayr9_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr9_q_12(DELAY,286)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr9_q_12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr9_q, xout => d_u0_m0_wo0_wi0_r0_delayr9_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_27_add_1(ADD,200)@12 + 1
    u0_m0_wo0_mtree_mult1_27_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 8 => d_u0_m0_wo0_wi0_r0_delayr9_q_12_q(7)) & d_u0_m0_wo0_wi0_r0_delayr9_q_12_q));
    u0_m0_wo0_mtree_mult1_27_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_27_shift0_q(8)) & u0_m0_wo0_mtree_mult1_27_shift0_q));
    u0_m0_wo0_mtree_mult1_27_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_27_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_27_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_27_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_27_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_27_add_1_q <= u0_m0_wo0_mtree_mult1_27_add_1_o(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_27_shift2(BITSHIFT,201)@13
    u0_m0_wo0_mtree_mult1_27_shift2_qint <= u0_m0_wo0_mtree_mult1_27_add_1_q & "00";
    u0_m0_wo0_mtree_mult1_27_shift2_q <= u0_m0_wo0_mtree_mult1_27_shift2_qint(11 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr10(DELAY,29)@10
    u0_m0_wo0_wi0_r0_delayr10 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr9_q, xout => u0_m0_wo0_wi0_r0_delayr10_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr11(DELAY,30)@10
    u0_m0_wo0_wi0_r0_delayr11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr10_q, xout => u0_m0_wo0_wi0_r0_delayr11_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr11_q_11(DELAY,287)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr11_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr11_q, xout => d_u0_m0_wo0_wi0_r0_delayr11_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_25_shift0(BITSHIFT,202)@11
    u0_m0_wo0_mtree_mult1_25_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr11_q_11_q & "0000";
    u0_m0_wo0_mtree_mult1_25_shift0_q <= u0_m0_wo0_mtree_mult1_25_shift0_qint(11 downto 0);

    -- u0_m0_wo0_mtree_mult1_25_sub_1(SUB,203)@11 + 1
    u0_m0_wo0_mtree_mult1_25_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 1 => GND_q(0)) & GND_q));
    u0_m0_wo0_mtree_mult1_25_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_mtree_mult1_25_shift0_q(11)) & u0_m0_wo0_mtree_mult1_25_shift0_q));
    u0_m0_wo0_mtree_mult1_25_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_25_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_25_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_25_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_25_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_25_sub_1_q <= u0_m0_wo0_mtree_mult1_25_sub_1_o(12 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr12(DELAY,31)@10
    u0_m0_wo0_wi0_r0_delayr12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr11_q, xout => u0_m0_wo0_wi0_r0_delayr12_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr12_q_11(DELAY,288)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr12_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr12_q, xout => d_u0_m0_wo0_wi0_r0_delayr12_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_24_shift2(BITSHIFT,206)@11
    u0_m0_wo0_mtree_mult1_24_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr12_q_11_q & "0000";
    u0_m0_wo0_mtree_mult1_24_shift2_q <= u0_m0_wo0_mtree_mult1_24_shift2_qint(11 downto 0);

    -- u0_m0_wo0_mtree_mult1_24_shift0(BITSHIFT,204)@10
    u0_m0_wo0_mtree_mult1_24_shift0_qint <= u0_m0_wo0_wi0_r0_delayr12_q & "00";
    u0_m0_wo0_mtree_mult1_24_shift0_q <= u0_m0_wo0_mtree_mult1_24_shift0_qint(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_24_sub_1(SUB,205)@10 + 1
    u0_m0_wo0_mtree_mult1_24_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_24_shift0_q(9)) & u0_m0_wo0_mtree_mult1_24_shift0_q));
    u0_m0_wo0_mtree_mult1_24_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => u0_m0_wo0_wi0_r0_delayr12_q(7)) & u0_m0_wo0_wi0_r0_delayr12_q));
    u0_m0_wo0_mtree_mult1_24_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_24_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_24_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_24_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_24_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_24_sub_1_q <= u0_m0_wo0_mtree_mult1_24_sub_1_o(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_24_sub_3(SUB,207)@11 + 1
    u0_m0_wo0_mtree_mult1_24_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => u0_m0_wo0_mtree_mult1_24_sub_1_q(10)) & u0_m0_wo0_mtree_mult1_24_sub_1_q));
    u0_m0_wo0_mtree_mult1_24_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_mtree_mult1_24_shift2_q(11)) & u0_m0_wo0_mtree_mult1_24_shift2_q));
    u0_m0_wo0_mtree_mult1_24_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_24_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_24_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_24_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_24_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_24_sub_3_q <= u0_m0_wo0_mtree_mult1_24_sub_3_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_24_shift4(BITSHIFT,208)@12
    u0_m0_wo0_mtree_mult1_24_shift4_qint <= u0_m0_wo0_mtree_mult1_24_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_24_shift4_q <= u0_m0_wo0_mtree_mult1_24_shift4_qint(13 downto 0);

    -- u0_m0_wo0_mtree_add0_12(ADD,145)@12 + 1
    u0_m0_wo0_mtree_add0_12_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_24_shift4_q(13)) & u0_m0_wo0_mtree_mult1_24_shift4_q));
    u0_m0_wo0_mtree_add0_12_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 13 => u0_m0_wo0_mtree_mult1_25_sub_1_q(12)) & u0_m0_wo0_mtree_mult1_25_sub_1_q));
    u0_m0_wo0_mtree_add0_12_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_12_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_12_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_12_a) + SIGNED(u0_m0_wo0_mtree_add0_12_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_12_q <= u0_m0_wo0_mtree_add0_12_o(14 downto 0);

    -- u0_m0_wo0_mtree_add1_6(ADD,157)@13 + 1
    u0_m0_wo0_mtree_add1_6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_add0_12_q(14)) & u0_m0_wo0_mtree_add0_12_q));
    u0_m0_wo0_mtree_add1_6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 12 => u0_m0_wo0_mtree_mult1_27_shift2_q(11)) & u0_m0_wo0_mtree_mult1_27_shift2_q));
    u0_m0_wo0_mtree_add1_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_6_a) + SIGNED(u0_m0_wo0_mtree_add1_6_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_6_q <= u0_m0_wo0_mtree_add1_6_o(15 downto 0);

    -- u0_m0_wo0_mtree_add2_3(ADD,163)@14 + 1
    u0_m0_wo0_mtree_add2_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_add1_6_q(15)) & u0_m0_wo0_mtree_add1_6_q));
    u0_m0_wo0_mtree_add2_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_add1_7_q(15)) & u0_m0_wo0_mtree_add1_7_q));
    u0_m0_wo0_mtree_add2_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_3_a) + SIGNED(u0_m0_wo0_mtree_add2_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_3_q <= u0_m0_wo0_mtree_add2_3_o(16 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr13(DELAY,32)@10
    u0_m0_wo0_wi0_r0_delayr13 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr12_q, xout => u0_m0_wo0_wi0_r0_delayr13_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr13_q_11(DELAY,289)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr13_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr13_q, xout => d_u0_m0_wo0_wi0_r0_delayr13_q_11_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr13_q_12(DELAY,290)@11 + 1
    d_u0_m0_wo0_wi0_r0_delayr13_q_12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr13_q_11_q, xout => d_u0_m0_wo0_wi0_r0_delayr13_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_23_shift2(BITSHIFT,211)@12
    u0_m0_wo0_mtree_mult1_23_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr13_q_12_q & "0000";
    u0_m0_wo0_mtree_mult1_23_shift2_q <= u0_m0_wo0_mtree_mult1_23_shift2_qint(11 downto 0);

    -- u0_m0_wo0_mtree_mult1_23_shift0(BITSHIFT,209)@11
    u0_m0_wo0_mtree_mult1_23_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr13_q_11_q & "00";
    u0_m0_wo0_mtree_mult1_23_shift0_q <= u0_m0_wo0_mtree_mult1_23_shift0_qint(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_23_add_1(ADD,210)@11 + 1
    u0_m0_wo0_mtree_mult1_23_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => d_u0_m0_wo0_wi0_r0_delayr13_q_11_q(7)) & d_u0_m0_wo0_wi0_r0_delayr13_q_11_q));
    u0_m0_wo0_mtree_mult1_23_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_23_shift0_q(9)) & u0_m0_wo0_mtree_mult1_23_shift0_q));
    u0_m0_wo0_mtree_mult1_23_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_23_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_23_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_23_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_23_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_23_add_1_q <= u0_m0_wo0_mtree_mult1_23_add_1_o(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_23_sub_3(SUB,212)@12 + 1
    u0_m0_wo0_mtree_mult1_23_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => u0_m0_wo0_mtree_mult1_23_add_1_q(10)) & u0_m0_wo0_mtree_mult1_23_add_1_q));
    u0_m0_wo0_mtree_mult1_23_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_mtree_mult1_23_shift2_q(11)) & u0_m0_wo0_mtree_mult1_23_shift2_q));
    u0_m0_wo0_mtree_mult1_23_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_23_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_23_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_23_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_23_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_23_sub_3_q <= u0_m0_wo0_mtree_mult1_23_sub_3_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_23_shift4(BITSHIFT,213)@13
    u0_m0_wo0_mtree_mult1_23_shift4_qint <= u0_m0_wo0_mtree_mult1_23_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_23_shift4_q <= u0_m0_wo0_mtree_mult1_23_shift4_qint(13 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr14(DELAY,33)@10
    u0_m0_wo0_wi0_r0_delayr14 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr13_q, xout => u0_m0_wo0_wi0_r0_delayr14_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr15(DELAY,34)@10
    u0_m0_wo0_wi0_r0_delayr15 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr14_q, xout => u0_m0_wo0_wi0_r0_delayr15_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr15_q_11(DELAY,291)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr15_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr15_q, xout => d_u0_m0_wo0_wi0_r0_delayr15_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_21_shift2(BITSHIFT,216)@11
    u0_m0_wo0_mtree_mult1_21_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr15_q_11_q & "0000";
    u0_m0_wo0_mtree_mult1_21_shift2_q <= u0_m0_wo0_mtree_mult1_21_shift2_qint(11 downto 0);

    -- u0_m0_wo0_mtree_mult1_21_shift0(BITSHIFT,214)@10
    u0_m0_wo0_mtree_mult1_21_shift0_qint <= u0_m0_wo0_wi0_r0_delayr15_q & "0";
    u0_m0_wo0_mtree_mult1_21_shift0_q <= u0_m0_wo0_mtree_mult1_21_shift0_qint(8 downto 0);

    -- u0_m0_wo0_mtree_mult1_21_add_1(ADD,215)@10 + 1
    u0_m0_wo0_mtree_mult1_21_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 8 => u0_m0_wo0_wi0_r0_delayr15_q(7)) & u0_m0_wo0_wi0_r0_delayr15_q));
    u0_m0_wo0_mtree_mult1_21_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_21_shift0_q(8)) & u0_m0_wo0_mtree_mult1_21_shift0_q));
    u0_m0_wo0_mtree_mult1_21_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_21_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_21_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_21_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_21_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_21_add_1_q <= u0_m0_wo0_mtree_mult1_21_add_1_o(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_21_add_3(ADD,217)@11 + 1
    u0_m0_wo0_mtree_mult1_21_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 10 => u0_m0_wo0_mtree_mult1_21_add_1_q(9)) & u0_m0_wo0_mtree_mult1_21_add_1_q));
    u0_m0_wo0_mtree_mult1_21_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_mtree_mult1_21_shift2_q(11)) & u0_m0_wo0_mtree_mult1_21_shift2_q));
    u0_m0_wo0_mtree_mult1_21_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_21_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_21_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_21_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_21_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_21_add_3_q <= u0_m0_wo0_mtree_mult1_21_add_3_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_21_shift4(BITSHIFT,218)@12
    u0_m0_wo0_mtree_mult1_21_shift4_qint <= u0_m0_wo0_mtree_mult1_21_add_3_q & "0";
    u0_m0_wo0_mtree_mult1_21_shift4_q <= u0_m0_wo0_mtree_mult1_21_shift4_qint(13 downto 0);

    -- u0_m0_wo0_mtree_mult1_20_shift0(BITSHIFT,219)@11
    u0_m0_wo0_mtree_mult1_20_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr16_q_11_q & "00";
    u0_m0_wo0_mtree_mult1_20_shift0_q <= u0_m0_wo0_mtree_mult1_20_shift0_qint(9 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr16(DELAY,35)@10
    u0_m0_wo0_wi0_r0_delayr16 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr15_q, xout => u0_m0_wo0_wi0_r0_delayr16_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr16_q_11(DELAY,292)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr16_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr16_q, xout => d_u0_m0_wo0_wi0_r0_delayr16_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_20_add_1(ADD,220)@11 + 1
    u0_m0_wo0_mtree_mult1_20_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => d_u0_m0_wo0_wi0_r0_delayr16_q_11_q(7)) & d_u0_m0_wo0_wi0_r0_delayr16_q_11_q));
    u0_m0_wo0_mtree_mult1_20_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_20_shift0_q(9)) & u0_m0_wo0_mtree_mult1_20_shift0_q));
    u0_m0_wo0_mtree_mult1_20_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_20_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_20_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_20_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_20_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_20_add_1_q <= u0_m0_wo0_mtree_mult1_20_add_1_o(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_20_shift2(BITSHIFT,221)@12
    u0_m0_wo0_mtree_mult1_20_shift2_qint <= u0_m0_wo0_mtree_mult1_20_add_1_q & "0000";
    u0_m0_wo0_mtree_mult1_20_shift2_q <= u0_m0_wo0_mtree_mult1_20_shift2_qint(14 downto 0);

    -- u0_m0_wo0_mtree_add0_10(ADD,143)@12 + 1
    u0_m0_wo0_mtree_add0_10_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_mult1_20_shift2_q(14)) & u0_m0_wo0_mtree_mult1_20_shift2_q));
    u0_m0_wo0_mtree_add0_10_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 14 => u0_m0_wo0_mtree_mult1_21_shift4_q(13)) & u0_m0_wo0_mtree_mult1_21_shift4_q));
    u0_m0_wo0_mtree_add0_10_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_10_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_10_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_10_a) + SIGNED(u0_m0_wo0_mtree_add0_10_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_10_q <= u0_m0_wo0_mtree_add0_10_o(15 downto 0);

    -- u0_m0_wo0_mtree_add1_5(ADD,156)@13 + 1
    u0_m0_wo0_mtree_add1_5_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => u0_m0_wo0_mtree_add0_10_q(15)) & u0_m0_wo0_mtree_add0_10_q));
    u0_m0_wo0_mtree_add1_5_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 14 => u0_m0_wo0_mtree_mult1_23_shift4_q(13)) & u0_m0_wo0_mtree_mult1_23_shift4_q));
    u0_m0_wo0_mtree_add1_5_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_5_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_5_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_5_a) + SIGNED(u0_m0_wo0_mtree_add1_5_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_5_q <= u0_m0_wo0_mtree_add1_5_o(17 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr17(DELAY,36)@10
    u0_m0_wo0_wi0_r0_delayr17 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr16_q, xout => u0_m0_wo0_wi0_r0_delayr17_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr17_q_11(DELAY,293)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr17_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr17_q, xout => d_u0_m0_wo0_wi0_r0_delayr17_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_19_shift2(BITSHIFT,224)@11
    u0_m0_wo0_mtree_mult1_19_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr17_q_11_q & "000000";
    u0_m0_wo0_mtree_mult1_19_shift2_q <= u0_m0_wo0_mtree_mult1_19_shift2_qint(13 downto 0);

    -- u0_m0_wo0_mtree_mult1_19_shift0(BITSHIFT,222)@10
    u0_m0_wo0_mtree_mult1_19_shift0_qint <= u0_m0_wo0_wi0_r0_delayr17_q & "000";
    u0_m0_wo0_mtree_mult1_19_shift0_q <= u0_m0_wo0_mtree_mult1_19_shift0_qint(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_19_sub_1(SUB,223)@10 + 1
    u0_m0_wo0_mtree_mult1_19_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 8 => u0_m0_wo0_wi0_r0_delayr17_q(7)) & u0_m0_wo0_wi0_r0_delayr17_q));
    u0_m0_wo0_mtree_mult1_19_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_19_shift0_q(10)) & u0_m0_wo0_mtree_mult1_19_shift0_q));
    u0_m0_wo0_mtree_mult1_19_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_19_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_19_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_19_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_19_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_19_sub_1_q <= u0_m0_wo0_mtree_mult1_19_sub_1_o(11 downto 0);

    -- u0_m0_wo0_mtree_mult1_19_add_3(ADD,225)@11 + 1
    u0_m0_wo0_mtree_mult1_19_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => u0_m0_wo0_mtree_mult1_19_sub_1_q(11)) & u0_m0_wo0_mtree_mult1_19_sub_1_q));
    u0_m0_wo0_mtree_mult1_19_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_19_shift2_q(13)) & u0_m0_wo0_mtree_mult1_19_shift2_q));
    u0_m0_wo0_mtree_mult1_19_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_19_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_19_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_19_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_19_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_19_add_3_q <= u0_m0_wo0_mtree_mult1_19_add_3_o(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_19_shift4(BITSHIFT,226)@12
    u0_m0_wo0_mtree_mult1_19_shift4_qint <= u0_m0_wo0_mtree_mult1_19_add_3_q & "0";
    u0_m0_wo0_mtree_mult1_19_shift4_q <= u0_m0_wo0_mtree_mult1_19_shift4_qint(15 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr18(DELAY,37)@10
    u0_m0_wo0_wi0_r0_delayr18 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr17_q, xout => u0_m0_wo0_wi0_r0_delayr18_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr18_q_11(DELAY,294)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr18_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr18_q, xout => d_u0_m0_wo0_wi0_r0_delayr18_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_18_shift0(BITSHIFT,227)@11
    u0_m0_wo0_mtree_mult1_18_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr18_q_11_q & "0000000";
    u0_m0_wo0_mtree_mult1_18_shift0_q <= u0_m0_wo0_mtree_mult1_18_shift0_qint(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_18_sub_1(SUB,228)@11 + 1
    u0_m0_wo0_mtree_mult1_18_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_mult1_18_shift0_q(14)) & u0_m0_wo0_mtree_mult1_18_shift0_q));
    u0_m0_wo0_mtree_mult1_18_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 8 => d_u0_m0_wo0_wi0_r0_delayr18_q_11_q(7)) & d_u0_m0_wo0_wi0_r0_delayr18_q_11_q));
    u0_m0_wo0_mtree_mult1_18_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_18_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_18_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_18_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_18_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_18_sub_1_q <= u0_m0_wo0_mtree_mult1_18_sub_1_o(15 downto 0);

    -- u0_m0_wo0_mtree_add0_9(ADD,142)@12 + 1
    u0_m0_wo0_mtree_add0_9_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_18_sub_1_q(15)) & u0_m0_wo0_mtree_mult1_18_sub_1_q));
    u0_m0_wo0_mtree_add0_9_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_19_shift4_q(15)) & u0_m0_wo0_mtree_mult1_19_shift4_q));
    u0_m0_wo0_mtree_add0_9_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_9_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_9_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_9_a) + SIGNED(u0_m0_wo0_mtree_add0_9_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_9_q <= u0_m0_wo0_mtree_add0_9_o(16 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr19(DELAY,38)@10
    u0_m0_wo0_wi0_r0_delayr19 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr18_q, xout => u0_m0_wo0_wi0_r0_delayr19_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr19_q_11(DELAY,295)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr19_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr19_q, xout => d_u0_m0_wo0_wi0_r0_delayr19_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_17_shift2(BITSHIFT,231)@11
    u0_m0_wo0_mtree_mult1_17_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr19_q_11_q & "000000";
    u0_m0_wo0_mtree_mult1_17_shift2_q <= u0_m0_wo0_mtree_mult1_17_shift2_qint(13 downto 0);

    -- u0_m0_wo0_mtree_mult1_17_shift0(BITSHIFT,229)@10
    u0_m0_wo0_mtree_mult1_17_shift0_qint <= u0_m0_wo0_wi0_r0_delayr19_q & "000";
    u0_m0_wo0_mtree_mult1_17_shift0_q <= u0_m0_wo0_mtree_mult1_17_shift0_qint(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_17_sub_1(SUB,230)@10 + 1
    u0_m0_wo0_mtree_mult1_17_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 8 => u0_m0_wo0_wi0_r0_delayr19_q(7)) & u0_m0_wo0_wi0_r0_delayr19_q));
    u0_m0_wo0_mtree_mult1_17_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_17_shift0_q(10)) & u0_m0_wo0_mtree_mult1_17_shift0_q));
    u0_m0_wo0_mtree_mult1_17_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_17_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_17_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_17_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_17_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_17_sub_1_q <= u0_m0_wo0_mtree_mult1_17_sub_1_o(11 downto 0);

    -- u0_m0_wo0_mtree_mult1_17_add_3(ADD,232)@11 + 1
    u0_m0_wo0_mtree_mult1_17_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => u0_m0_wo0_mtree_mult1_17_sub_1_q(11)) & u0_m0_wo0_mtree_mult1_17_sub_1_q));
    u0_m0_wo0_mtree_mult1_17_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_17_shift2_q(13)) & u0_m0_wo0_mtree_mult1_17_shift2_q));
    u0_m0_wo0_mtree_mult1_17_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_17_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_17_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_17_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_17_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_17_add_3_q <= u0_m0_wo0_mtree_mult1_17_add_3_o(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_17_shift4(BITSHIFT,233)@12
    u0_m0_wo0_mtree_mult1_17_shift4_qint <= u0_m0_wo0_mtree_mult1_17_add_3_q & "0";
    u0_m0_wo0_mtree_mult1_17_shift4_q <= u0_m0_wo0_mtree_mult1_17_shift4_qint(15 downto 0);

    -- u0_m0_wo0_mtree_mult1_16_shift0(BITSHIFT,234)@11
    u0_m0_wo0_mtree_mult1_16_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr20_q_11_q & "00";
    u0_m0_wo0_mtree_mult1_16_shift0_q <= u0_m0_wo0_mtree_mult1_16_shift0_qint(9 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr20(DELAY,39)@10
    u0_m0_wo0_wi0_r0_delayr20 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr19_q, xout => u0_m0_wo0_wi0_r0_delayr20_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr20_q_11(DELAY,296)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr20_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr20_q, xout => d_u0_m0_wo0_wi0_r0_delayr20_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_16_add_1(ADD,235)@11 + 1
    u0_m0_wo0_mtree_mult1_16_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => d_u0_m0_wo0_wi0_r0_delayr20_q_11_q(7)) & d_u0_m0_wo0_wi0_r0_delayr20_q_11_q));
    u0_m0_wo0_mtree_mult1_16_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_16_shift0_q(9)) & u0_m0_wo0_mtree_mult1_16_shift0_q));
    u0_m0_wo0_mtree_mult1_16_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_16_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_16_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_16_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_16_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_16_add_1_q <= u0_m0_wo0_mtree_mult1_16_add_1_o(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_16_shift2(BITSHIFT,236)@12
    u0_m0_wo0_mtree_mult1_16_shift2_qint <= u0_m0_wo0_mtree_mult1_16_add_1_q & "0000";
    u0_m0_wo0_mtree_mult1_16_shift2_q <= u0_m0_wo0_mtree_mult1_16_shift2_qint(14 downto 0);

    -- u0_m0_wo0_mtree_add0_8(ADD,141)@12 + 1
    u0_m0_wo0_mtree_add0_8_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => u0_m0_wo0_mtree_mult1_16_shift2_q(14)) & u0_m0_wo0_mtree_mult1_16_shift2_q));
    u0_m0_wo0_mtree_add0_8_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 16 => u0_m0_wo0_mtree_mult1_17_shift4_q(15)) & u0_m0_wo0_mtree_mult1_17_shift4_q));
    u0_m0_wo0_mtree_add0_8_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_8_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_8_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_8_a) + SIGNED(u0_m0_wo0_mtree_add0_8_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_8_q <= u0_m0_wo0_mtree_add0_8_o(16 downto 0);

    -- u0_m0_wo0_mtree_add1_4(ADD,155)@13 + 1
    u0_m0_wo0_mtree_add1_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_add0_8_q(16)) & u0_m0_wo0_mtree_add0_8_q));
    u0_m0_wo0_mtree_add1_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_add0_9_q(16)) & u0_m0_wo0_mtree_add0_9_q));
    u0_m0_wo0_mtree_add1_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_4_a) + SIGNED(u0_m0_wo0_mtree_add1_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_4_q <= u0_m0_wo0_mtree_add1_4_o(17 downto 0);

    -- u0_m0_wo0_mtree_add2_2(ADD,162)@14 + 1
    u0_m0_wo0_mtree_add2_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_add1_4_q(17)) & u0_m0_wo0_mtree_add1_4_q));
    u0_m0_wo0_mtree_add2_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_add1_5_q(17)) & u0_m0_wo0_mtree_add1_5_q));
    u0_m0_wo0_mtree_add2_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_2_a) + SIGNED(u0_m0_wo0_mtree_add2_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_2_q <= u0_m0_wo0_mtree_add2_2_o(18 downto 0);

    -- u0_m0_wo0_mtree_add3_1(ADD,166)@15 + 1
    u0_m0_wo0_mtree_add3_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 19 => u0_m0_wo0_mtree_add2_2_q(18)) & u0_m0_wo0_mtree_add2_2_q));
    u0_m0_wo0_mtree_add3_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((19 downto 17 => u0_m0_wo0_mtree_add2_3_q(16)) & u0_m0_wo0_mtree_add2_3_q));
    u0_m0_wo0_mtree_add3_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_1_a) + SIGNED(u0_m0_wo0_mtree_add3_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_1_q <= u0_m0_wo0_mtree_add3_1_o(19 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr21(DELAY,40)@10
    u0_m0_wo0_wi0_r0_delayr21 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr20_q, xout => u0_m0_wo0_wi0_r0_delayr21_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr21_q_11(DELAY,297)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr21_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr21_q, xout => d_u0_m0_wo0_wi0_r0_delayr21_q_11_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr21_q_12(DELAY,298)@11 + 1
    d_u0_m0_wo0_wi0_r0_delayr21_q_12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr21_q_11_q, xout => d_u0_m0_wo0_wi0_r0_delayr21_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_15_shift2(BITSHIFT,239)@12
    u0_m0_wo0_mtree_mult1_15_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr21_q_12_q & "0000";
    u0_m0_wo0_mtree_mult1_15_shift2_q <= u0_m0_wo0_mtree_mult1_15_shift2_qint(11 downto 0);

    -- u0_m0_wo0_mtree_mult1_15_shift0(BITSHIFT,237)@11
    u0_m0_wo0_mtree_mult1_15_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr21_q_11_q & "0";
    u0_m0_wo0_mtree_mult1_15_shift0_q <= u0_m0_wo0_mtree_mult1_15_shift0_qint(8 downto 0);

    -- u0_m0_wo0_mtree_mult1_15_add_1(ADD,238)@11 + 1
    u0_m0_wo0_mtree_mult1_15_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 8 => d_u0_m0_wo0_wi0_r0_delayr21_q_11_q(7)) & d_u0_m0_wo0_wi0_r0_delayr21_q_11_q));
    u0_m0_wo0_mtree_mult1_15_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_15_shift0_q(8)) & u0_m0_wo0_mtree_mult1_15_shift0_q));
    u0_m0_wo0_mtree_mult1_15_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_15_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_15_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_15_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_15_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_15_add_1_q <= u0_m0_wo0_mtree_mult1_15_add_1_o(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_15_add_3(ADD,240)@12 + 1
    u0_m0_wo0_mtree_mult1_15_add_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 10 => u0_m0_wo0_mtree_mult1_15_add_1_q(9)) & u0_m0_wo0_mtree_mult1_15_add_1_q));
    u0_m0_wo0_mtree_mult1_15_add_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_mtree_mult1_15_shift2_q(11)) & u0_m0_wo0_mtree_mult1_15_shift2_q));
    u0_m0_wo0_mtree_mult1_15_add_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_15_add_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_15_add_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_15_add_3_a) + SIGNED(u0_m0_wo0_mtree_mult1_15_add_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_15_add_3_q <= u0_m0_wo0_mtree_mult1_15_add_3_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_15_shift4(BITSHIFT,241)@13
    u0_m0_wo0_mtree_mult1_15_shift4_qint <= u0_m0_wo0_mtree_mult1_15_add_3_q & "0";
    u0_m0_wo0_mtree_mult1_15_shift4_q <= u0_m0_wo0_mtree_mult1_15_shift4_qint(13 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr22(DELAY,41)@10
    u0_m0_wo0_wi0_r0_delayr22 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr21_q, xout => u0_m0_wo0_wi0_r0_delayr22_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr23(DELAY,42)@10
    u0_m0_wo0_wi0_r0_delayr23 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr22_q, xout => u0_m0_wo0_wi0_r0_delayr23_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr23_q_11(DELAY,299)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr23_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr23_q, xout => d_u0_m0_wo0_wi0_r0_delayr23_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_13_shift2(BITSHIFT,244)@11
    u0_m0_wo0_mtree_mult1_13_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr23_q_11_q & "0000";
    u0_m0_wo0_mtree_mult1_13_shift2_q <= u0_m0_wo0_mtree_mult1_13_shift2_qint(11 downto 0);

    -- u0_m0_wo0_mtree_mult1_13_shift0(BITSHIFT,242)@10
    u0_m0_wo0_mtree_mult1_13_shift0_qint <= u0_m0_wo0_wi0_r0_delayr23_q & "00";
    u0_m0_wo0_mtree_mult1_13_shift0_q <= u0_m0_wo0_mtree_mult1_13_shift0_qint(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_13_add_1(ADD,243)@10 + 1
    u0_m0_wo0_mtree_mult1_13_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => u0_m0_wo0_wi0_r0_delayr23_q(7)) & u0_m0_wo0_wi0_r0_delayr23_q));
    u0_m0_wo0_mtree_mult1_13_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_13_shift0_q(9)) & u0_m0_wo0_mtree_mult1_13_shift0_q));
    u0_m0_wo0_mtree_mult1_13_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_13_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_13_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_13_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_13_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_13_add_1_q <= u0_m0_wo0_mtree_mult1_13_add_1_o(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_13_sub_3(SUB,245)@11 + 1
    u0_m0_wo0_mtree_mult1_13_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => u0_m0_wo0_mtree_mult1_13_add_1_q(10)) & u0_m0_wo0_mtree_mult1_13_add_1_q));
    u0_m0_wo0_mtree_mult1_13_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_mtree_mult1_13_shift2_q(11)) & u0_m0_wo0_mtree_mult1_13_shift2_q));
    u0_m0_wo0_mtree_mult1_13_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_13_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_13_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_13_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_13_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_13_sub_3_q <= u0_m0_wo0_mtree_mult1_13_sub_3_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_13_shift4(BITSHIFT,246)@12
    u0_m0_wo0_mtree_mult1_13_shift4_qint <= u0_m0_wo0_mtree_mult1_13_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_13_shift4_q <= u0_m0_wo0_mtree_mult1_13_shift4_qint(13 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr24(DELAY,43)@10
    u0_m0_wo0_wi0_r0_delayr24 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr23_q, xout => u0_m0_wo0_wi0_r0_delayr24_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr24_q_11(DELAY,300)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr24_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr24_q, xout => d_u0_m0_wo0_wi0_r0_delayr24_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_12_shift2(BITSHIFT,249)@11
    u0_m0_wo0_mtree_mult1_12_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr24_q_11_q & "0000";
    u0_m0_wo0_mtree_mult1_12_shift2_q <= u0_m0_wo0_mtree_mult1_12_shift2_qint(11 downto 0);

    -- u0_m0_wo0_mtree_mult1_12_shift0(BITSHIFT,247)@10
    u0_m0_wo0_mtree_mult1_12_shift0_qint <= u0_m0_wo0_wi0_r0_delayr24_q & "00";
    u0_m0_wo0_mtree_mult1_12_shift0_q <= u0_m0_wo0_mtree_mult1_12_shift0_qint(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_12_sub_1(SUB,248)@10 + 1
    u0_m0_wo0_mtree_mult1_12_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_12_shift0_q(9)) & u0_m0_wo0_mtree_mult1_12_shift0_q));
    u0_m0_wo0_mtree_mult1_12_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => u0_m0_wo0_wi0_r0_delayr24_q(7)) & u0_m0_wo0_wi0_r0_delayr24_q));
    u0_m0_wo0_mtree_mult1_12_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_12_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_12_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_12_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_12_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_12_sub_1_q <= u0_m0_wo0_mtree_mult1_12_sub_1_o(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_12_sub_3(SUB,250)@11 + 1
    u0_m0_wo0_mtree_mult1_12_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => u0_m0_wo0_mtree_mult1_12_sub_1_q(10)) & u0_m0_wo0_mtree_mult1_12_sub_1_q));
    u0_m0_wo0_mtree_mult1_12_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_mtree_mult1_12_shift2_q(11)) & u0_m0_wo0_mtree_mult1_12_shift2_q));
    u0_m0_wo0_mtree_mult1_12_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_12_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_12_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_12_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_12_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_12_sub_3_q <= u0_m0_wo0_mtree_mult1_12_sub_3_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_12_shift4(BITSHIFT,251)@12
    u0_m0_wo0_mtree_mult1_12_shift4_qint <= u0_m0_wo0_mtree_mult1_12_sub_3_q & "0";
    u0_m0_wo0_mtree_mult1_12_shift4_q <= u0_m0_wo0_mtree_mult1_12_shift4_qint(13 downto 0);

    -- u0_m0_wo0_mtree_add0_6(ADD,139)@12 + 1
    u0_m0_wo0_mtree_add0_6_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_12_shift4_q(13)) & u0_m0_wo0_mtree_mult1_12_shift4_q));
    u0_m0_wo0_mtree_add0_6_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_mult1_13_shift4_q(13)) & u0_m0_wo0_mtree_mult1_13_shift4_q));
    u0_m0_wo0_mtree_add0_6_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_6_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_6_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_6_a) + SIGNED(u0_m0_wo0_mtree_add0_6_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_6_q <= u0_m0_wo0_mtree_add0_6_o(14 downto 0);

    -- u0_m0_wo0_mtree_add1_3(ADD,154)@13 + 1
    u0_m0_wo0_mtree_add1_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 15 => u0_m0_wo0_mtree_add0_6_q(14)) & u0_m0_wo0_mtree_add0_6_q));
    u0_m0_wo0_mtree_add1_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((16 downto 14 => u0_m0_wo0_mtree_mult1_15_shift4_q(13)) & u0_m0_wo0_mtree_mult1_15_shift4_q));
    u0_m0_wo0_mtree_add1_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_3_a) + SIGNED(u0_m0_wo0_mtree_add1_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_3_q <= u0_m0_wo0_mtree_add1_3_o(16 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr25(DELAY,44)@10
    u0_m0_wo0_wi0_r0_delayr25 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr24_q, xout => u0_m0_wo0_wi0_r0_delayr25_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr25_q_12(DELAY,301)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr25_q_12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr25_q, xout => d_u0_m0_wo0_wi0_r0_delayr25_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_11_shift0(BITSHIFT,252)@12
    u0_m0_wo0_mtree_mult1_11_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr25_q_12_q & "0000";
    u0_m0_wo0_mtree_mult1_11_shift0_q <= u0_m0_wo0_mtree_mult1_11_shift0_qint(11 downto 0);

    -- u0_m0_wo0_mtree_mult1_11_sub_1(SUB,253)@12 + 1
    u0_m0_wo0_mtree_mult1_11_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 1 => GND_q(0)) & GND_q));
    u0_m0_wo0_mtree_mult1_11_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_mtree_mult1_11_shift0_q(11)) & u0_m0_wo0_mtree_mult1_11_shift0_q));
    u0_m0_wo0_mtree_mult1_11_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_11_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_11_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_11_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_11_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_11_sub_1_q <= u0_m0_wo0_mtree_mult1_11_sub_1_o(12 downto 0);

    -- u0_m0_wo0_mtree_mult1_9_shift0(BITSHIFT,254)@11
    u0_m0_wo0_mtree_mult1_9_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr27_q_11_q & "0";
    u0_m0_wo0_mtree_mult1_9_shift0_q <= u0_m0_wo0_mtree_mult1_9_shift0_qint(8 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr26(DELAY,45)@10
    u0_m0_wo0_wi0_r0_delayr26 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr25_q, xout => u0_m0_wo0_wi0_r0_delayr26_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr27(DELAY,46)@10
    u0_m0_wo0_wi0_r0_delayr27 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr26_q, xout => u0_m0_wo0_wi0_r0_delayr27_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr27_q_11(DELAY,302)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr27_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr27_q, xout => d_u0_m0_wo0_wi0_r0_delayr27_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_9_add_1(ADD,255)@11 + 1
    u0_m0_wo0_mtree_mult1_9_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 8 => d_u0_m0_wo0_wi0_r0_delayr27_q_11_q(7)) & d_u0_m0_wo0_wi0_r0_delayr27_q_11_q));
    u0_m0_wo0_mtree_mult1_9_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_9_shift0_q(8)) & u0_m0_wo0_mtree_mult1_9_shift0_q));
    u0_m0_wo0_mtree_mult1_9_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_9_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_9_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_9_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_9_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_9_add_1_q <= u0_m0_wo0_mtree_mult1_9_add_1_o(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_9_shift2(BITSHIFT,256)@12
    u0_m0_wo0_mtree_mult1_9_shift2_qint <= u0_m0_wo0_mtree_mult1_9_add_1_q & "00";
    u0_m0_wo0_mtree_mult1_9_shift2_q <= u0_m0_wo0_mtree_mult1_9_shift2_qint(11 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr28(DELAY,47)@10
    u0_m0_wo0_wi0_r0_delayr28 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr27_q, xout => u0_m0_wo0_wi0_r0_delayr28_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr28_q_12(DELAY,303)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr28_q_12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr28_q, xout => d_u0_m0_wo0_wi0_r0_delayr28_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_8_shift0(BITSHIFT,257)@12
    u0_m0_wo0_mtree_mult1_8_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr28_q_12_q & "0000";
    u0_m0_wo0_mtree_mult1_8_shift0_q <= u0_m0_wo0_mtree_mult1_8_shift0_qint(11 downto 0);

    -- u0_m0_wo0_mtree_add0_4(ADD,137)@12 + 1
    u0_m0_wo0_mtree_add0_4_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_mtree_mult1_8_shift0_q(11)) & u0_m0_wo0_mtree_mult1_8_shift0_q));
    u0_m0_wo0_mtree_add0_4_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_mtree_mult1_9_shift2_q(11)) & u0_m0_wo0_mtree_mult1_9_shift2_q));
    u0_m0_wo0_mtree_add0_4_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_4_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_4_a) + SIGNED(u0_m0_wo0_mtree_add0_4_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_4_q <= u0_m0_wo0_mtree_add0_4_o(12 downto 0);

    -- u0_m0_wo0_mtree_add1_2(ADD,153)@13 + 1
    u0_m0_wo0_mtree_add1_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => u0_m0_wo0_mtree_add0_4_q(12)) & u0_m0_wo0_mtree_add0_4_q));
    u0_m0_wo0_mtree_add1_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 13 => u0_m0_wo0_mtree_mult1_11_sub_1_q(12)) & u0_m0_wo0_mtree_mult1_11_sub_1_q));
    u0_m0_wo0_mtree_add1_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_2_a) + SIGNED(u0_m0_wo0_mtree_add1_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_2_q <= u0_m0_wo0_mtree_add1_2_o(15 downto 0);

    -- u0_m0_wo0_mtree_add2_1(ADD,161)@14 + 1
    u0_m0_wo0_mtree_add2_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 16 => u0_m0_wo0_mtree_add1_2_q(15)) & u0_m0_wo0_mtree_add1_2_q));
    u0_m0_wo0_mtree_add2_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((17 downto 17 => u0_m0_wo0_mtree_add1_3_q(16)) & u0_m0_wo0_mtree_add1_3_q));
    u0_m0_wo0_mtree_add2_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_1_a) + SIGNED(u0_m0_wo0_mtree_add2_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_1_q <= u0_m0_wo0_mtree_add2_1_o(17 downto 0);

    -- u0_m0_wo0_mtree_mult1_7_shift0(BITSHIFT,258)@12
    u0_m0_wo0_mtree_mult1_7_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr29_q_12_q & "00";
    u0_m0_wo0_mtree_mult1_7_shift0_q <= u0_m0_wo0_mtree_mult1_7_shift0_qint(9 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr29(DELAY,48)@10
    u0_m0_wo0_wi0_r0_delayr29 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr28_q, xout => u0_m0_wo0_wi0_r0_delayr29_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr29_q_12(DELAY,304)@10 + 2
    d_u0_m0_wo0_wi0_r0_delayr29_q_12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 2, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr29_q, xout => d_u0_m0_wo0_wi0_r0_delayr29_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_7_add_1(ADD,259)@12 + 1
    u0_m0_wo0_mtree_mult1_7_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => d_u0_m0_wo0_wi0_r0_delayr29_q_12_q(7)) & d_u0_m0_wo0_wi0_r0_delayr29_q_12_q));
    u0_m0_wo0_mtree_mult1_7_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_7_shift0_q(9)) & u0_m0_wo0_mtree_mult1_7_shift0_q));
    u0_m0_wo0_mtree_mult1_7_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_7_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_7_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_7_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_7_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_7_add_1_q <= u0_m0_wo0_mtree_mult1_7_add_1_o(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_7_shift2(BITSHIFT,260)@13
    u0_m0_wo0_mtree_mult1_7_shift2_qint <= u0_m0_wo0_mtree_mult1_7_add_1_q & "0";
    u0_m0_wo0_mtree_mult1_7_shift2_q <= u0_m0_wo0_mtree_mult1_7_shift2_qint(11 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr30(DELAY,49)@10
    u0_m0_wo0_wi0_r0_delayr30 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr29_q, xout => u0_m0_wo0_wi0_r0_delayr30_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr31(DELAY,50)@10
    u0_m0_wo0_wi0_r0_delayr31 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr30_q, xout => u0_m0_wo0_wi0_r0_delayr31_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr31_q_11(DELAY,305)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr31_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr31_q, xout => d_u0_m0_wo0_wi0_r0_delayr31_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_5_shift0(BITSHIFT,261)@11
    u0_m0_wo0_mtree_mult1_5_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr31_q_11_q & "000";
    u0_m0_wo0_mtree_mult1_5_shift0_q <= u0_m0_wo0_mtree_mult1_5_shift0_qint(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_5_sub_1(SUB,262)@11 + 1
    u0_m0_wo0_mtree_mult1_5_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 1 => GND_q(0)) & GND_q));
    u0_m0_wo0_mtree_mult1_5_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_5_shift0_q(10)) & u0_m0_wo0_mtree_mult1_5_shift0_q));
    u0_m0_wo0_mtree_mult1_5_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_5_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_5_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_5_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_5_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_5_sub_1_q <= u0_m0_wo0_mtree_mult1_5_sub_1_o(11 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr32(DELAY,51)@10
    u0_m0_wo0_wi0_r0_delayr32 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr31_q, xout => u0_m0_wo0_wi0_r0_delayr32_q, ena => xIn_v(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr32_q_11(DELAY,306)@10 + 1
    d_u0_m0_wo0_wi0_r0_delayr32_q_11 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr32_q, xout => d_u0_m0_wo0_wi0_r0_delayr32_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_4_shift2(BITSHIFT,265)@11
    u0_m0_wo0_mtree_mult1_4_shift2_qint <= d_u0_m0_wo0_wi0_r0_delayr32_q_11_q & "0000";
    u0_m0_wo0_mtree_mult1_4_shift2_q <= u0_m0_wo0_mtree_mult1_4_shift2_qint(11 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_shift0(BITSHIFT,263)@10
    u0_m0_wo0_mtree_mult1_4_shift0_qint <= u0_m0_wo0_wi0_r0_delayr32_q & "00";
    u0_m0_wo0_mtree_mult1_4_shift0_q <= u0_m0_wo0_mtree_mult1_4_shift0_qint(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_add_1(ADD,264)@10 + 1
    u0_m0_wo0_mtree_mult1_4_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 8 => u0_m0_wo0_wi0_r0_delayr32_q(7)) & u0_m0_wo0_wi0_r0_delayr32_q));
    u0_m0_wo0_mtree_mult1_4_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((10 downto 10 => u0_m0_wo0_mtree_mult1_4_shift0_q(9)) & u0_m0_wo0_mtree_mult1_4_shift0_q));
    u0_m0_wo0_mtree_mult1_4_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_4_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_add_1_q <= u0_m0_wo0_mtree_mult1_4_add_1_o(10 downto 0);

    -- u0_m0_wo0_mtree_mult1_4_sub_3(SUB,266)@11 + 1
    u0_m0_wo0_mtree_mult1_4_sub_3_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 11 => u0_m0_wo0_mtree_mult1_4_add_1_q(10)) & u0_m0_wo0_mtree_mult1_4_add_1_q));
    u0_m0_wo0_mtree_mult1_4_sub_3_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((12 downto 12 => u0_m0_wo0_mtree_mult1_4_shift2_q(11)) & u0_m0_wo0_mtree_mult1_4_shift2_q));
    u0_m0_wo0_mtree_mult1_4_sub_3_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_4_sub_3_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_4_sub_3_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_4_sub_3_a) - SIGNED(u0_m0_wo0_mtree_mult1_4_sub_3_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_4_sub_3_q <= u0_m0_wo0_mtree_mult1_4_sub_3_o(12 downto 0);

    -- u0_m0_wo0_mtree_add0_2(ADD,135)@12 + 1
    u0_m0_wo0_mtree_add0_2_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 13 => u0_m0_wo0_mtree_mult1_4_sub_3_q(12)) & u0_m0_wo0_mtree_mult1_4_sub_3_q));
    u0_m0_wo0_mtree_add0_2_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((13 downto 12 => u0_m0_wo0_mtree_mult1_5_sub_1_q(11)) & u0_m0_wo0_mtree_mult1_5_sub_1_q));
    u0_m0_wo0_mtree_add0_2_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_2_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_2_a) + SIGNED(u0_m0_wo0_mtree_add0_2_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_2_q <= u0_m0_wo0_mtree_add0_2_o(13 downto 0);

    -- u0_m0_wo0_mtree_add1_1(ADD,152)@13 + 1
    u0_m0_wo0_mtree_add1_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 14 => u0_m0_wo0_mtree_add0_2_q(13)) & u0_m0_wo0_mtree_add0_2_q));
    u0_m0_wo0_mtree_add1_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => u0_m0_wo0_mtree_mult1_7_shift2_q(11)) & u0_m0_wo0_mtree_mult1_7_shift2_q));
    u0_m0_wo0_mtree_add1_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_1_a) + SIGNED(u0_m0_wo0_mtree_add1_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_1_q <= u0_m0_wo0_mtree_add1_1_o(14 downto 0);

    -- u0_m0_wo0_mtree_mult1_3_shift0(BITSHIFT,267)@12
    u0_m0_wo0_mtree_mult1_3_shift0_qint <= d_u0_m0_wo0_wi0_r0_delayr33_q_12_q & "000";
    u0_m0_wo0_mtree_mult1_3_shift0_q <= u0_m0_wo0_mtree_mult1_3_shift0_qint(10 downto 0);

    -- d_u0_m0_wo0_memread_q_11(DELAY,273)@10 + 1
    d_u0_m0_wo0_memread_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_memread_q_11_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_11(DELAY,275)@10 + 1
    d_u0_m0_wo0_compute_q_11 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => xIn_v, xout => d_u0_m0_wo0_compute_q_11_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr33(DELAY,52)@11
    u0_m0_wo0_wi0_r0_delayr33 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr32_q_11_q, xout => u0_m0_wo0_wi0_r0_delayr33_q, ena => d_u0_m0_wo0_compute_q_11_q(0), clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr33_q_12(DELAY,307)@11 + 1
    d_u0_m0_wo0_wi0_r0_delayr33_q_12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr33_q, xout => d_u0_m0_wo0_wi0_r0_delayr33_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_3_sub_1(SUB,268)@12 + 1
    u0_m0_wo0_mtree_mult1_3_sub_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 8 => d_u0_m0_wo0_wi0_r0_delayr33_q_12_q(7)) & d_u0_m0_wo0_wi0_r0_delayr33_q_12_q));
    u0_m0_wo0_mtree_mult1_3_sub_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_3_shift0_q(10)) & u0_m0_wo0_mtree_mult1_3_shift0_q));
    u0_m0_wo0_mtree_mult1_3_sub_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_3_sub_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_3_sub_1_a) - SIGNED(u0_m0_wo0_mtree_mult1_3_sub_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_3_sub_1_q <= u0_m0_wo0_mtree_mult1_3_sub_1_o(11 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_shift0(BITSHIFT,269)@11
    u0_m0_wo0_mtree_mult1_1_shift0_qint <= u0_m0_wo0_wi0_r0_delayr35_q & "0";
    u0_m0_wo0_mtree_mult1_1_shift0_q <= u0_m0_wo0_mtree_mult1_1_shift0_qint(8 downto 0);

    -- u0_m0_wo0_wi0_r0_delayr34(DELAY,53)@11
    u0_m0_wo0_wi0_r0_delayr34 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr33_q, xout => u0_m0_wo0_wi0_r0_delayr34_q, ena => d_u0_m0_wo0_compute_q_11_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr35(DELAY,54)@11
    u0_m0_wo0_wi0_r0_delayr35 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr34_q, xout => u0_m0_wo0_wi0_r0_delayr35_q, ena => d_u0_m0_wo0_compute_q_11_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_1_add_1(ADD,270)@11 + 1
    u0_m0_wo0_mtree_mult1_1_add_1_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 8 => u0_m0_wo0_wi0_r0_delayr35_q(7)) & u0_m0_wo0_wi0_r0_delayr35_q));
    u0_m0_wo0_mtree_mult1_1_add_1_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((9 downto 9 => u0_m0_wo0_mtree_mult1_1_shift0_q(8)) & u0_m0_wo0_mtree_mult1_1_shift0_q));
    u0_m0_wo0_mtree_mult1_1_add_1_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_mult1_1_add_1_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_mult1_1_add_1_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_mult1_1_add_1_a) + SIGNED(u0_m0_wo0_mtree_mult1_1_add_1_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_mult1_1_add_1_q <= u0_m0_wo0_mtree_mult1_1_add_1_o(9 downto 0);

    -- u0_m0_wo0_mtree_mult1_1_shift2(BITSHIFT,271)@12
    u0_m0_wo0_mtree_mult1_1_shift2_qint <= u0_m0_wo0_mtree_mult1_1_add_1_q & "0";
    u0_m0_wo0_mtree_mult1_1_shift2_q <= u0_m0_wo0_mtree_mult1_1_shift2_qint(10 downto 0);

    -- d_u0_m0_wo0_memread_q_12(DELAY,274)@11 + 1
    d_u0_m0_wo0_memread_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_memread_q_11_q, xout => d_u0_m0_wo0_memread_q_12_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_compute_q_12(DELAY,276)@11 + 1
    d_u0_m0_wo0_compute_q_12 : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_11_q, xout => d_u0_m0_wo0_compute_q_12_q, clk => clk, aclr => areset );

    -- d_u0_m0_wo0_wi0_r0_delayr35_q_12(DELAY,308)@11 + 1
    d_u0_m0_wo0_wi0_r0_delayr35_q_12 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => u0_m0_wo0_wi0_r0_delayr35_q, xout => d_u0_m0_wo0_wi0_r0_delayr35_q_12_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_wi0_r0_delayr36(DELAY,55)@12
    u0_m0_wo0_wi0_r0_delayr36 : dspba_delay
    GENERIC MAP ( width => 8, depth => 1, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_wi0_r0_delayr35_q_12_q, xout => u0_m0_wo0_wi0_r0_delayr36_q, ena => d_u0_m0_wo0_compute_q_12_q(0), clk => clk, aclr => areset );

    -- u0_m0_wo0_mtree_mult1_0_shift0(BITSHIFT,272)@12
    u0_m0_wo0_mtree_mult1_0_shift0_qint <= u0_m0_wo0_wi0_r0_delayr36_q & "000";
    u0_m0_wo0_mtree_mult1_0_shift0_q <= u0_m0_wo0_mtree_mult1_0_shift0_qint(10 downto 0);

    -- u0_m0_wo0_mtree_add0_0(ADD,133)@12 + 1
    u0_m0_wo0_mtree_add0_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_0_shift0_q(10)) & u0_m0_wo0_mtree_mult1_0_shift0_q));
    u0_m0_wo0_mtree_add0_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((11 downto 11 => u0_m0_wo0_mtree_mult1_1_shift2_q(10)) & u0_m0_wo0_mtree_mult1_1_shift2_q));
    u0_m0_wo0_mtree_add0_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add0_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add0_0_a) + SIGNED(u0_m0_wo0_mtree_add0_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add0_0_q <= u0_m0_wo0_mtree_add0_0_o(11 downto 0);

    -- u0_m0_wo0_mtree_add1_0(ADD,151)@13 + 1
    u0_m0_wo0_mtree_add1_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => u0_m0_wo0_mtree_add0_0_q(11)) & u0_m0_wo0_mtree_add0_0_q));
    u0_m0_wo0_mtree_add1_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((14 downto 12 => u0_m0_wo0_mtree_mult1_3_sub_1_q(11)) & u0_m0_wo0_mtree_mult1_3_sub_1_q));
    u0_m0_wo0_mtree_add1_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add1_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add1_0_a) + SIGNED(u0_m0_wo0_mtree_add1_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add1_0_q <= u0_m0_wo0_mtree_add1_0_o(14 downto 0);

    -- u0_m0_wo0_mtree_add2_0(ADD,160)@14 + 1
    u0_m0_wo0_mtree_add2_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_add1_0_q(14)) & u0_m0_wo0_mtree_add1_0_q));
    u0_m0_wo0_mtree_add2_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((15 downto 15 => u0_m0_wo0_mtree_add1_1_q(14)) & u0_m0_wo0_mtree_add1_1_q));
    u0_m0_wo0_mtree_add2_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add2_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add2_0_a) + SIGNED(u0_m0_wo0_mtree_add2_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add2_0_q <= u0_m0_wo0_mtree_add2_0_o(15 downto 0);

    -- u0_m0_wo0_mtree_add3_0(ADD,165)@15 + 1
    u0_m0_wo0_mtree_add3_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 16 => u0_m0_wo0_mtree_add2_0_q(15)) & u0_m0_wo0_mtree_add2_0_q));
    u0_m0_wo0_mtree_add3_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((18 downto 18 => u0_m0_wo0_mtree_add2_1_q(17)) & u0_m0_wo0_mtree_add2_1_q));
    u0_m0_wo0_mtree_add3_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add3_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add3_0_a) + SIGNED(u0_m0_wo0_mtree_add3_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add3_0_q <= u0_m0_wo0_mtree_add3_0_o(18 downto 0);

    -- u0_m0_wo0_mtree_add4_0(ADD,167)@16 + 1
    u0_m0_wo0_mtree_add4_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 19 => u0_m0_wo0_mtree_add3_0_q(18)) & u0_m0_wo0_mtree_add3_0_q));
    u0_m0_wo0_mtree_add4_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((20 downto 20 => u0_m0_wo0_mtree_add3_1_q(19)) & u0_m0_wo0_mtree_add3_1_q));
    u0_m0_wo0_mtree_add4_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add4_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add4_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add4_0_a) + SIGNED(u0_m0_wo0_mtree_add4_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add4_0_q <= u0_m0_wo0_mtree_add4_0_o(20 downto 0);

    -- u0_m0_wo0_mtree_add5_0(ADD,168)@17 + 1
    u0_m0_wo0_mtree_add5_0_a <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 21 => u0_m0_wo0_mtree_add4_0_q(20)) & u0_m0_wo0_mtree_add4_0_q));
    u0_m0_wo0_mtree_add5_0_b <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR((21 downto 16 => u0_m0_wo0_mtree_add2_4_q(15)) & u0_m0_wo0_mtree_add2_4_q));
    u0_m0_wo0_mtree_add5_0_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_mtree_add5_0_o <= (others => '0');
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_mtree_add5_0_o <= STD_LOGIC_VECTOR(SIGNED(u0_m0_wo0_mtree_add5_0_a) + SIGNED(u0_m0_wo0_mtree_add5_0_b));
        END IF;
    END PROCESS;
    u0_m0_wo0_mtree_add5_0_q <= u0_m0_wo0_mtree_add5_0_o(21 downto 0);

    -- GND(CONSTANT,0)@0
    GND_q <= "0";

    -- d_u0_m0_wo0_compute_q_17(DELAY,277)@12 + 5
    d_u0_m0_wo0_compute_q_17 : dspba_delay
    GENERIC MAP ( width => 1, depth => 5, reset_kind => "ASYNC" )
    PORT MAP ( xin => d_u0_m0_wo0_compute_q_12_q, xout => d_u0_m0_wo0_compute_q_17_q, clk => clk, aclr => areset );

    -- u0_m0_wo0_oseq_gated_reg(REG,169)@17 + 1
    u0_m0_wo0_oseq_gated_reg_clkproc: PROCESS (clk, areset)
    BEGIN
        IF (areset = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= "0";
        ELSIF (clk'EVENT AND clk = '1') THEN
            u0_m0_wo0_oseq_gated_reg_q <= STD_LOGIC_VECTOR(d_u0_m0_wo0_compute_q_17_q);
        END IF;
    END PROCESS;

    -- xOut(PORTOUT,174)@18 + 1
    xOut_v <= u0_m0_wo0_oseq_gated_reg_q;
    xOut_c <= STD_LOGIC_VECTOR("0000000" & GND_q);
    xOut_0 <= u0_m0_wo0_mtree_add5_0_q;

END normal;
