clear; 

% CHOOSE ONE
example = 1;    % If example = 1, use chirp-like signal
                % If example = 2, use audio signal


if example == 1
    % PARAMETERS FOR CHIRP-LIKE SIGNALS
    Fs = 5000;
    f1 = Fs/2;
    T = 1;
    M = 10;
    t0 = 0:1/Fs:(T-1/Fs);
    t = 0:1/Fs:(T*(M-1)-1/Fs);
    Q = length(t); 
    n = 0:(Q-1);
       
    % CHIRP-LIKE SIGNAL (NOTE: AN ACTUAL CHIRP HAS A CONTINUALLY CHANGING FREQEUCNY)
    x0 = cos(2.*pi.*(f1.*((1:(M-1)))/(M)).*t0.');
    x = x0(:);
elseif example == 2
    
    [x, Fs] = audioread('commander.wav');
    Q = length(x);
    t = 0:1/Fs:(length(x)/Fs-1/Fs);
    n = 0:(Q-1);

end

% DESIRED FREQUENCIES
wctft = 0:(2*pi*Fs/Q):(2*pi*Fs-2*pi*Fs/Q);
wdtft = 0:(2*pi/Q):(2*pi-2*pi/Q);

% COMPUTE FOURIER TRANSFORMS
Xctft = ctft(x,t,wctft);

Xdtft = dtft(x,n,wdtft);

[Xdft, wdft]  = dft(x,length(x));

[Xstft, nstft, wstft, tstft, Wstft] = stft_func(x,100,Fs);



%%



figure(1)
subplot(411)
plot(wctft,abs(Xctft))
xlim([0 2*pi]*Fs)
xlabel('Frequency [Hz]')
ylabel('Magnitude Response')
title('CTFT Magnitude')
subplot(412)
plot(wdtft,abs(Xdtft))
xlim([0 2*pi])
xlabel('Normalized Frequency [rad/s]')
ylabel('Magnitude Response')
title('DTFT Magnitude')
subplot(413)
plot(wdft,abs(Xdft))
xlim([0 2*pi])
xlabel('Normalized Frequency [rad/s]')
ylabel('Magnitude Response')
title('DFT Magnitude')
subplot(414)
imagesc(wstft, nstft, abs(Xstft.'))
hold on;
h = plot([0 2*pi],[0 0], '--w');
hold off;
xlim([0 2*pi]); 
ylabel('Time [samples]')
xlabel('Normalized Frequency [rad/s]')
title('STFT Magnitude')


%%

xlength = length(x)/Fs;
soundsc(x,Fs);
a = tic;

figure(1)
set(gcf, 'Unit', 'Inches', 'Position', [1 1 4 7])
while xlength-toc(a) > 0
    h.YData = [1 1]*(toc(a)*Fs);
    drawnow;
end

