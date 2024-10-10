%% 1
load("data_for_assignment4.mat");

% Made table including data relevant to assignment
data = table(statelabels, hwydata(:,2), hwydata(:,3), hwydata(:,4), hwydata(:,5), hwydata(:,14), 'VariableNames', ["State","CentroidLongitude","CentroidLatitude","TrafficAccidents","LicensedDrivers_thousands_","TotalPopulation"]);
%% 2

[NumberOfAccidents,State2] = max(data.TrafficAccidents);
disp(data(State2,1));
disp(NumberOfAccidents);

% California had the highest number of accidents, 4120.

%% 3

data.accidents_drivers = (data.TrafficAccidents) ./ (data.LicensedDrivers_thousands_);
[Ratio3,State3] = max(data.accidents_drivers);
disp(data(State3,1));
disp(Ratio3);

% Mississippi had the highest ratio of accidents to total drivers, 0.4747.

%% 4
data.accidents_population = (data.TrafficAccidents) ./ ((data.TotalPopulation) ./ 1000);
[Ratio4,State4] = max(data.accidents_population);
disp(data(State4,1));
disp(Ratio4);

% Wyoming had the highest ratio of accidents to 1k residents, 0.3321.

%% 5

figure; plot((data.TotalPopulation ./ 1000), data.TrafficAccidents);
    hold on; plot (data.LicensedDrivers_thousands_, data.TrafficAccidents);
    xlabel('Thousands of people');
    ylabel('Number of Accidents');
    title('Accidents per State by Population');
    legend('Total Population', 'Licensed Drivers');

%% 6

x = data.CentroidLongitude;
y = data.CentroidLatitude;
sz = data.TrafficAccidents; 
c = data.accidents_population;
figure; scatter(x, y, sz, c);
    xlabel('State Longtitude');
    ylabel('State Latitude');
    title('Accidents per State Population by Location');