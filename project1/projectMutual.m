% clear
clc
%Some Parameters:
BW = 800; % MHz %bandwidth

flo = 1100; %MHz
fhi= 1900; %MHz 
f_c = 1500.097656; %MHz; %center frequency [Hz]

K  = 150; % number of channels
Ts = K/BW; % = 5.12 usec % sample period [sec]Pulsar 
DM = 15.917; 
Period = 4.57; %msec

%  = 10; % the number of channels
Nsub = 32768;  

%load j1713_mat_0; 
load re; %double, size 4096-by-32768 
load im; %double, size 4096-by-32768 

% Find Spectral Entropy
r = 1;
% Plot histograms of practical 

% Create 4096 x 4096 empty matrix
% D_re = zeros(K, K);
% D_im = zeros(K, K);

for i = 1:K
%     [num1,pos1] = hist(re(i,:),[-128:1:127]);  
%     num1 = num1./sum(num1) + 10^(-10); % Normalised
%     [num2, pos2]  = (im(i,:),[-128:1:127]); 
%     num2 = num2./sum(num2) + 10^(-10);  % Normalised
    
    for j = 1: K
    % Real
%     [num1j,pos1j] = hist(re(j,:),[-128:1:127]);  
%     num1j = num1j./sum(num1j) + 10^(-10); % Normalised
%     
    % Joint Probability
    PX = histogram2(im(i,:)',im(j,:)',[128, 128],'Normalization','probability'); 
%     figure(1)     
%     plot(pos1,num1,'b') 
%     axis([-10,10,0,0.5])
%     pause(0.5)
%     D_re(i,j) = sum(num1.*log(num1./num1j)); 

    % Joint Entropy
    Joint_im(i,:) = - sum((PX.Values +10^(-10)).*log(PX.Values+10^(-10))); 
    r = r + 1;
    disp(i)
    disp(j)
    
    end
end
% figure(1)
% imagesc(D_re)
figure(2)
imagesc(Joint_im)


hist3([im(i,:)',im(j,:)'],'Nbins',[256, 256],'CDataMode','auto','FaceColor','interp')
xlabel('Real Channe1 1')
ylabel('Real Channel 2')
colorbar
view(2)