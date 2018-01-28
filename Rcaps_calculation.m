function [ Rcaps ] = Rcaps_calculation(x)

p=8;
N=length(x);
for i=1:p
    for j=1:p
        temp=0;
        for n=p+1:N+1 
            temp=temp+x(n-j)*x(n-i);
        end
        Rcaps(i,j)=(1/(N-p+1))*temp;
    end
end

end

