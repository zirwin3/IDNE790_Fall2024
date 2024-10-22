% ZI: great work! grade: 92

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

    % ZI: great work! remember that, since variablelabels is a string
    % array, you can just use the '==' operator instead of strcmp(). Also,
    % you can use the equality test (==) directly as the logical index into
    % hwydata (e.g. hwydata(:,variablelabels=='TrafficAccidents'))

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

    % ZI: looks good!

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

    % ZI: looks great, except we wanted the ratio to be accidents per 1000
    % residents, so the total population should be divided by 1000. 1/4 off
    % here, but looks great other than that

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

    % ZI: looks great, except the first line should be be plotted against
    % the population in thousands. Because its not scaled right, the 2nd
    % plot looks very squashed. 1/4 points off, but other than that, looks good!

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

    % ZI: great work!


