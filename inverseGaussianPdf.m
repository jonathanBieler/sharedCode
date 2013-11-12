% p = inverseGaussianPdf(x,mu,l)
function p = inverseGaussianPdf(x,mu,l)

p = sqrt(l./(2*pi*x.^3)) .* exp(-l*(x-mu).^2 ./ (2*mu^2*x) );

p(isnan(p))=0;
p(isinf(abs(p)))=0;