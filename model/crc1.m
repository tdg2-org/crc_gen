 clear;clc
% crc
% help comm.CRCGenerator

%% crc parameters
poly = 'z^8 + z^2 + z + 1';
InitialConditions = 0;% [1 0 0 0 1 1 0 0];
DirectMethod = true;
ReflectInputBytes = true;
ReflectChecksums = true;
FinalXOR = 0;% [1 0 0 1 0 1 0 1];
ChecksumsPerFrame = 2;

%% data msg to crc
%x = [0 1 0 1 0 1 1 1]';
%x = [1 0 1 1 1 1 0 0]'; % x7e

x = de2bi(hex2dec('f31df3a2'),'left-msb')'; % ! make sure vector is correct lengh with leading 0's !!!
%x = [0 0 0 0 0 1 0 1]';

%% setup crc generator
crc8 = comm.CRCGenerator;
crc8.Polynomial = poly;
crc8.InitialConditions = InitialConditions;
crc8.DirectMethod = DirectMethod;
crc8.ReflectInputBytes = ReflectInputBytes;
crc8.ReflectChecksums = ReflectChecksums;
crc8.FinalXOR = FinalXOR;
crc8.ChecksumsPerFrame = ChecksumsPerFrame;
%get(crc8)

%% setup crc detector
crc8d = comm.CRCDetector;
crc8d.Polynomial = poly;
crc8d.InitialConditions = InitialConditions;
crc8d.DirectMethod = DirectMethod;
crc8d.ReflectInputBytes = ReflectInputBytes;
crc8d.ReflectChecksums = ReflectChecksums;
crc8d.FinalXOR = FinalXOR;
crc8d.ChecksumsPerFrame = ChecksumsPerFrame;
%get(crc8d)


%% calculate crc value
crcx = crc8(x); % checksum appended to input data
checksum = crcx(end-7:end)'; % get checksum only
checksum = dec2hex(bi2de(checksum,'left-msb')); % convert to hex 
checksum


%% detect 
[tx,err] = crc8d(crcx);

crcx = crcx'
tx = tx';
err

%% test
if tx == x'
  disp('Good')
else
  disp('Error!')
end
  