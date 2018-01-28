function [ Rlower ] = Rlower_calculation(x)

p=8;
N=length(x);
for i=1:p
        temp=0;
        for n=p+1:N 
            temp=temp+x(n)*x(n-i);
        end
        Rlower(i)=(1/(N-p))*temp;
end

end

