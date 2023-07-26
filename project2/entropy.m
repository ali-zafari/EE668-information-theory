clc;
clear;

alphabet = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',' ','.'};
cat_values = double(cell2mat(alphabet));
cat_names = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','space','period'};

text1 = 'abbb bcdecde  ';
chars1 = double(cell2mat(split(lower(text1), "")));
chars_d_1 = double(chars1);
cat_1 = categorical(chars_d_1, cat_values, cat_names);
h1 = histogram(cat_1, "Normalization","probability");
probs1 = h1.Values + 10^(-10);
entropy1 = sum(-probs1.*log2(probs1));

figure
text2 = '   xy xzx   ';
chars2 = double(cell2mat(split(lower(text2), "")));
chars_d_2 = double(chars2);
cat_2 = categorical(chars_d_2, cat_values, cat_names);
h2 = histogram(cat_2, "Normalization","probability");
probs2 = h2.Values + 10^(-10);
entropy2 = sum(-probs2.*log2(probs2));

probs_uniform = ones(1,28) ./ 28;
entropy_uniform = sum(-probs_uniform.*log2(probs_uniform));
