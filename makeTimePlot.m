function [] = makeTimePlot(idx,signal,peakMatrix,divMatrix,ind,expe)


    
    clfh;
            
    
    tmp = signal(idx,:);
         
    maxp = find( peakMatrix(idx,:))';
         
    nonZeroIdx = find(ind(idx,:) > 0);
    nonZeroIdx = nonZeroIdx(1);
        
    for j=1:size(maxp,1)
        plot([expe.t(maxp(j,1)) expe.t(maxp(j,1))],[0 300],'color',0.6*[1 1 1])
    end
    per=[];
    for j=1:size(maxp,1)-1
        per(j) = expe.t(maxp(j+1,1)) - expe.t(maxp(j,1));

        offset = 1+5*rand;
        plot([expe.t(maxp(j,1)) expe.t(maxp(j,1)) + per(j)],tmp(maxp(j,1))*[1 1],'k')
        text(expe.t(maxp(j,1)) + per(j)/2,tmp(maxp(j,1))*1-offset-0.05,num2str(per(j)))
    end
            
    plot(expe.t(1:length(tmp)), tmp,'color','k','lineWidth',2)
    
    % plot division
    dd = find(divMatrix(idx,:) > 0 );
    for j=1:length(dd)
       
        offset = 5*randn;           
           
        ff = dd(j);
        plot([expe.t(ff) expe.t(ff)],[0 300],'color',[1 0.6 0.6])
               
        if( ~isempty(maxp) )
        
            ppeaks = maxp(:,1);
            ppeaks = ppeaks(ppeaks < ff);            
            divTiming = find(abs( ff - ppeaks) == min(abs(ff - ppeaks)) );
            %divTiming = divTiming(1);
            
            if(isempty(divTiming))
                ppeaks = maxp(:,1);
                ppeaks = ppeaks(ppeaks < ff);            
                divTiming = find(abs( ff - ppeaks) == min(abs(ff - ppeaks)) );                
            end
                        
            if(~isempty(divTiming))
                divTiming = divTiming(1);

                plot([expe.t(ff) expe.t(maxp(divTiming,1))],10+max(tmp)*[1 1]+offset,'r')

                divTimingHours = expe.t(ff) - expe.t(maxp(divTiming,1));

                text(mean([expe.t(ff) expe.t(maxp(divTiming,1))]),[max(tmp)+15+offset],num2str(divTimingHours))
            end
                        
        end
    end
        
    xlabel('time [h]')
    ylabel('mean pixel intensity')
      
    axis([0 expe.t(length(tmp)) 0.9*min(tmp) 1.2*(max(tmp))])