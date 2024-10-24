load("C:\Users\irwin\Box\Lab work\Irwin, Z\Courses\Assignments\data_for_assignment4.mat")

%% Which state had the highest number of accidents (and how many were there)?
[maxval, maxi] = max(hwydata(:, variablelabels=="TrafficAccidents"));
sprintf('%s has the highest number of accidents: %.03f', statelabels{maxi}, maxval)

%% Which state had the highest ratio of accidents to drivers (and what was the ratio)?


perdriverrate = hwydata(:, variablelabels=="TrafficAccidents")./hwydata(:, variablelabels=="LicensedDrivers_thousands_");
[maxval, maxi] = max(perdriverrate);
sprintf('%s has the highest per-driver traffic accidents: %.03f accidents per 1k registered drivers', statelabels{maxi}, maxval)


%% Which state has the highest ratio of accidents to population (and what was the ratio)?

figure; plot(hwydata(:, variablelabels=="TotalPopulation"), hwydata(:, variablelabels=="TrafficAccidents"), '.')

percaprate = hwydata(:, variablelabels=="TrafficAccidents")./(hwydata(:, variablelabels=="TotalPopulation")/1000);
[maxval, maxi] = max(percaprate);
sprintf('%s has the highest per-capita traffic accidents: %.03f accidents per 1k residents', statelabels{maxi}, maxval)

%% visualize the total accidents vs population and licensed drivers:

figure; 
plot(hwydata(:, variablelabels=="TotalPopulation")/1000, hwydata(:, variablelabels=="TrafficAccidents"), '.-')
hold on;
plot(hwydata(:, variablelabels=="LicensedDrivers_thousands_"), hwydata(:, variablelabels=="TrafficAccidents"), '.-')

legend('Population', 'Drivers')

%% Visualize state-level data using point size and color

lat = hwydata(:, variablelabels=="CentroidLatitude");
long = hwydata(:, variablelabels=="CentroidLongitude");
numacc = hwydata(:, variablelabels=="TrafficAccidents");

figure; scatter(long, lat, numacc, percaprate);