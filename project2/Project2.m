textfile = 'words.txt';
alpha_lower = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',' '];
% Read and Preprocess text
file_open = fopen(textfile);
file_read = fread(file_open);
myname = char(file_read);
myname = erasePunctuation((myname')); % transposed

% Convert to numbers: using ASIIC code
myname = lower(myname) - '0' - 48;

% Used for unique character extraction
a = myname;

% % Take the histogram.
% edges = 1:26;
% counts = histcounts(myname, edges); %frequency
% counts_prob = histcounts(myname, edges) / sum(counts); % probability

% Count characters
[cnt_unique, unique_a] = hist(a, unique(a));
char_text =  string(alpha_lower(end)) + alpha_lower(unique_a(1,2:end)); % add space manually % indexing issues
char_text = char(char_text);

probs = cnt_unique / sum(cnt_unique);
sym = cellstr(char(char_text));

H = char(sym);
H4 = num2cell(H);

[h_p, w_p] = size(probs);
prob1 = reshape(probs,[w_p,1]);
a = sum(probs);

dict = huffmandict(H4, probs);
file_open = fopen(textfile);
file_read = fread(file_open);
file_ch = char(file_read);
file_ch = (erasePunctuation((file_ch'))); % transposed
file_ch = lower(file_ch);
file_ch = char(num2cell(char(file_ch)));


%% Encode and Decode

comp = huffmanenco(file_ch, dict);
H_E = entropy(comp);
domp = huffmandeco(comp,dict);

[h, w] = size(domp);
decoder = reshape(domp,[1, h]);

figure
wordcloud(decoder);
decode = cell2mat(decoder);


%% Encode and Decode
% compx = huffmanenco(file_ch, dict1);
% H_E1 = entropy(comp1);
% domp_x = huffmandeco(comp1,dict1);
% 
% [h, w] = size(domp1);
% decoder1 = reshape(domp1,[1, h]);
% 
% figure
% wordcloud(decoder1);
% decode1 = cell2mat(decoder1);


