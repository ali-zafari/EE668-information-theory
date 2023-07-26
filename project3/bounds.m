clc;
clear all;
close all;

%% Hamming bound on IrisCode Population
n=245;
e=0.12;
p=zeros(13);
q=zeros(13);

for i=1:13
    r=floor(n*e);
    d=(2*r)+1;
%     p(i)=r/n;

    p(i) = e;

    k=0;
    for j=0:r
        k = k + nchoosek(n, j);
    end

    q(i)=(2^n)/k;

    e = e+0.02;
end

% h1 = semilogy();

% hold on;

%% Plotkin Bound on IrisCode Population

e=0.12;
A=zeros(1,13);
B=zeros(1,13);

for i=1:13
    r=n*e;
    r=floor(r);
    d=(2*r)+1;
    B(i)=r/n;
    if mod(d,2)==0 && (2*d)>n
            A(i)=2*(d/(2*d)-n);
    elseif mod(d,2)==1 && (2*d)+1>n
            A(i)=2*((d+1)/((2*d)+1-n));
    elseif mod(d,2)==0 && 2*d==n
            A(i)=4*d;
    elseif mod(d,2)==1 && (2*d)+1==n
            A(i)=(4*d)+4;
    else 
            disp("invalid case");
    end  
    e=e+0.02;
end 



%% Elias-Bassalygo bound on IrisCode Population
e=0.12;
ebx=zeros(13);
eby=zeros(13);

for i=1:7
    r=n*e;
    r=floor(r);
    disp(r);
    d=(2*r)+1;
    ebx(i) = e;
    Jnr = floor((n/2)*(1-sqrt(1-((2*(2*r+1))/n))));
    eby(i)=floor((n*2^(n+1))/nchoosek(n,Jnr));

    e = e+0.02;
end


%% Gilbert-Varshamov Lower Bound

e=0.12;
gvx=zeros(13);
gvy=zeros(13);

for i=1:13
    r=floor(n*e);
    d=(2*r)+1;
    gvx(i) = e;

    k=0;
    for j=0:2*r
        k = k + nchoosek(n, j);
    end

    gvy(i)=ceil((2^n)/k);

    e = e+0.02;
end




%semilogy(B,A, 'r-*', p, q, 'b--o', gvx, gvy, 'g-.+',ebx, eby, 'k:d', 'LineWidth',3, 'MarkerSize',10);
h0 = semilogy(B,A, 'r-*','LineWidth',3, 'MarkerSize',10);
hold on;

h1 = semilogy(p, q, 'b:o','LineWidth',3, 'MarkerSize',10);
h2 = semilogy(gvx, gvy, 'g-.+','LineWidth',3, 'MarkerSize',10);
h3 = semilogy(ebx, eby, 'k--d','LineWidth',3, 'MarkerSize',10);
% ,'LineWidth',3, 'MarkerSize',10);

% lgd = legend('Plotkin', 'Hamming', 'Gilbert-Varshamov', 'Elias-Bassalygo');
lgd = legend([h0,h1(1),h2(1),h3(1)], 'Plotkin', 'Hamming', 'Gilbert-Varshamov', 'Elias-Bassalygo');
title(lgd,'Bounds');
grid on;
xlim([0.12 0.36]);
set(gca,'FontSize',20);
ylabel('Population');
xlabel(sprintf('Radius in Normalized HD (n=%d)', n));
