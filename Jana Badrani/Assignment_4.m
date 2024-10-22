%% Great work! grade: 96

%% Question 1 - Load Dataset

load("data_for_assignment4.mat")

%% Create data table from dataset

data = table(statelabels, hwydata(:,1),hwydata(:,2),hwydata(:,3),hwydata(:,4),hwydata(:,5),hwydata(:,6),hwydata(:,7),hwydata(:,8),hwydata(:,9),hwydata(:,10),hwydata(:,11),hwydata(:,12),hwydata(:,13),hwydata(:,14),hwydata(:,15),hwydata(:,16),hwydata(:,17), 'VariableNames', ["State", variablelabels]);

    % ZI: great! when you have a large number of columns to add, you can
    % use the "array2table" function to turn a matrix into a matrix. THen
    % you can add the statelabels column

%% Question 2

[Q2a, Q2b] = max(data.TrafficAccidents)

Q2 = data.State(Q2b)

% California had the greatest number of accidents (4120 accidents).

    % ZI: great! the only thing I might suggest is using more informative
    % variable names, just so things don't get too confusing!

%% Question 3

data.accidents2totaldrivers = data.TrafficAccidents./data.LicensedDrivers_thousands_;

[Q3a, Q3b] = max (data.accidents2totaldrivers)

Q3 = data.State(Q3b)

% Mississippi had the highest ratio of accidents to total drivers (0.4747).

    % ZI: great!

%% Question 4

data.totalPopulationthousands = data.TotalPopulation./1000;
data.accidents2thousandpopulation = data.TrafficAccidents./data.totalPopulationthousands;

[Q4a, Q4b] = max(data.accidents2thousandpopulation)

Q4 = data.State(Q4b)

% Wyoming had the highest ratio of accidents to total population in thousands (0.3321).

    % ZI: great!

%% Question 5

plot(data.totalPopulationthousands, data.TrafficAccidents);
hold on
plot(data.LicensedDrivers_thousands_, data.TrafficAccidents)

xlabel("Number of Individuals");
ylabel("Number of Accidents");
title ("Plot 1: Total Number of Accidents relative to population and drivers");
legend("Total Population", "Total Drivers");

    % ZI: looks great! if the data don't follow a specific order on the
    % x-axis (so the points are placed randomly and the lines between them
    % look real crazy), it can be helpful to just plot them as points
    % without the lines - plot(data, '.')

%% Question 6

c = linspace(min(data.accidents2thousandpopulation), max(data.accidents2thousandpopulation),length(data.CentroidLongitude));
scatter(data.CentroidLongitude, data.CentroidLatitude, data.TrafficAccidents, c)
colorbar
xlabel("Longitude")
ylabel("Latitude")
title("Accidents in the US")

    % ZI: All great except the color doesn't quite line up. You created a
    % linear progression of colors based on the per-capita acident rate, but 
    % that doesn't match the actual rate for each state. You can just do
    % the same thing you did for the number of accidents. A quarter point
    % off here, but looks great other than that!



























