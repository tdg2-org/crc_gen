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
ChecksumsPerFrame = 3;

[crcg,crcd] = crcSetup(Polynomial,InitialConditions,DirectMethod,ReflectInputBytes,ReflectChecksums,FinalXOR,ChecksumsPerFrame);

%% data msg to crc

x1 = de2bi(hex2dec('2f35'),'left-msb')'; % ! make sure vector is correct lengh with leading 0's !!!
x = '010111100110101'-'0'; x = x';
data = dec2hex(bi2de(x','left-msb'))

crcx = crcg(x); dec2hex(bi2de(crcx','left-msb'))
length(crcx)

checksumLen = length(poly) - 1;
crcLen = length(crcx)/ChecksumsPerFrame;

if ChecksumsPerFrame == 1
  checksum = crcx(end - (checksumLen-1):end)';
  checksum = dec2hex(bi2de(checksum,'left-msb')); % convert to hex 
  checksum
  crc = dec2hex(bi2de(crcx','left-msb'));
  crc
else
  % each frame+checksum a single column, set up an empty matrix
  crcv = zeros(length(crcx)/ChecksumsPerFrame, ChecksumsPerFrame);
  for i = 1:ChecksumsPerFrame
    crcv(:,i) = crcx(crcLen*(i-1) + 1:crcLen*i);
    y = dec2hex(bi2de(crcv(:,i)','left-msb'));
    s = ['CRC',num2str(i),':      ',y];disp(s)
    
    checksum = crcv(end-(checksumLen-1):end,i)';
    checksum = dec2hex(bi2de(checksum,'left-msb')); % convert to hex 
    s = ['checksum',num2str(i),': ',checksum];disp(s)
  end
end







