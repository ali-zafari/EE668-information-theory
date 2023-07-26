clear all 
K = 4096; % the number of channels
Nsub = 32768;  
%load j1713_mat_0; 
load re; %double, size 4096-by-32768 
load im; %double, size 4096-by-32768 

% Find Spectral Entropy
r = 1; 
for i = 1:K
%Plot histograms of practical data
[num1,pos1] = hist(re(i,:),[-128:1:127]); 
num1 = num1./sum(num1) + 10^(-10); 
[num2,pos2] = hist(im(i,:),[-128:1:127]); 
num2 = num2./sum(num2) + 10^(-10); 

% figure(1)     
% plot(pos1,num1,'b') 
% %axis([-10,10,0,0.5])
% pause(0.5)

H_re(i) = - sum(num1.*log(num1)); 
H_im(i) = - sum(num2.*log(num2)); 
r = r + 1
end 

figure(2) 
plot(1:K,H_re,'b',1:K,H_im,'r') 
xlabel('frequency, in bins') 
ylabel('Spectral Entropy')
