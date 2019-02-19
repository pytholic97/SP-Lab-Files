% Name: Prathamesh Mandke
% MIS: 111507069
% HMM for 2 bags 4 balls problems


mpi = [0.5, 0.5];

emb = [0.75, 0.25; 0.25, 0.75];

trn = [0.75, 0.25; 0.25, 0.75];

n = 5;

input = [1,1,2,1,2];

alpham = zeros(2,n);

alpham(1,1) = mpi(1)*emb(1,1);
alpham(2,1) = mpi(2)*emb(1,2);

for i = 2:n
    alpham(1,i) = (alpham(1,i-1)*trn(1,1) + alpham(2,i-1)*trn(2,1))*emb(1,input(i));
    alpham(2,i) = (alpham(1,i-1)*trn(1,2) + alpham(2,i-1)*trn(2,2))*emb(2,input(i));
end
alpham
