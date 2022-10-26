% all operations are based on horizontal vectors.
function [loc, m, crosscorr] = find_segment(x,y)
Nx = length(x);
Ny = length(y);
xr = fliplr(x);
crosscorr = conv(xr , y);
%crossabs = abs(crosscorr);
[maxcross , locend] = max(crosscorr);
loc = locend - Nx;
m = -(Nx-1) : Ny-1 ;
end


