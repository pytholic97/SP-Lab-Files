%LPC
% 1 October 2018
% Steps:
% 1. Frame and window the signal as usual.
% 2. Take 10th order LPC using 'lpc' command
% 3. Get 10 LPC coefficients per frame.
% 4. Plot all coefficients by concatenating.
% 5. Compare this plot with praat spectrogram. It should be similar.


clc;
close all;
clear all;

[y,fs] = audioread('a_e_i_o_u_new.wav');  % read the audio file

j = 0;
for i = 2:length(y(:,1))  % Apply pre-emphasis - change 0.97 value to anything between 0.5 and 1.0
    y_premp(i) = y(i) - 0.97*y(i-1); 
end

win = buffer(y_premp,256,128);  %Framing the signal with 256 samples with 50% overlap
size(win)

for i = 1:1980
    y_fr(:,i) = win(:,i).*hamming(256);   %applying hamming window
    dft_y(:,i) = fft(y_fr(:,i));          %applying dft
end

%size(dft_y)

for i =1:1980
    a(:,i) = lpc(y_fr(:,i),9);   %Compute LPC 
end
% for i = 1:1980
%     [a(i),g(i)] = lpc(y_fr(:,i),10)
% end

%size(a)
size(a)
a_cat = a(:);  %Converting 2d array to 1d
% 
% for i = 2:1980
%     a_cat = horzcat(a_cat,a(:,i));
% end
size(a_cat)
%figure;
%stem(linspace(1,19800,19800),a_cat') %Plotting LPC coefficients of al frames
        