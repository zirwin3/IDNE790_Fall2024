% Read the CSV file into a table
control1 = readtable('control mice 2.csv');
%% 
% Extract the x and y coordinates into separate arrays
x1 = control1.x1(1:9001);
y1 = control1.y1(1:9001);
x2 = control1.x2(1:9001);
y2 = control1.y2(1:9001);
x3 = control1.x3(1:9001);
y3 = control1.y3(1:9001);
x4 = control1.x4(1:9001);
y4 = control1.y4(1:9001);
likelihood1 = control1.likelihood1(1:9001);
likelihood2 = control1.likelihood2(1:9001);
likelihood3 = control1.likelihood3(1:9001);
likelihood4 = control1.likelihood4(1:9001);
coords = control1.coords(1:9001);
%% Time table
% Define the total time and time step
total_time = 300;  % seconds
time_step = 1/30;  % seconds

% Create an array of time values from 0 to total_time with time_step increments
time = 0:time_step:total_time;
time = time';

%% Distance
% Calculate the Euclidean distance between each pair of points
distance1 = sqrt((x2 - x1).^2 + (y2 - y1).^2);
distance2 = sqrt((x3 - x4).^2 + (y3 - y4).^2);
OT = distance1*0.05;
%% Make a file

% Create the table
table = table(time, distance1, distance2, likelihood1, likelihood2, likelihood3, likelihood4, OT);
%% Sorting
% Identify rows where all likelihoods are >= 0.95
valid_rows = (table.likelihood1 >= 0.95) & ...
             (table.likelihood2 >= 0.95) & ...
             (table.likelihood3 >= 0.95) & ...
             (table.likelihood4 >= 0.95);

% Remove values in distance1, distance2, and OT where any likelihood < 0.95
table.distance1(~valid_rows) = NaN; % Replace invalid rows with NaN
table.distance2(~valid_rows) = NaN;
table.OT(~valid_rows) = NaN;

%% Identify and Remove Outliers using IQR
% Compute the IQR and bounds
Q1 = quantile(table.OT, 0.25); % First quartile
Q3 = quantile(table.OT, 0.75); % Third quartile
IQR = Q3 - Q1; % Interquartile range

% Define the lower and upper bounds
lower_bound = Q1 - 1.5 * IQR;
upper_bound = Q3 + 1.5 * IQR;

% Identify outliers
outliers = (table.OT < lower_bound) | (table.OT > upper_bound);

% Replace outliers in OT with NaN
table.OT(outliers) = NaN;

% Optional: Also remove corresponding rows in distance1 and distance2
table.distance1(outliers) = NaN;
table.distance2(outliers) = NaN;

% Display information about outliers
fprintf('Number of outliers detected: %d\n', sum(outliers));
disp('Bounds for OT without outliers:');
fprintf('Lower Bound: %.4f, Upper Bound: %.4f\n', lower_bound, upper_bound);

%% Display the modified table
disp('Modified Data Table:');
disp(table);
% Optional: Save the modified table to a new CSV file
writetable(table, 'control.csv');

%% make graph
% Create a histogram of OT
figure; % Create a new figure window
histogram(table.OT, 'BinWidth', 0.1, 'FaceColor', 'b'); % Adjust 'BinWidth' as needed
xlim([0 4]); % Set x-axis limits

% Add titles and labels
title('Histogram of OT in control group');
xlabel('OT Values');
ylabel('Frequency');

% Display the histogram
grid on; % Add a grid for better visualization

%% time graph

% Create a plot of Time vs. OT
figure; % Create a new figure window
plot(table.time, table.OT, 'b-', 'LineWidth', 1.5); % Line plot
ylim([0 3]); % Set x-axis limits
% Add titles and labels
title('Time vs. OT for control group');
xlabel('Time (s)');
ylabel('OT Values');

% Add grid and customize axes
grid on; % Add a grid for better visualization
xlim([min(table.time), max(table.time)]); % Set x-axis limits based on data
ylim([0 4]); % Set y-axis limits

%% to get average OT
average_OT = mean(table.OT, 'omitnan');

% Display the result
fprintf('The average of OT in control mice is: %.4f\n', average_OT);
