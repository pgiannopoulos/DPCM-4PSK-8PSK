function [ ypred,yout,yerror,yq ] = my_prediction( x,a)
% -----------------METAVLHTES EISODOU------------------
% x: dianusma eisodou
% a: suntelestes provlepth
% -----------------METAVLHTES E3ODOU-------------------
% ypred: dianusma tou shmatos provlepshs
% yout: dianusma shmatos e3odou
% yerror: dianusma sfalmatwn
% yq: dianusma kvantismenwn sfalmatwn
% -----------------------------------------------------
p=8;

% Arxikopoihsh tou ypred kai yout
ypred = zeros(length(x),1);
yout = zeros(length(x),1);
% arxikopoihsh g tis p prwtes times xwris provlepsh
for j=1:p
   yout(j)= x(j);
   yerror(j)=0;
   yq(j)=0;
end

sum=0;
% gia ka8e deigma upologismos ypred,yq,yerror,yout me vash tis prohgoumenes
% times
for n=p+1:length(x)
    for i=1:p
        ypred(n)=ypred(n)+a(i)*yout(n-i);
    end
    yerror(n)=x(n)-ypred(n);
    yq(n)=my_quantizer(yerror(n),3,-3,3);
    yout(n)=ypred(n)+yq(n);
%a8roisths gia upologismo mesous tetragwnikou sfalamatos provlepshs
    sum=sum+((x(n)-ypred(n))^2);
end
%upologismos mesou tetragwnikou sfalmatos
mesos=sum/(length(x)-p);
display(mesos);
end

