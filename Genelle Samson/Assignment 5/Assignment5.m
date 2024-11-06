%% 1: generating random data points

r1 = normrnd(30, 10, 10000);
r2 = normrnd(0, 20, 10000);

% 1a: plotting histogram
figure; h = histogram(r1, 'BinWidth', 5)

% 1b: adding second histogram
hold on; histogram(r2, 'BinWidth', 5)

% 1c: specified BinWidth within prompts (5), also checked histogram
% properties for bin width

% 1d: changed color of first histogram
figure; h2 = histogram(r1, 'BinWidth', 5, 'FaceColor', 'red')
hold on; histogram(r2, 'BinWidth', 5, 'FaceColor', 'auto')

%% 2

load("seamount.mat");

% 2a
figure; scatter3(x, y, z, [], z, 'filled');

% 2b
xlabel('x-coordinate');
ylabel('y-coordinate');
zlabel('z-coordinate (height)');

%% 3

data = readtable('patients.xlsx', 'TextType', 'string');

mdl = fitlm(data, 'Diastolic ~ Age + Height + Weight + Gender + Smoker');

% 3a
plotAdded(mdl, "Smoker");

% 3b
mdla = anova(data, 'Diastolic ~ Age + Height + Weight + Gender + Smoker', CategoricalFactors=["Gender" "Smoker"]);

%% 4: created function fib.m

%% 5

tbl = readtable('indomethacin.xlsx', 'TextType', 'string');
time = tbl.time;
conc = tbl.concentration;
timepoints = unique(time);

tbl2 = reshape(conc,[11,6]); % converts concentration data into a matrix where rows correspond to each time point and columns correspond to each subject
M = mean(tbl2, 2); % 5a: mean concentration across subjects at each time point
S = std(tbl2, 0, 2); % 5a: std dev across subjects


figure; plot(time(1:11), conc(1:11), time(12:22), conc(12:22), time(23:33), conc(23:33), time(34:44), conc(34:44), time(45:55), conc(45:55), time(56:66), conc(56:66));
hold on;
plot(tbl.time(1:11), M, 'LineWidth', 3);
hold on;
x = tbl.time(1:11); 
y = M
err = S
errorbar(x, y, err, 'LineWidth', 3);
