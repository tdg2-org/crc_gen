
clear;
clc
%% Notes:
% PC IP addr:         10.1.1.4
% PC netmask:         255.255.0.0
% PC mac hwaddr:      d0:37:45:fb:d5:0e
% PC port:            49188
% PC default gateway: 0.0.0.0
% -- 
% ZYNQ IP addr:         10.1.1.55
% ZYNQ netmask:         255.255.0.0
% ZYNQ mac:             00:0a:35:02:83:3e
% ZYNQ port:            49166
% ZYNQ default gateway: 0.0.0.0

%% Some commands:
%   instrhelp udp
%   tmtool
%   inspect(x)
%   propinfo(x)

x = udp('');
x.EnablePortSharing = 'on';
x.LocalPort = 49188;
x.LocalHost = '10.1.1.4'; % This will fail if not connected to the network in linux (network settings, 'wired connection 2')
x.RemotePort = 49166;
x.RemoteHost = '10.1.1.55';
%x.DatagramAddress = '192.168.1.55';
%x.DatagramPort = 49166;
%x.ByteOrder = 'littleEndian';

if 1
fopen(x);
for i=1:10000
  data = fread(x)
  fwrite(x,1:4)
  %pause(1); % 1 second delay
end
fclose(x);
end

if 0
x.LocalPort
x.LocalHost
x.RemotePort
x.RemoteHost
x.DatagramAddress
x.DatagramPort
x.ReadAsyncMode
end



%fopen(x);


% fclose(x);
% delete(x);
% clear x