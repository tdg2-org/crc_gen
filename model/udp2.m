%% Notes:
% PC IP addr:     192.168.1.11
% PC netmask:     255.255.255.0
% PC mac hwaddr:  d0:37:45:fb:d5:0e
% -- 
% ZYNQ IP addr:   192.168.1.55
% ZYNQ netmask:   255.255.255.0
% ZYNQ mac:       00:0a:35:02:83:3e


%%
u = udp('','LocalHost','','LocalPort',49188);

%u = udp('RemotePort',49166,'RemoteHost','192.168.1.55')

u.EnablePortSharing = 'on';

fopen(u);

fscanf(u)
packetData = fread(u);

fclose(u);
delete(u);
clear u