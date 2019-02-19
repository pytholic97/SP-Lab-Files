% 10 sept 2018 
% Title: Mel frequemcy cepstral coefficient --> MFCC
% Preemphasis then windowing then dft then mel filter bank then extract then take idft
% cepstrum to spectrum using DCT or inverse fft.
% Apply hamming after preemph then fft.
% triangular filter to convert to mel scale.
close all;
clc;
[y,fs] = audioread('a_e_i_o_u_new.wav');

j = 0;
for i = 2:length(y(:,1))
    y_premp(i) = y(i) - 0.97*y(i-1);
end
% 
% for i = 1:573
%     for k = j+1:j+882
%         fr(i,k) = y(k,1);
%     end
%     j = j + 441;
% end

y_fr = buffer(y_premp,512,256);
size(y_fr)

for i = 1:990
    y_fr(:,i) = y_fr(:,i).*hamming(512);
    dft_y(:,i) = fft(y_fr(:,i));
end

size(dft_y)
figure;

%size(abs(dft_y(:,1)))
stem(abs(dft_y(:,1)));
xlabel('Freq');
ylabel('Amplitude')
title('FFT');

figure;
stem(y_fr(:,1));
xlabel('Time')
ylabel('Amplitude')
title('Frame - Time domain');

figure;
stem(log2(abs(dft_y(:,1))));
xlabel('Freqeuncy')
ylabel('Amplitude')
title('Log FFT')

for i = 1:512
    mel_sc(i) = 2595*log10(1+i/(700*512));
end

figure;
stem(mel_sc,log2(abs(dft_y(:,1))));
xlabel('Mel - scale')
ylabel('Amplitude')
title('Mel cepstrum')
    
