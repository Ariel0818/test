function X = ctft(x,t,W)
Dt = t(2) - t(1);
X = zeros(1 , length(W));

for k = 1 : length(W)
    im = -1j*W(k);
    for n = 1:length(x)
        X(k) = X(k) + x(n) * exp(im*(n-1)*Dt); 
        
    end

    X(k) = Dt * X(k);

end
end