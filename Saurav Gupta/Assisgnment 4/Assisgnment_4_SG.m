%Assignment 4
% 1
load('data_for_assignment4.mat');

%% 2 
% To find 'TrafficAccidents' in variablelabels
trafficAccidentsIndex = find(strcmp(variablelabels, 'TrafficAccidents'));

% To get the TrafficAccidents column from hwydata
trafficAccidents = hwydata(:, trafficAccidentsIndex);

% To find the maximum number of accidents
[maxAccidents, stateIndex] = max(trafficAccidents);

 % To find the name of the state with the most accidents
stateWithMaxAccidents = statelabels(stateIndex);

%% 3

% To provide the index of 'TrafficAccidents' and 'LicensedDrivers_thousands_'
trafficAccidentsIndex = find(strcmp(variablelabels, 'TrafficAccidents'));
licensedDriversIndex = find(strcmp(variablelabels, 'LicensedDrivers_thousands_'));

% To extract from hwydata for
trafficAccidents = hwydata(:, trafficAccidentsIndex);
licensedDrivers = hwydata(:, licensedDriversIndex);

% To calculate the ratio of accidents to licensed drivers
accidentRatio = trafficAccidents ./ licensedDrivers;

% To find the maximum ratio and the index of the state
[maxRatio, stateIndex] = max(accidentRatio);

% To get the name of the state with the highest ratio
stateWithMaxRatio = statelabels(stateIndex);

%% 4

% 'TrafficAccidents' and 'TotalPopulation'
trafficAccidentsIndex = find(strcmp(variablelabels, 'TrafficAccidents'));
populationIndex = find(strcmp(variablelabels, 'TotalPopulation'));

% columns from hwydata
trafficAccidents = hwydata(:, trafficAccidentsIndex);
totalPopulation = hwydata(:, populationIndex);

% the ratio of accidents to total population
accidentToPopulationRatio = trafficAccidents ./ totalPopulation;

% the maximum ratio and the index of the state
[maxRatio, stateIndex] = max(accidentToPopulationRatio);

% the name of the state with the highest ratio
stateWithMaxRatio = statelabels(stateIndex);

%% 5

% the indices

licensedDriversIndex = find(strcmp(variablelabels, 'LicensedDrivers_thousands_'));

% Extract data for plotting
licensedDrivers = hwydata(:, licensedDriversIndex);

% Create the figure
% Plot 1: Traffic accidents vs Total population
plot(totalPopulation, trafficAccidents, 'o-', 'LineWidth', 2, 'MarkerSize', 6);
hold on;

% Plot 2: Traffic accidents vs Licensed drivers
plot(licensedDrivers, trafficAccidents, 's-', 'LineWidth', 2, 'MarkerSize', 6);

% Add axis labels
xlabel('Total Population (Thousands)');
ylabel('Number of Traffic Accidents');

% Add title
title('Traffic Accidents vs Total Population and Licensed Drivers');

% Add a legend
legend('Accidents vs Population', 'Accidents vs Licensed Drivers');

% Release the hold on the figure
hold off;

%% 6

% the indices
centroidLongitudeIndex = find(strcmp(variablelabels, 'CentroidLongitude'));
centroidLatitudeIndex = find(strcmp(variablelabels, 'CentroidLatitude'));

% Extract the data for plotting
centroidLongitude = hwydata(:, centroidLongitudeIndex);
centroidLatitude = hwydata(:, centroidLatitudeIndex);

% Calculate the ratio of accidents to population
accidentsPerPopulation = trafficAccidents ./ totalPopulation;


% Scatter plot: longitude vs latitude
scatter(centroidLongitude, centroidLatitude, trafficAccidents*0.1, accidentsPerPopulation, 'filled');

% Add axis labels
xlabel('Longitude');
ylabel('Latitude');

% Add title
title('Traffic Accidents Across States: Marker Size = Accidents, Color = Accidents/Population');

% Add colorbar to indicate the ratio (accidents per population)
colorbar;
ylabel(colorbar, 'Accidents per 1000 Residents');


