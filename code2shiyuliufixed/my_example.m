clear; 
clc;

[myaudio, Fs] = audioread('red_short.wav');
[mysegment, Fs] = audioread('019.wav');

% my input signal is defaulted as horizontal vectors.
myaudio = transpose(myaudio);
mysegment = transpose(mysegment);


% GET LENGTHS 
Nx = length(mysegment);
Ny = length(myaudio);

% FIND SEGMENTS
tic; 
[loc, indx, crosscorr] = find_segment(mysegment,myaudio);
[nloc, nindx, ncrosscorr] = find_segment_norm(mysegment,myaudio);
toc

% PLOT RESULTS
figure(1)
subplot(311)
plot(mysegment)
title('mysegment')
ylabel('Signal Amplitude')
subplot(312)
plot(myaudio(loc:loc+Nx))
title('Best match in crosscorr')
ylabel('Signal Amplitude')
subplot(313)
plot(myaudio(nloc:nloc+Nx))
title('Best match in ncrosscorr')
xlabel('Samples')
ylabel('Signal Amplitude')

%PLOT RESULTS
figure(2)
subplot(211)
plot(indx, crosscorr)
title('Cross-Correlation')
xlabel('Lag')
ylabel('Amplitude')
subplot(212)
plot(nindx, ncrosscorr)
xlabel('Lag')
title('Normalized Cross-Correlation')
ylabel('Amplitude')
