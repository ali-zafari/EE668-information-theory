clc;
clear;

K = 4096; % the number of channels
Nsub = 32768;  
load re; %double, size 4096-by-32768 

for i = 1:K
    %Plot histograms of practical data
    [num1,pos1] = hist(re(i,:),[-128:1:127]); 
    num1 = num1./sum(num1) + 10^(-10); 
    H_re(i) = - sum(num1.*log2(num1)); 
end 

figure(1) 
plot(1:K,H_re) 
xlabel('frequency, in bins') 
ylabel('Spectral Entropy')