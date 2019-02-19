clc;
close all;
clear all;

% [y, fs] = audioread('A.wav');
% 
% j = 0;
% for i = 2:length(y(512:5120,1))  % Apply pre-emphasis - change 0.97 value to anything between 0.5 and 1.0
%     y_premp(i) = y(i) - 0.97*y(i-1); 
% end
% win = buffer(y_premp,128,64);  %Framing the signal with 256 samples with 50% overlap
% sz = size(win);
% 
% for i = 1:sz(2)
%     y_fr(:,i) = win(:,i).*hamming(128);   %applying hamming window
%     dft_y(:,i) = fft(y_fr(:,i));          %applying dft
% end
% 
% %size(dft_y)
% 
% for i =1:sz(2)
%     a(:,i) = lpc(y_fr(:,i),9);   %Compute LPC 
% end
% % for i = 1:1980
% %     [a(i),g(i)] = lpc(y_fr(:,i),10)
% % end
% size(a)
% a = a(:,19:73)';
% 
% % Creating codebook for 'A'
% [A_idx,A_cbook] = kmeans(a,8);

%[A_idx,A_cbook] = create_cbook('A.wav',512,5120,128,19,73);

%[B_idx, B_cbook] = create_cbook('B.wav',1,5056,128,1,34);
%[y, fs] = audioread('B.wav');

[y, fs] = audioread('B.wav');

j = 0;
for i = 2:length(y(659:3200,1))  % Apply pre-emphasis - change 0.97 value to anything between 0.5 and 1.0
    y_premp(i) = y(i) - 0.97*y(i-1); 
end
win = buffer(y_premp,128,64);  %Framing the signal with 256 samples with 50% overlap
sz = size(win);

for i = 1:sz(2)
    y_fr(:,i) = win(:,i).*hamming(128);   %applying hamming window
    dft_y(:,i) = fft(y_fr(:,i));          %applying dft
end

%size(dft_y)

for i =1:sz(2)
    a(:,i) = lpc(y_fr(:,i),9);   %Compute LPC 
end
% for i = 1:1980
%     [a(i),g(i)] = lpc(y_fr(:,i),10)
% end
%size(a)
lpc_e = size(a);
lpc_e = lpc_e(1);
%a = a(:,lpc_s:lpc_e)';
%y(659:3200)
size(a')
a'
% Creating codebook for 'A'
[idx,cbk] = kmeans(a',8);
size(cbk)
%size(y)
% Computing LPC coefficients of B

