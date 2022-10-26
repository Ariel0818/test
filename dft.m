function [X, w] = dft(x,N)
    X = zeros(length(x),1);
    w = zeros(length(x),1);
    k = 0 : N-1;
    for n = 1: N
        w(n) = 2*pi/N*k(n);
    end

    for m = 1:length(x)
        for n = 1: N
            X(m) = X(m) + x(n)* exp(-1j*w(m)*(n-1));
        end

    end
  
    end