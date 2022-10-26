function [Xstft, nstft, wstft, tstft, Wstft] = stft_func(x, W, Fs)

N = length(x);
M = floor(N/W);
Xstft = zeros(W, M);
for m = 1:M
    % 0~W-1 W~2W-1  2W~3W-1... (M-1)W~MW-1
%   W_list = (m-1)*W : m*W-1;
    x_S = x((m-1)*W+1 : m*W,:);
    Xstft(:,m) = fft(x_S,W);
end

% nstft
nstft = 0:W:(M-1)*W;

% wstft :a vector of the DFT frequencies for each segment
wstft = zeros(W,1);
k = 0 : N-1;
for n = 1: W
    wstft(n) = 2*pi/W*k(n);
end

% tstft :a vector of the first time value of each segment, in seconds, given sampling rate Fs
T = 1/Fs;
tstft = 0:T:(length(x)/Fs-1/Fs);

% Wstft: vector of the CTFT cyclic frequencies
Wstft = 0:(2*pi*Fs/N):(2*pi*Fs-2*pi*Fs/N);
 



end