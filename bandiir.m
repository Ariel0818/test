function y = bandiir(x,wc,bw)

alpha = exp(-bw);
b = [1 -1];
a = [1 -2*alpha*cos(wc) alpha^2];
y = filter(b,a,x);

end