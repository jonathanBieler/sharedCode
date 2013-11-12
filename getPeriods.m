%getPeriods(peakMatrix,divMatrix,expe,NeventInBetween)
function [out ind] = getPeriods(peakMatrix,divMatrix,expe,NeventInBetween)


out =[];
ind =[];

for i=1:length(NeventInBetween)


    [pers idx] = getBinarySeq(peakMatrix,divMatrix,[1 -ones(1,NeventInBetween(i) ) 1]);

    pers = pers(:,end)-pers(:,1);
    pers = pers*expe.dt;

    out = [out; pers];
    ind = [ind; idx];
    
end