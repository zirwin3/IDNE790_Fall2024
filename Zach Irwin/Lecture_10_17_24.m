%% load in data:

load("C:\Users\irwin\Box\IDNE790_Fall2024\Assignments\data_for_assignment4.mat")

%% convert data to a table:

% datatable = table(statelabels, hwydata(:, 1), hwydata(:, 2), 'VariableNames', ["state", variablelabels(1:2)]);
% 
% datatable = array2table(hwydata, 'VariableNames', variablelabels);
% datatable{:, end+1} = statelabels;
% datatable.Properties.VariableNames(end) = "state";

datatable = array2table(hwydata, 'VariableNames', variablelabels);
datatable = addvars(datatable, statelabels, 'Before', 1);

%% which state has the highest number of accidents?

[maxaccidents, idx] = max(hwydata(:,variablelabels == "TrafficAccidents"));
statelabels(idx)

[maxaccidents, idx] = max(datatable.TrafficAccidents);
statelabels(idx)


%% which state has the highest ratio of accidents to drivers?

[maxratio, idx] = max(hwydata(:,variablelabels == "TrafficAccidents")./hwydata(:,variablelabels == "LicensedDrivers_thousands_"));
statelabels(idx)

[maxratio, idx] = max(datatable.TrafficAccidents ./ datatable.LicensedDrivers_thousands_);
statelabels(idx)

%%  which state has the highest ratio of accidents to residents (in thousands)?

[maxratiopop, idx] = max(hwydata(:,variablelabels == "TrafficAccidents")./ (hwydata(:,variablelabels == "TotalPopulation")/1000) )
statelabels(idx)

%% make a plot!

figure;

plot(datatable.TotalPopulation, datatable.TrafficAccidents, 'o');
hold on;
p = plot(datatable.LicensedDrivers_thousands_, datatable.TrafficAccidents, '.', 'MarkerSize', 15);

ylabel('Traffic Accidents');
xlabel('Thousands of residents or drivers')
title('Traffic accidents vs population or registered drivers');
legend('Population', 'Drivers');

hold off;

%% make a scatter plot!

figure;

scatter(datatable.CentroidLongitude, datatable.CentroidLatitude, datatable.TrafficAccidents, datatable.TrafficAccidents./(datatable.TotalPopulation/1000));

