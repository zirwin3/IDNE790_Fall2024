% ZI: Great work! grade: 100

load("data_for_assignment4.mat")

hwytable = table;
hwytable.State = strtrim(cellstr(statelabels));
hwytable = [hwytable, array2table(hwydata, 'VariableNames', variablelabels)]

    
[maxValues, maxIndices] = max(hwytable{:, "TrafficAccidents"}, [],"all")
hwytable = sortrows(hwytable,"TrafficAccidents","descend")
% California has the greatest number of traffic accidents with 4120.

    % ZI: great! you can get the state without sorting by using the index
    % output from the 'max' function - maxstate =
    % hwytable.State(maxIndices), but this works too if you don't mind
    % doing things a bit more manually.

%%
hwytable.Ratio = hwytable.TrafficAccidents./ hwytable.LicensedDrivers_thousands_;
hwytable = sortrows(hwytable,"Ratio","descend")
% Mississippi - 0.47468

    % ZI: great! again, if you don't want to do it manually, you can use
    % the max function and get the corresponding state index, but this
    % works too


%%
hwytable.totalpop = hwytable.TotalPopulation / 1000;

hwytable.Ratio = hwytable.TrafficAccidents./ hwytable.totalpop
hwytable = sortrows(hwytable,"Ratio","descend")
% Wyoming - 493.78

    % ZI: Yes, except you accidentally grabbed the total population number
    % instead of the ratio - one reason why doing things programmatically
    % (rather than manually) can be a good idea

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

    % ZI: Nice! You don't necessarily have to do 'hold off' at the end,
    % since you'll most likely just create a new figure anyway, but it
    % doesn't hurt anything

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

    % ZI: Looks great, I like the color scheme! The ratio was supposed to
    % be accidents vs population in thousands, but not a big deal