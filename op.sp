.param vdd=1.8V
.param vss=0V
.param vocm=0.9V

.PARAM supplyp=1.8V
.PARAM supplyn=0V
.PARAM comon=0.9V

.SUBCKT my_op Vinp Vinn VDD VSS Vop Von VCM

*First stage
MM1 net_second_l_in Vinn net32 VSS N_18 W=22.58u L=1u m=5
MM2 net_second_r_in Vinp net32 VSS N_18 W=22.58u L=1u m=5
MM3 net_second_l_in net_cm VDD VDD P_18 W=11.9u L=1u m=5
MM4 net_second_r_in net_cm VDD VDD P_18 W=11.9u L=1u m=5
MM5 net32 net_ref VSS VSS N_18 W=51.58u L=1u m=10

*Error amplifier
RRsenn Von net11 50K
RRsenp Vop net11 50K
MM21 net9 VCM net12 VSS N_18 W=33.87u L=1u m=1
MM22 net_cm net11 net12 VSS N_18 W=33.87u L=1u m=1
MM23 net9 net9 VDD VDD P_18 W=17.8u L=1u m=1
MM24 net_cm net_cm VDD VDD P_18 W=17.8u L=1u m=1
MM25 net12 net_ref VSS VSS N_18 W=77.37u L=1u m=2

*Second stage
MM6 Von net_second_l_in VDD VDD P_18 W=32.3u L=0.3u m=10
MM7 Vop net_second_r_in VDD VDD P_18 W=32.3u L=0.3u m=10
MM8 Von net_ref VSS VSS N_18 W=53.88u L=1u m=10
MM9 Vop net_ref VSS VSS N_18 W=53.88u L=1u m=10
CC1 net2 Von 4.95p
CC2 net53 Vop 4.95p
MM10 net2 net_comp net_second_l_in VDD P_18 W=22u L=0.4u m=1
MM11 net53 net_comp net_second_r_in VDD P_18 W=22u L=0.4u m=1

*Constant gm
MM12 net1x net2x VDD VDD P_18 W=2u L=1u m=1
MM13 net2x net2x VDD VDD P_18 W=2u L=1u m=1
MM14 net_ref net3x net1x VDD P_18 W=2u L=1u m=1
MM15 net_comp net_comp net2x VDD P_18 W=2u L=1u m=1
MM16 net3x net_ref VSS VSS N_18 W=5.158u L=1u m=1
MM17 net_comp net3x VSS VSS N_18 W=5.158u L=1u m=4
RRB net_ref net3x 10k

*Start up
MM18 net_s net_ref VDD VDD P_18 W=1u L=1u m=1
MM19 net_s net_ref VSS VSS N_18 W=30u L=1u m=1
MM20 net2x net_s VSS VSS N_18 W=1u L=5u m=1

.ENDS

