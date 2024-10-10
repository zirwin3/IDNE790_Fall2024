%% 1.	Load in the “data_for_assignment4.mat” file
load data_for_assignment4.mat
%% 2.	Which state had the highest number of accidents (“TrafficAccidents”), and how many were there?
% California, 4120

% Convert hwydata into a table with column headers
hwy_table = array2table(hwydata, 'VariableNames', variable_labels);

% Add state names as the first column of the table

hwy_table =addvars(hwy_table, state_names, 'Before', 1, 'NewVariableNames', 'State');

% Find the maximum number of accidents
[max_accidents, max_idx] = max(hwy_table.TrafficAccidents);  % 'Accidents' is the column name

% Find the state that corresponds to the maximum accidents
state_with_max_accidents = hwy_table.State(max_idx);

% Display the result
disp(['State with highest accidents: ' state_with_max_accidents]);
disp(['Number of accidents: ' num2str(max_accidents)]);
%% 3.	Which state had the highest ratio of accidents to total drivers (“LicensedDrivers_thousands_”), 
% and what was the ratio? Mississippi, 0.47468
% Calculate the ratio of accidents to total drivers (per thousand drivers)
accidents_to_drivers_ratio = hwy_table.TrafficAccidents ./ hwy_table.LicensedDrivers_thousands_;
% Find the state with the highest ratio
[max_ratio, max_idx] = max(accidents_to_drivers_ratio);
% Find the state that corresponds to the highest ratio
state_with_max_ratio = hwy_table.State(max_idx);

% Display the results
disp(['State with the highest accidents to drivers ratio: ' state_with_max_ratio]);
disp(['Ratio: ' num2str(max_ratio)]);

%% 4.	Which state had the highest ratio of accidents to total population (“TotalPopulation”) in thousands 
% (i.e. number of accidents per 1k residents), and what was the ratio?
% Wyoming, 0.00033213
% Calculate the ratio of accidents to total population (per thousand drivers)
accidents_to_population_ratio = hwy_table.TrafficAccidents ./ hwy_table.TotalPopulation;
%Find the state with the highest ratio
[max_ratio, max_idx]=max(accidents_to_population_ratio);
% Find the state that corresponds to the highest ratio
state_with_max_ratio = hwy_table.State(max_idx);
% Display the results
disp(['State with the highest accidents to populagtion ratio: ' state_with_max_ratio]);
disp(['Ratio: ' num2str(max_ratio)]);

% figure;
% plot(accidents_to_population_ratio, '-x', 'LineWidth', 2);  % Plot with line and x markers
% title('Accidents to Population Ratio by State');
% xlabel('State');
% ylabel('Accidents per 1,000 Drivers');
% grid on;
% % Customize x-axis labels with state names
% xticks(1:length(state_names));  % Set x-ticks to the indices of the states
% xticklabels(hwy_table.State);   % Use the state names as x-axis labels
% xtickangle(45);  % Rotate the x-axis labels for better readability
%% 5.	Visualize the data using the plot() function in the following way
% a.	Plot the number of accidents (y-axis) vs the total population in thousands (x-axis)
% b.	On the same figure, plot the number of accidents vs the number of drivers
% c.	Add axis labels, a title, and a legend (check the “legend()” function)
figure;

% Plot the first data set: Accidents-to-drivers ratio
plot(accidents_to_drivers_ratio, '-o', 'LineWidth', 2, 'DisplayName', 'Accidents/Drivers Ratio');
hold on;  % Hold the current plot to add more plots

% Plot the second data set: Number of accidents
plot(hwy_table.TrafficAccidents, '--x', 'LineWidth', 2, 'DisplayName', 'Number of Accidents');

% Customize the plot
title('Highway Data by State');
xlabel('State');
ylabel('Value');
grid on;

% Customize x-axis labels with state names
xticks(1:length(state_names));  % Set x-ticks to the indices of the states
xticklabels(hwy_table.State);   % Use the state names as x-axis labels
xtickangle(45);  % Rotate the x-axis labels for better readability

% Add a legend
legend show;  % Display the legend with automatic labels from 'DisplayName'

% Release the hold so further plots don't overlay
hold off;
%% 6.	Visualize the data using the scatter() function (look at the documentation!) in the following way:
% a.	Place a marker at the latitude and longitude of each state (“CentroidLongitude” and “CentroidLatitude”)
% i.	Hint: it should look vaguely like the United States
% b.	The size of the marker should represent the total number of accidents in that state
% c.	The color of the marker should represent the ratio of accidents to population
% d.	Add axis labels and a title

% Plot the data using scatter()
figure;
scatter(hwy_table.CentroidLongitude, hwy_table.CentroidLatitude, ...
    hwy_table.TrafficAccidents / 10, ...          % Marker size represents number of accidents
    accidents_to_population_ratio, ...    % Marker color represents the ratio of accidents to population
    'filled');                            % Filled markers

% Customize the plot
colorbar;  % Add a color bar to represent the ratio of accidents to population
title('Accidents Across US States');
xlabel('Longitude');
ylabel('Latitude');

% Add grid and display it
grid on;
