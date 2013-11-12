%s = getSignalAroundIndex(signal,idx,Nleft,Nright)
function s = getSignalAroundIndex(signal,idx,Nleft,Nright)

    tmpr = signal(idx:end);
    tmpl = signal(1:idx-1);

    if(length(tmpr) < Nright)

        tmpr = [tmpr zeros(1,Nright-length(tmpr) )];
    else

        tmpr=tmpr(1:Nright);
    end


    if(length(tmpl) < Nleft-1)        
        tmpl = [zeros(1,Nleft-length(tmpl)-1) tmpl];
    else

        tmpl = tmpl((end-Nleft+2):end);

    end
        
    s = [tmpl tmpr];