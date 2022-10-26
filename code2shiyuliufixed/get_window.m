% all operations are based on horizontal vectors.
function [ywin] = get_window(y,wstart,wend)  
len = length(y);
if wstart <= wend
    if wstart <= 0
        start = zeros(1 , 1 - wstart );
        if wend > len   % yes
            ends = zeros(1 , wend - len);
            ytemp = [start y];
            ywin = [ytemp ends];
        end
    
        if wend <= len && wend >= 1  % yes
            temp = y(:,1:wend);
            ywin = [start temp];
        end
    
        if wend < 1 % yes 
            ywin = zeros(1 , wend - wstart + 1); 
        end
    
    elseif wstart <= len && wstart > 0
        if wend > len % yes
            ends = zeros(1, wend - len);
            temp = y(:,wstart:len);
            ywin = [temp ends];
        end
    
        if wend <=len  % yes
            ywin = y(:,wstart:wend);
        end
    
    elseif wstart > len
        ywin = zeros(1 , wend - wstart +1);

    end
elseif wstart > wend
    fprintf('invalid input');
    ywin = [];
end
    
   