%% Control group
control1 = readtable('control1.csv');
control2 = readtable('control2.csv');
control3 = readtable('control3.csv');
control4 = readtable('control4.csv');
control5 = readtable('control5.csv');
control6 = readtable('control6.csv');
control7 = readtable('control7.csv');

% Assuming each control table has a column named 'OT'

% Calculate the mean for each control group
mean_control1 = mean(control1.OT, 'omitnan'); % Omit NaN values
mean_control2 = mean(control2.OT, 'omitnan');
mean_control3 = mean(control3.OT, 'omitnan');
mean_control4 = mean(control4.OT, 'omitnan');
mean_control5 = mean(control5.OT, 'omitnan');
mean_control6 = mean(control6.OT, 'omitnan');
mean_control7 = mean(control7.OT, 'omitnan');

% Store the averages in an array for convenience
control_means = [mean_control1, mean_control2, mean_control3, mean_control4, ...
                 mean_control5, mean_control6, mean_control7];

% Display results
disp('Average OT for each control group:');
disp(control_means);

%% Oxa group
oxa1 = readtable('oxa1.csv');
oxa2 = readtable('oxa2.csv');
oxa3 = readtable('oxa3.csv');
oxa4 = readtable('oxa4.csv');
oxa5 = readtable('oxa5.csv');
oxa6 = readtable('oxa6.csv');
oxa7 = readtable('oxa7.csv');

% Assuming each oxa table has a column named 'OT'

% Calculate the mean for each oxa group
mean_oxa1 = mean(oxa1.OT, 'omitnan'); % Omit NaN values
mean_oxa2 = mean(oxa2.OT, 'omitnan');
mean_oxa3 = mean(oxa3.OT, 'omitnan');
mean_oxa4 = mean(oxa4.OT, 'omitnan');
mean_oxa5 = mean(oxa5.OT, 'omitnan');
mean_oxa6 = mean(oxa6.OT, 'omitnan');
mean_oxa7 = mean(oxa7.OT, 'omitnan');

% Store the averages in an array for convenience
oxa_means = [mean_oxa1, mean_oxa2, mean_oxa3, mean_oxa4, ...
             mean_oxa5, mean_oxa6, mean_oxa7];

% Display results
disp('Average OT for each oxa group:');
disp(oxa_means);
%% Histogram between control vs oxa group
% Extract OT data
control2_OT = control2.OT;
oxa4_OT = oxa4.OT;
% Create histogram
figure;
hold on;

% Histogram for Control2
histogram(control2_OT, 'BinWidth', 0.1, 'FaceColor', 'b');

% Histogram for Oxa7
histogram(oxa4_OT, 'BinWidth', 0.1, 'FaceColor', 'r');

% Customize the plot
title('Histogram Comparison of OT: Control2 vs. Oxa4');
xlabel('OT Values');
ylabel('Frequency');
legend('Control', 'Oxa'); % Show legend
grid on;

% Set axis limits if required
xlim([0 4]); % Adjust x-axis range as needed

%% Time vs OT for Control2 and Oxa4
% Extract time and OT data
control2_time = control2.time;
control2_OT = control2.OT;

oxa4_time = oxa4.time;
oxa4_OT = oxa4.OT;

% Create a figure for Time vs OT
figure;
hold on;

% Plot for Control2
plot(control2_time, control2_OT, 'b-', 'LineWidth', 1.5, 'DisplayName', 'Control2');

% Plot for Oxa4
plot(oxa4_time, oxa4_OT, 'r-', 'LineWidth', 1.5, 'DisplayName', 'Oxa4');

% Customize the plot
title('Time vs. OT: Control vs. Oxa');
xlabel('Time (s)');
ylabel('OT Values');
legend('Control', 'Oxa'); % Show legend
grid on;

% Set axis limits if required
xlim([min(control2_time), max(control2_time)]); % Adjust x-axis range
ylim([0 4]); % Adjust y-axis range as needed

hold off;

%% comparison
% Perform t-test
[h, p] = ttest2(control_means, oxa_means); % Two-sample t-test

% Create bar graph
figure;
hold on;

% Bar values
bar(1, mean(control_means), 'FaceColor', 'b'); % Blue for control
bar(2, mean(oxa_means), 'FaceColor', 'r');    % Red for oxa

% Error bars (Standard deviation)
control_std = std(control_means);
oxa_std = std(oxa_means);
errorbar(1, mean(control_means), control_std, 'k', 'LineWidth', 1.5);
errorbar(2, mean(oxa_means), oxa_std, 'k', 'LineWidth', 1.5);

% Add significance star if p < 0.05
if p < 0.05
    sig_y = max(mean(control_means) + control_std, mean(oxa_means) + oxa_std) + 0.1;
    plot([1, 2], [sig_y, sig_y], 'k-', 'LineWidth', 1.5); % Line between bars
    text(1.5, sig_y + 0.05, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
end

% Customize plot
xticks([1 2]);
xticklabels({'Control', 'Oxa'});
ylabel('Mean OT');
title('Comparison of OT Between Control and Oxa Groups');
ylim([0, max([mean(control_means) + control_std, mean(oxa_means) + oxa_std]) + 0.5]);

% Display p-value
disp(['T-test p-value: ', num2str(p)]);


%%
% Perform unpaired t-test
[h, p] = ttest2(control_means, oxa_means); % Two-sample t-test

% Create a bar graph
figure;
hold on;

% Bar values
bar(1, mean(control_means), 'FaceColor', 'b'); % Blue for Control
bar(2, mean(oxa_means), 'FaceColor', 'r');    % Red for Oxa

% Error bars (Standard deviation)
control_std = std(control_means);
oxa_std = std(oxa_means);
errorbar(1, mean(control_means), control_std, 'k', 'LineWidth', 1.5, 'CapSize', 10);
errorbar(2, mean(oxa_means), oxa_std, 'k', 'LineWidth', 1.5, 'CapSize', 10);

% Add individual data points with white fill
scatter(ones(size(control_means)), control_means, 50, 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'w', 'LineWidth', 1.5, 'jitter', 'on', 'jitterAmount', 0.15); % Control points
scatter(2 * ones(size(oxa_means)), oxa_means, 50, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'w', 'LineWidth', 1.5, 'jitter', 'on', 'jitterAmount', 0.15);    % Oxa points

% Add significance star if p < 0.05
if p < 0.05
    sig_y = max(mean(control_means) + control_std, mean(oxa_means) + oxa_std) + 0.1;
    plot([1, 2], [sig_y, sig_y], 'k-', 'LineWidth', 1.5); % Line between bars
    text(1.5, sig_y + 0.05, '*', 'HorizontalAlignment', 'center', 'FontSize', 16); % Add star
end

% Customize plot
xticks([1 2]);
xticklabels({'Control', 'Oxa'});
ylabel('Mean OT');
title('Comparison of OT Between Control and Oxa Groups');
ylim([0, max([mean(control_means) + control_std, mean(oxa_means) + oxa_std]) + 0.5]);

% Display p-value in the command window
disp(['T-test p-value: ', num2str(p)]);

hold off;



