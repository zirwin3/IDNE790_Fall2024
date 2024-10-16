load("fisheriris.mat");

meas_vars = ["sepal_length", "sepal_width", "petal_length", "petal_width"];
species = string(species);

%% Put data into a table

data = table(meas(:,1), meas(:,2), meas(:,3), meas(:,4), species, 'VariableNames', [meas_vars, "species_var"]);

%% Plot variables against each other:
unique_species = unique(species);
var_labels = strrep(meas_vars, "_", " ");

figure;
tiledlayout(length(meas_vars), length(meas_vars)); % size(meas,2)

for i = 1:length(meas_vars)
    for j = 1:length(meas_vars)

        nexttile;

        if (i == j)
            continue;
        end

        plot(data{data.species_var == "setosa",i}, data{data.species_var == "setosa",j}, '.');
        hold on;
        plot(data{data.species_var == "versicolor",i}, data{data.species_var == "versicolor",j}, '.');
        plot(data{data.species_var == "virginica",i}, data{data.species_var == "virginica",j}, '.');
        
        xlabel(var_labels(i));
        ylabel(var_labels(j));
        
        if (i == length(meas_vars) && j == length(meas_vars)-1)
            legend(unique_species); % legend("setosa", "versicolor", "virginica")
        end
    end
end

%% Plot unique combinations of variables:

unique_combos = nchoosek(1:length(meas_vars), 2);

n_combos = size(unique_combos, 1);

figure;
% tiledlayout(n_combos/2 - 1, n_combos/2);
for i = 1:n_combos % 1:nchoosek(4, 2)

    nexttile();

    xvar = unique_combos(i, 1);
    yvar = unique_combos(i, 2);

    plot(data{data.species_var == "setosa",xvar}, data{data.species_var == "setosa",yvar}, '.');
    hold on;
    plot(data{data.species_var == "versicolor",xvar}, data{data.species_var == "versicolor",yvar}, '.');
    plot(data{data.species_var == "virginica",xvar}, data{data.species_var == "virginica",yvar}, '.');

    xlabel(var_labels(xvar));
    ylabel(var_labels(yvar));

end
legend(unique_species);

%% Quantify species data in a box plot/box chart:

figure;
% boxchart(data{:, 1:4});

data_vec = reshape(data{:, 1:4}, [], 1); % or numel(A)

meas_labels = categorical(repelem(meas_vars, 150)');
species_labels = categorical(repmat(data.species_var, 4, 1));

b = boxchart(meas_labels, data_vec, 'GroupByColor', species_labels);
legend(unique_species);

%% DO some stats:

results = anova(data, "petal_length ~ species_var");
levelresults = multcompare(results)