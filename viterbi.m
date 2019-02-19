% Name: Prathamesh Mandke
% MIS: 111507069
% Title: Viterbi algorithm(Determining state sequence)
% Given a set of matrices pi, emission, transition and the
% observation sequence, the code computes a corresponding most likely state
% sequence using the Viterbi algorithm.

mpi = [0.5, 0.5];

emm = [0.25, 0.75; 0.75, 0.25];

trn = [0.15, 0.85; 0.45, 0.55];

obsrv = [1,2,2,1,2,1,2,1,1,1];

n = size(obsrv);
n = n(2);
states = zeros(1,n);

alpham = zeros(n,2);
alpham(1,1) = mpi(1)*emm(obsrv(1),1);
alpham(2,1) = mpi(2)*emm(obsrv(1),2);

states(1) = max(alpham(1,1),alpham(2,1));
if max(alpham(1,1),alpham(2,1)) == alpham(1,1)
        states(1) = 1;
else
        states(1) = 2;
end

for i = 2:n
    alpham(1,i) = emm(obsrv(i),1)*(alpham(1,i-1)*trn(1,1) + alpham(2,i-1)*trn(2,1));
    alpham(2,i) = emm(obsrv(i),2)*(alpham(1,i-1)*trn(1,2) + alpham(2,i-1)*trn(2,2));
    if max(alpham(1,i),alpham(2,i)) == alpham(1,i)
        states(i) = 1;
    else
        states(i) = 2;
    end
end


display(states)