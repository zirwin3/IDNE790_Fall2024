load("data_for_assignment4.mat")

hwytable = table;
hwytable.State = strtrim(cellstr(statelabels));
hwytable = [hwytable, array2table(hwydata, 'VariableNames', variablelabels)]

    
[maxValues, maxIndices] = max(hwytable{:, "TrafficAccidents"}, [],"all")
hwytable = sortrows(hwytable,"TrafficAccidents","descend")
% California has the greatest number of traffic accidents with 4120.

%%
hwytable.Ratio = hwytable.TrafficAccidents./ hwytable.LicensedDrivers_thousands_;
hwytable = sortrows(hwytable,"Ratio","descend")
% Mississippi - 0.47468

%%
hwytable.totalpop = hwytable.TotalPopulation / 1000;

hwytable.Ratio = hwytable.TrafficAccidents./ hwytable.totalpop
hwytable = sortrows(hwytable,"Ratio","descend")
% Wyoming - 493.78

%% 
figure;
plot(hwytable.totalpop, hwytable.TrafficAccidents, '.')
hold on;

plot(hwytable.LicensedDrivers_thousands_, hwytable.TrafficAccidents, '.')
xlabel('Population / Drivers'); 
ylabel('Number of Traffic Accidents'); 
title('Number of Traffic Accidents vs Population and Drivers'); 
legend('Traffic Accidents vs Population', 'Traffic Accidents vs Drivers')
hold off
%%
hwytable.accRatio = hwytable.TrafficAccidents ./ hwytable.TotalPopulation

figure;
scatter(hwytable.CentroidLongitude, hwytable.CentroidLatitude, ...
        hwytable.TrafficAccidents, hwytable.accRatio, 'filled')
xlabel('Longitude');
ylabel('Latitude');
title('Accident Distribution Ratio to Population')
colormap('cool'); 
colorbar;