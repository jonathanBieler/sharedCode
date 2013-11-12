function [] = plotDivisionTimeDistrib(peakMatrix, divMatrix, expe, bins, doKSDensity, col)


p = getBinarySeq(peakMatrix,divMatrix,[-1 1]);

p = (p(:,1)-p(:,2))*expe.dt;


plot(bins,ksdensity(p,bins),'color',col)

xlabel('Division time wrt next peak')
setFonts