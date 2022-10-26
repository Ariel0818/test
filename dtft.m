function X = dtft(x,n,w)
    X = zeros(length(w), 1);
    for m = 1:length(x)
        for k = 1:length(x)
            X(m) = X(m) + x(k) * exp(-1j * w(m) * n(k));
        end

    end

end
