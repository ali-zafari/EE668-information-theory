clc;
clear;

edges = -128-0.5:127+0.5;
load('re.mat')
Num_of_Channels = 4096;
JointEntropy = zeros(Num_of_Channels, Num_of_Channels);

for j = 1:Num_of_Channels
    tic
    for i = j:Num_of_Channels
        PiXjX = histcounts2(re(i, :), re(j,:), edges, edges, "Normalization", "probability");
        PiXjX(PiXjX == 0) = 10^-10;
        JointEntropy(i, j) = -sum(PiXjX.* log2(PiXjX),"all");
    end
    disp(j)
    toc
end


% for i = 1:Num_of_Channels
%     for j = 1:Num_of_Channels
%         JointEntropy(i, j) = -sum(PiXjX(i, j, :).* log2(PiXjX(i, j, :)));
%     end
% end
