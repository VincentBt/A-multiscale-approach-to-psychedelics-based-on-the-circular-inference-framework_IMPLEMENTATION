function Y=F(X,p1,p2)

pX=exp(X)./(1+exp(X));

pY=pX*p1+(1-pX)*p2;

Y=log(pY./(1-pY));