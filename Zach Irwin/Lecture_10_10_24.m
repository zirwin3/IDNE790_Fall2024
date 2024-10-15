load('carbig.mat');


model = string(Model);
make = strtrim(string(Mfg));
origin = strtrim(string(Origin));

model = strtrim(strrep(model, make, ' '));

% for i = 1:length(model)
%     model(i) = strrep(model(i), make(i), ' ');
% end

%%

data = table(make, model, Model_Year, Cylinders, Acceleration, Displacement, Weight, MPG);
data.Properties.VariableNames = lower(data.Properties.VariableNames);

writetable(data, 'carbig_table.xlsx');


%%

clear
data = readtable('carbig_table.xlsx', 'TextType', 'string');


%%

figure;
plot(data.model_year, data.mpg, '.');

years = unique(data.model_year); % 70:82
avg_mpg = zeros(1, length(years));
for i = 1:length(years)
    idx = data.model_year == years(i);
    avg_mpg(i) = mean(data.mpg(idx), 'omitnan');
end

hold on;
plot(years, avg_mpg, '.-');

%%

linfit = fitlm(data, 'mpg ~ model_year');
figure; plot(linfit);


%%

fit_mpg = -69.556 + 1.2244*years;
hold on;
plot(years, fit_mpg);

%%

factorfit = fitlm(data, 'mpg ~ model_year + cylinders + weight + displacement')

%%

vars = ["cylinders", "displacement", "weight"];
varcorr = corr(data{:, vars});

figure;
h = heatmap(vars, vars, varcorr);
h.Colormap = parula;

%%

% factorfit = fitlm(data, 'mpg ~ model_year + cylindweight')
