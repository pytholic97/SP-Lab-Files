function [idx, cbk] = create_cbook(f_name,fr_s,fr_e,fft_n,lpc_s,lpc_e)

[y, fs] = audioread(f_name);

j = 0;
for i = 2:length(y(fr_s:fr_e,1))  % Apply pre-emphasis - change 0.97 value to anything between 0.5 and 1.0
    y_premp(i) = y(i) - 0.97*y(i-1); 
end

win = buffer(y_premp,fft_n,fft_n/2);  %Framing the signal with 256 samples with 50% overlap
sz = size(win);

for i = 1:sz(2)
    y_fr(:,i) = win(:,i).*hamming(fft_n);   %applying hamming window
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
%lpc_e = size(a);
%lpc_e = lpc_e(1);
%a = a(:,lpc_s:lpc_e)';

a = a';

% Creating codebook

[idx,cbk] = kmeans(a(lpc_s:lpc_e,:),8);

end
