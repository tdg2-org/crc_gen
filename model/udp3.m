%% Notes:
% PC IP addr:     192.168.1.11
% PC netmask:     255.255.255.0
% PC mac hwaddr:  d0:37:45:fb:d5:0e
% -- 
% ZYNQ IP addr:   192.168.1.55
% ZYNQ netmask:   255.255.255.0
% ZYNQ mac:       00:0a:35:02:83:3e

%%
udpr = dsp.UDPReceiver('LocalIPPort',49188,'RemoteIPAddress','0.0.0.0')

dataR = udpr()
