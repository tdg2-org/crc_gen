%% Notes:
% PC IP addr:     192.168.1.11
% PC netmask:     255.255.255.0
% PC mac hwaddr:  d0:37:45:fb:d5:0e
% -- 
% ZYNQ IP addr:   192.168.1.55
% ZYNQ netmask:   255.255.255.0
% ZYNQ mac:       00:0a:35:02:83:3e

%%
x = udp('192.168.1.55',49166,'LocalPort',49188);
x.EnablePortSharing = 'on';
x.inputbuffersize = 60;
x
fopen(x);
data = fread(x)
fclose(x);