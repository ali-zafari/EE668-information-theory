clc;
clear;

edges = -128-0.5:127+0.5;
load('re.mat')
Num_of_Channels = 4096;
PiX = zeros(Num_of_Channels, 256);
kl = zeros(Num_of_Channels, Num_of_Channels);

for i = 1:Num_of_Channels
    PiX(i, :) = histcounts(re(i, :), edges, "Normalization", "probability");
end

PiX(PiX == 0) = 10^-10;


for i = 1:Num_of_Channels
    for j = 1:Num_of_Channels
        kl(i, j) = sum(PiX(i, :).* log2(PiX(i, :)./PiX(j, :)));
    end
end
