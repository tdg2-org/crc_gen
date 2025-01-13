 clear;clc
% crc
% help comm.CRCGenerator

%% crc parameters

poly = '100000111'; % 100000111

Polynomial = poly-'0'; % [1 1 0 0 0 0 0 1 1 1];%'z^8 + z^2 + z + 1';
InitialConditions = 0;  % [1 0 0 0 1 1 0 0];
DirectMethod = true;
ReflectInputBytes = false;
ReflectChecksums = false;
FinalXOR = 0;% [1 0 0 1 0 1 0 1];
ChecksumsPerFrame = 1;

%% data msg to crc

%x = de2bi(hex2dec('831a'),'left-msb')'; % ! make sure vector is correct lengh with leading 0's !!!
x = '00110101'-'0'; x = x'; %00101111 00110101

%% setup crc generator
crc8 = comm.CRCGenerator;
crc8.Polynomial = Polynomial;
crc8.InitialConditions = InitialConditions;
crc8.DirectMethod = DirectMethod;
crc8.ReflectInputBytes = ReflectInputBytes;
crc8.ReflectChecksums = ReflectChecksums;
crc8.FinalXOR = FinalXOR;
crc8.ChecksumsPerFrame = ChecksumsPerFrame;
%get(crc8)

%% setup crc detector
crc8d = comm.CRCDetector;
crc8d.Polynomial = Polynomial;
crc8d.InitialConditions = InitialConditions;
crc8d.DirectMethod = DirectMethod;
crc8d.ReflectInputBytes = ReflectInputBytes;
crc8d.ReflectChecksums = ReflectChecksums;
crc8d.FinalXOR = FinalXOR;
crc8d.ChecksumsPerFrame = ChecksumsPerFrame;
%get(crc8d)

%% 
checksumLen = length(poly) - 1;



%% calculate crc value
crcx = crc8(x); % checksum appended to input data
dec2hex(bi2de(crcx','left-msb'))
crcLen = length(crcx)

if ChecksumsPerFrame == 1 
  checksum = crcx(end-(checksumLen-1):end)'; % get checksum only
  checksum = dec2hex(bi2de(checksum,'left-msb')); % convert to hex 
  checksum
else
  % each frame+checksum a single column, set up an empty matrix
  checksumv = zeros(length(crcx)/ChecksumsPerFrame, ChecksumsPerFrame);
  crcLen = length(crcx)/ChecksumsPerFrame; % length of frame+checksum
  % put each frame+checksum into the matrix
  for i = 1:ChecksumsPerFrame
    checksumv(:,i) = crcx(crcLen*(i-1) + 1:crcLen*i);
    
    %checksumv(:,i) = crcx(1:crcLen);
    %checksumv(:,i) = crcx(crcLen+1:end);
  end
  
  frameLen = length(x)/ChecksumsPerFrame; % frame length without checksum
  %checksumLen = (crcLen - frameLen) / ChecksumsPerFrame; % lenght of each checksum

  for i = 1:ChecksumsPerFrame
    checksum = checksumv(end-checksumLen:end,i)';
    checksum = dec2hex(bi2de(checksum,'left-msb')); % convert to hex 
    checksum
  end
    
    
%   % 1st checksum
%   checksum = checksumv(end-checksumLen:end,1)';
%   checksum = dec2hex(bi2de(checksum,'left-msb')); % convert to hex 
%   checksum
%   
%   % 2nd checksum
%   checksum = checksumv(end-checksumLen:end,2)';
%   checksum = dec2hex(bi2de(checksum,'left-msb')); % convert to hex 
%   checksum
  
end

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
  