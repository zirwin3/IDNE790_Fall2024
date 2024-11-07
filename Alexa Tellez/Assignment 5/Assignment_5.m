% ZI: Great work! grade: 95

% 1. histograms
m1 =30
m2 = 0
sd1 = 10
sd2 = 20
num = 10000

data1 = normrnd(m1, sd2, 1, num);
data2 = normrnd(m2, sd2, 1, num);
binwidth = 2;

f1 = figure;
histogram(data1, 'BinWidth', binwidth, 'FaceColor', 'm');
hold on
histogram(data2, "BinWidth", binwidth);

        % ZI: Looks great!

%% 2. 3D scatterplot
load("seamount.mat")

f2 = figure;
scatter3(x, y, z, [], z, "filled")

xlabel('X Axis');
ylabel('Y Axis');
zlabel('Height (Z Axis)');
title('3D Volcano Scatterplot');

colormap('hot')

        % ZI: Nice!

%% 3.  patient data
importdata("patients.xlsx")
data = readtable('patients.xlsx');

data.Gender = categorical(data.Gender);
data.Smoker= categorical(data.Smoker);

model = fitlm(data, 'Diastolic ~ Age + Height + Weight + Gender + Smoker');
disp(model);

anova(model);

f3 = figure;
plotAdded(model, 'Smoker');

    % ZI: Looks great! The importdata() function isn't necessary, but it
    % doesn't hurt anything.


%% 4. Fibonacci function

% function [nthFib, sumFirst_n] = fib(n)
% if n <= 0
%     error("Input must be a positive integer.");
% end
% 
% f1 = 1;
% f2 = 1;
% 
% if n == 1 || n == 2
%     nthFib = 1;
%     sumFirst_n = 1;
%     return;
% end
% 
% sumFirst_n = 2;  % calculate the nth number and the sum
% for i = 3:n
%     nthFib = f1 + f2;
%     sumFirst_n = sumFirst_n + nthFib;
%     f1 = f2;
%     f2 = nthFib;
% end
% end

    % ZI: Looks great, except the sum for n = 2 should be 2, not 1. 1/4
    % point off for that, but otherwise a great solution!

%% 5.
data = readtable('indomethacin.xlsx');

subjects = unique(data.subject);
numSubjects = length(subjects);

figure;
hold on;
for i = 1:numSubjects
    subjectData = data(data.subject == subjects(i), :);

    timePoints = unique(subjectData.time);
    meanConc = zeros(size(timePoints));
    stdConc = zeros(size(timePoints));

    for j = 1:length(timePoints)
        meanConc(j) = mean(subjectData.concentration(subjectData.time == timePoints(j)));
        stdConc(j) = std(subjectData.concentration(subjectData.time == timePoints(j)));
    end

    errorbar(timePoints, meanConc, stdConc, 'LineWidth', 1);
end

timePoints = unique(data.time);
meanConc = zeros(size(timePoints));
stdConc = zeros(size(timePoints));

for i = 1:length(timePoints)
    meanConc(i) = mean(data.concentration(data.time == timePoints(i)));
    stdConc(i) = std(data.concentration(data.time == timePoints(i)));
end

errorbar(timePoints, meanConc, stdConc, 'k-', 'LineWidth', 1.5);

xlabel('Time');
ylabel('Concentration');
title('Blood Concentration of Indomethacin Over Time');
legend('Subject 1', 'Subject 2', 'Subject 3', 'Subject 4', 'Subject 5', 'Subject 6', 'overall mean')


    % ZI: Excellent work! Technically, because there's only one measurement
    % per time point per subject, you don't need the extra work of figuring
    % out the mean/std for the individual lines, but this is a great
    % framework for more general data where you might have extra
    % measurements