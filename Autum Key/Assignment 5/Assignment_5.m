%#1 1.	Use the normrnd() function to generate 10,000 normally-distributed data points with a mean of 30 and 
% standard deviation of 10
% Set parameters for the normal distribution
mean_value = 30;
std_dev = 10;
num_points = 10000;

% Generate the data points
data = normrnd(mean_value, std_dev, [num_points, 1]);
histogram(data, 50); % Plot histogram with 50 bins
title('Histogram of Normally Distributed Data');
xlabel('Value');
ylabel('Frequency');
%% b.	On the same axes, plot a histogram of another normal distribution with a mean of 0 and standard deviation of 20
% Make sure both histograms have the same bin width
% Change the color of the first histogram 

% Parameters for the first normal distribution
mean1 = 30;
std_dev1 = 10;
num_points = 10000;

% Parameters for the second normal distribution
mean2 = 0;
std_dev2 = 20;

% Generate data for both distributions
data1 = normrnd(mean1, std_dev1, [num_points, 1]);
data2 = normrnd(mean2, std_dev2, [num_points, 1]);

% Define bin edges to ensure same bin width
bin_edges = min([data1; data2]):2:max([data1; data2]); % Adjust width as needed

% Plot the first histogram
figure(1)
histogram(data1, bin_edges, 'FaceColor', 'b', 'FaceAlpha', 0.5); % Change color to blue with transparency
hold on; % Hold the plot to overlay the next histogram

% Plot the second histogram on the same axes
histogram(data2, bin_edges, 'FaceColor', 'r', 'FaceAlpha', 0.5); % Change color to red with transparency

% Add title and labels
title('Overlaid Histograms of Two Normal Distributions');
xlabel('Value');
ylabel('Frequency');
legend('Mean = 30, SD = 10', 'Mean = 0, SD = 20');
hold off; % Release the hold
%% 2.	Load in “seamount.mat”, which contains x, y, and z coordinates of a topographic map of an undersea volcano.
% a.	Use the scatter3() function to plot filled circles at each of the x, y, and z coordinates of the volcano. 
% The color of each circle should correspond to its height (z coordinate)
% b.	Donbt forget to label your axes (including the z axis!)

% Load the data
load seamount.mat

% Create a 3D scatter plot
figure(2)
scatter3(x, y, z, 20, z, 'filled') % 20 is the marker size, 'filled' fills the circles

% Label the axes
xlabel('X Coordinate')
ylabel('Y Coordinate')
zlabel('Height (Z Coordinate)')

% Add a color bar to represent height values
colorbar

% Add title
title('3D Scatter Plot of Seamount Topography')

% Display the plot
figure(gcf);


%% 3.	Using the patient data in the “patients.xlsx” excel sheet, fit a linear model describing the diastolic blood pressure 
% as a function of age, height, weight, gender, and smoking status.
% a.	Using the plotAdded() function, plot the effect of being a smoker on diastolic blood pressure, with all other variables
% adjusted for
% b.	With the same data and model, perform an anova. You’ll have to specify the “gender” and “smoking” variables as 
% categorical factors – check the documentation for anova() and the name/value inputs section

% Load the data from the Excel file
data = readtable('patients.xlsx');
% Fit a linear model for diastolic blood pressure as a function of other variables
lm = fitlm(data, 'Diastolic ~ Age + Height + Weight + Gender + Smoker');

% Display the model summary
disp(lm);
% Plot the added variable plot for Smoker
figure(3)
plotAdded(lm, 'Smoker');
title('Effect of Smoking Status on Diastolic Blood Pressure');
xlabel('Smoking Status (adjusted)');
ylabel('Diastolic Blood Pressure (adjusted)');

% Specify Gender and Smoker as categorical variables
Gender = categorical(data.Gender);
Smoker = categorical(data.Smoker);
% Perform ANOVA on the fitted model
anovaResults = anova({data.Age, data.Height, data.Weight,Gender,Smoker},data.Diastolic);

% Display ANOVA results
disp(anovaResults);
%% 4.	The Fibonacci sequence is a sequence of numbers in which each entry is the sum of the preceding two entries – 
% e.g. [1, 1, 2, 3, 5, 8, 13, …].
% a. Write a function called fib() that takes in a number n > 0 which calculates the nth element of the Fibonacci sequence – 
% e.g. fib(1) = 1, fib(2) = 1. It should also return the sum of the 1st-nth elements as a second output
%function [fib_n, sum_fib] = fib(n)
% Check that the input is greater than 0
%
%function [fib_n, sum_fib] = fib(n)
%     % Check that the input is greater than 0
%     if n <= 0
%         error('Input must be a positive integer.');
%     end
% 
%     % Initialize the first two Fibonacci numbers
%     fib_sequence = [1, 1];
% 
%     % Compute the Fibonacci sequence up to the nth element
%     for i = 3:n
%         fib_sequence(i) = fib_sequence(i-1) + fib_sequence(i-2);
%     end
% 
%     % The nth Fibonacci number
%     fib_n = fib_sequence(n);
% 
%     % Sum of the first n Fibonacci numbers
%     sum_fib = sum(fib_sequence);
% end



%% #5 % Load data from the Excel file
data = readtable('indomethacin.xlsx');

% Get unique subjects from the data
subjects = unique(data.subject);

% Create a new figure for the plot
figure(4)
hold on; % Allows multiple lines on the same plot

% Define a color map to distinguish between subjects
colors = lines(length(subjects)); % 'lines' colormap for different colors

% Loop through each subject and plot their data
for i = 1:length(subjects)
    % Filter data for the current subject
    subjectData = data(data.subject == subjects(i), :);
    
    % Plot time vs. concentration for this subject
    plot(subjectData.time, subjectData.concentration, '-o', ...
        'DisplayName', ['subject ' num2str(subjects(i))], ...
        'Color', colors(i, :)); % Label and color each line
end

% Add labels and legend
xlabel('time');
ylabel('concentration');
title('Blood Concentration of Medicine Over Time for Each Subject');
legend('show'); % Show legend with subject labels
hold off;



