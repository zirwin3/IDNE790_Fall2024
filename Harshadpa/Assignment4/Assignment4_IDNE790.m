
%% Create a script with the following components*
% Note1: bolded items ('hwydata', 'statelabels', 'variablelabels') are variables that should be present in the MATLAB workspace after running the script
% Note2: for components that have a question associated with them, create a comment containing your answer after the line(s) of code that got the answer (for example, x = 7^2 + 2; # the data type is ‘double’)

%% 1.	Load in the “data_for_assignment4.mat” file
% a.	It should contain 3 variables:
% i.	hwydata: a matrix of highway accident data for each state plus DC
% ii.	statelabels: a vector of strings that identify the state for each row of hwydata
% iii.	variablelabels: a vector of strings that identify the data in each column of hwydata

load('data_for_assignment4.mat');

whos('hwydata', 'statelabels', 'variablelabels');

%% 2.	Which state had the highest number of accidents (“TrafficAccidents”), and how many were there?
% a.	Hint: the max() function can give you 2 outputs

accidents = hwydata(:, strcmp(variablelabels, 'TrafficAccidents'));
[maxAccidents, maxIndex] = max(accidents);
fprintf('The state with the highest accidents is %s with %d.\n', statelabels{maxIndex}, maxAccidents);


%% 3.	Which state had the highest ratio of accidents to total drivers (“LicensedDrivers_thousands_”), and what was the ratio?

drivers = hwydata(:, strcmp(variablelabels, 'LicensedDrivers_thousands_'));
[maxRatio, maxIndex] = max(accidents ./ drivers);
fprintf('Highest accidents/drivers ratio: %s (%.4f)\n', statelabels{maxIndex}, maxRatio);

%% 4 Which state had the highest ratio of accidents to total population (“TotalPopulation”) in thousands (i.e. number of accidents per 1k residents), and what was the ratio?

population = hwydata(:, strcmp(variablelabels, 'TotalPopulation')) / 1000;
[maxRatio, maxIndex] = max(accidents ./ population);
fprintf('Highest accidents per 1k residents: %s (%.4f)\n', statelabels{maxIndex}, maxRatio);


%% 5.	Visualize the data using the plot() function in the following way
% a.	Plot the number of accidents (y-axis) vs the total population in thousands (x-axis)
% b.	On the same figure, plot the number of accidents vs the number of drivers
% c.	Add axis labels, a title, and a legend (check the “legend()” function)

figure;
plot(population, accidents, 'b.', 'MarkerSize', 15);
hold on;
plot(drivers, accidents, 'r.', 'MarkerSize', 15);
xlabel('Population / Drivers');
ylabel('Number of Accidents');
title('Accidents vs Population and Drivers');
legend('Population', 'Drivers');

%% 6.	Visualize the data using the scatter() function (look at the documentation!) in the following way:
    % a.	Place a marker at the latitude and longitude of each state (“CentroidLongitude” and “CentroidLatitude”)
    % i.	Hint: it should look vaguely like the United States
    % b.	The size of the marker should represent the total number of accidents in that state
    % c.	The color of the marker should represent the ratio of accidents to population
    % d.	Add axis labels and a title

figure;
longitude = hwydata(:, strcmp(variablelabels, 'CentroidLongitude'));
latitude = hwydata(:, strcmp(variablelabels, 'CentroidLatitude'));

accidentPopulationRatio = accidents ./ population;

markerSizes = (accidents - min(accidents)) / (max(accidents) - min(accidents));
markerSizes = 20 + markerSizes * 480; % Scale to range 20-500

scatter(longitude, latitude, markerSizes, accidentPopulationRatio, 'filled');
xlabel('Longitude');
ylabel('Latitude');
title('Traffic accidents by state');

colorbar;
colormap('jet');

axis([min(longitude)-5 max(longitude)+5 min(latitude)-5 max(latitude)+5]);

for i = 1:length(statelabels)
    text(longitude(i), latitude(i), statelabels{i}, 'FontSize', 8);
end



