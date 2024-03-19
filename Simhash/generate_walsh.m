% The matrix of the walsh transform
% The author name: Alireza Keshavarz Choobeh, Email: ali.cho@yahoo.com
function W=generate_walsh(N)
n=log2(N);
if round(n)~=n
    error('log2(N) must be integer');
end
W=zeros(N);
for x=0:N-1
    for u=0:N-1
        ub=str2num(dec2bin(u,n)');
        xb=fliplr(str2num(dec2bin(x,n)')')';
        W(x+1,u+1)=1/sqrt(N)*(-1)^(xb'*ub);
    end
end
end