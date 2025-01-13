clear;clc
% target port as set in the app
 port        = 49166;
 payloadData = cell(100,1);
 udpObject.EnablePortSharing='off';
 for k=1:100
   % get the message/payload only assuming a max size of 200 bytes
   [msg,~] = judp('RECEIVE',port,200,5000);
   % save the payload to the array
   payloadData{k} = msg;
   % convert the message to ASCII and print it out
   fprintf('%s\n',char(msg)');
 end