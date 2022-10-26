% all operations are based on horizontal vectors.
function [nloc, m, ncrosscorr] = find_segment_norm(x,y)  
    % a = [1;1;2;-4;4;1;1;1;-8;-8;6;1;1];
    % b = [2;-4;2];
    
    Nx = length(x);
    Ny = length(y);
    m = -(Nx-1) : Ny-1 ;
    xr = fliplr(x);
    crosscorr = conv(xr , y);  % numerator cross-correlation 
    bottomx = norm(x);  % demoninator sqrt(sum x^2(n))
    
    len = length(crosscorr);
    extend_y = get_window(y, -Nx + 2 , Ny + Nx - 1);
    
    bottomy = [];
    ncrosscorr = [];
    for n = 1:len
        ytemp = get_window(extend_y , n , n + Nx -1 );
        normy = norm(ytemp);
        bottomy = [bottomy , normy];
        ncrosscorr = [ncrosscorr , crosscorr(n) / (bottomx * normy) ];
    end
    ncrosscorr = transpose(ncrosscorr);
    [maxncross , nloc] = max(ncrosscorr);
    nloc = nloc-Nx;
end