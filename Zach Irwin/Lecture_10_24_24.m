%% Getting the data in a usable format:

load('popcorn.mat');

yield = reshape(popcorn, [], 1);
brand = repelem(["Brand1"; "Brand2"; "Brand3"], 6);
type = repelem(repmat(["Air"; "Oil"], 3, 1), 3);

data = table(yield, brand, type);

%% Descriptive stats:

mean_brand1 = mean(data.yield(data.brand == "Brand1"));
mean_brand2 = mean(data.yield(data.brand == "Brand2"));
mean_allbrands = mean(popcorn, 1);

std_brand1 = std(data.yield(data.brand == "Brand1"));
std_brand2 = std(data.yield(data.brand == "Brand2"));
std_allbrands = std(popcorn, [], 1);

prctile(data.yield, 50);
median(data.yield);

max(data.yield);
min(popcorn,[],2);

%% covariance and correlation:

x = rand(size(popcorn));
cov(popcorn, x);


corr(popcorn);
cov(popcorn);

corr(popcorn, x);

%% Are there differences in the mean between brands?

[h, p] = ttest(data.yield(data.brand == "Brand1"));
[h, p] = ttest2(data.yield(data.brand == "Brand1"), data.yield(data.brand == "Brand2"))
[h, p] = ttest2(data.yield(data.brand == "Brand1"), data.yield(data.brand == "Brand3"))
[h, p, ci, statobj] = ttest2(data.yield(data.brand == "Brand2"), data.yield(data.brand == "Brand3"))

%% ANOVA:

anovamdl = anova(data, 'yield ~ brand + type + brand:type')
multcompare(anovamdl, ["brand", "type"])

groupmeans(anovamdl, ["brand", "type"])

boxchart(anovamdl, ["brand", "type"])
