clc;
clear;

x1 = [1, 1, 1, 5, 6];
x2 = [1, 1, 2, 4, 6, 1, 1, 1];
edges = 1-0.5:6+0.5;

P1x = histcounts(x1, edges, "Normalization", "probability");
P2x = histcounts(x2, edges, "Normalization", "probability");

P1x(P1x == 0) = 10^(-10);
P2x(P2x == 0) = 10^(-10);

ratio = P1x./P2x;

before_sum = P1x.*ratio;

sum(before_sum)