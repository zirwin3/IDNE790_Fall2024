%1 
mean_val = 30;        
std_dev = 10;         
num_points = 10000;   
data = normrnd(mean_val, std_dev, [num_points, 1]); % To generate data

%% 1a Histogram of the data
figure;
histogram(data, 50); % 50 is the number of bins
title('Histogram of Normally Distributed Data');
xlabel('Data Values');
ylabel('Frequency');

% 1b and 1c Histogram of another data
mean_val2 = 0;        
std_dev2 = 20;          
data = normrnd(mean_val2, std_dev2, [num_points, 1]);

figure;
histogram(data, 50);
hold on;
histogram(data2, 50);
title('Histogram of Normally Distributed Data');
xlabel('Data Values');
ylabel('Frequency');
legend('Data 1 (Mean = 30, SD = 10)', 'Data 2 (Mean = 0, SD = 20)');

% 1d to change the color of the first histogram
figure;
histogram(data, 50, 'FaceColor', 'g');  % Set the first histogram to green
hold on;
histogram(data2, 50); 
title('Histogram of Normally Distributed Data');
xlabel('Data Values');
ylabel('Frequency');
legend('Data 1 (Mean = 30, SD = 10)', 'Data 2 (Mean = 0, SD = 20)');

%% 2
load('seamount.mat');
% Create a 3D scatter plot
scatter3(x, y, z, 36, z, 'filled');  % 36 is the marker size, z is used to color by height
xlabel('X Coordinate');
ylabel('Y Coordinate');
zlabel('Z Coordinate (Height)');
colorbar;
title('3D Scatter Plot');

%% 3
data = readtable('patients.xlsx');
% Age = data.Age;
% Height = data.Height;
% Weight = data.Weight;
% Gender = double(strcmp(data.Gender, 'Male'));
% Smoker = double(data.Smoker);
% data.Gender = categorical(data.Gender);
% data.Smoker = categorical(data.Smoker);
% Smoker = double(data.Smoker);
model = fitlm(data, 'Diastolic ~ Age + Height + Weight + Gender + Smoker')
disp(model);
%3a
figure;
plotAdded(model, 'Smoker');
title('Effect of Smoking Status on Diastolic Blood Pressure (Adjusted for Other Variables)');
xlabel('Smoker Effect');
ylabel('Diastolic Blood Pressure');
%3b
% To perform ANOVA on the model
anovaResults = anova(model, 'summary');

% Display the ANOVA table
disp(anovaResults);


%% 4
fib(1);
fib(2);
fib(5);
n = 10; 
[nth_fib, sum_fib] = fib(n);
fprintf('The %dth Fibonacci number is %d.\n', n, nth_fib);
fprintf('The sum of the first %d Fibonacci numbers is %d.\n', n, sum_fib);

%% 5

data = readtable('indomethacin.xlsx');

subjects = unique(data.subject);

figure;
hold on;
for i = 1:length(subjects)
    % To extract data for the current subject
    subject_data = data(data.subject == subjects(i), :);
    
    % To plot concentration over time for this subject
    plot(subject_data.time, subject_data.concentration, 'LineWidth', 1.5);
end

xlabel('Time');
ylabel('Concentration');
title('Indomethacin Concentration Over Time for Each Subject');
legend('Subject 1', 'Subject 2', 'Subject 3', 'Subject 4', 'Subject 5', 'Subject 6');

% 5a and 5b
% For unique time course
timePoints = unique(data.time);
meanConcentration = zeros(length(timePoints), 1);
stdConcentration = zeros(length(timePoints), 1);

% To calculate mean and standard deviation across subjects for each time point
for t = 1:length(timePoints)
    currentData = data.concentration(data.time == timePoints(t));
    
    % Calculate mean and standard deviation
    meanConcentration(t) = mean(currentData);
    stdConcentration(t) = std(currentData);
end

% To plot mean concentration with error bars
errorbar(timePoints, meanConcentration, stdConcentration, 'k', 'LineWidth', 2);
xlabel('Time');
ylabel('Concentration');
title('Indomethacin Concentration Over Time for Each Subject and Mean');
legend('Subject 1', 'Subject 2', 'Subject 3', 'Subject 4', 'Subject 5', 'Subject 6');











