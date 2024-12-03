%% Load datasets

Brain = readtable("Brain Updated Gating Summary Amended.xlsx");
Meninges = readtable("Meninges Updated Gating Summary Amended.xlsx");
Spleen = readtable("Spleen Updated Gating Summary Amended.xlsx");

%% Organize dataset by pulling columns of interest

data_brain = Brain(:, [2, 31:47]);
data_meninges = Meninges(:, [2, 31:45]);
data_spleen = Spleen(:, [2, 31:45]);

%% Change the titles of the groups

data_brain.x___ = strrep(data_brain.x___, 'Adol. PIC Brain F', 'P56 PIC F');
data_brain.x___ = strrep(data_brain.x___, 'Adol. PIC Brain M', 'P56 PIC M');
data_brain.x___ = strrep(data_brain.x___, 'Adol. Vehicle Brain F', 'P56 Vehicle F');
data_brain.x___ = strrep(data_brain.x___, 'Adol. Vehicle Brain M', 'P56 Vehicle M');
data_brain.x___ = strrep(data_brain.x___, 'Adol. WT Brain F', 'P56 WT F');
data_brain.x___ = strrep(data_brain.x___, 'Adol. WT Brain M', 'P56 WT M');
data_brain.x___ = strrep(data_brain.x___, 'P14 PIC Brain F', 'P14 PIC F');
data_brain.x___ = strrep(data_brain.x___, 'P14 PIC Brain M', 'P14 PIC M');
data_brain.x___ = strrep(data_brain.x___, 'P14 Vehicle Brain F', 'P14 Vehicle F');
data_brain.x___ = strrep(data_brain.x___, 'P14 Vehicle Brain M', 'P14 Vehicle M');
data_brain.x___ = strrep(data_brain.x___, 'P7 PIC Brain F', 'P7 PIC F');
data_brain.x___ = strrep(data_brain.x___, 'P7 PIC Brain M', 'P7 PIC M');
data_brain.x___ = strrep(data_brain.x___, 'P7 Vehicle Brain F', 'P7 Vehicle F');
data_brain.x___ = strrep(data_brain.x___, 'P7 Vehicle Brain M', 'P7 Vehicle M');

data_meninges.x___1 = strrep(data_meninges.x___1, 'Adol. PIC Meninges F', 'P56 PIC F');
data_meninges.x___1 = strrep(data_meninges.x___1, 'Adol. PIC Meninges M', 'P56 PIC M');
data_meninges.x___1 = strrep(data_meninges.x___1, 'Adol. Vehicle Meninges F', 'P56 Vehicle F');
data_meninges.x___1 = strrep(data_meninges.x___1, 'Adol. Vehicle Meninges M', 'P56 Vehicle M');
data_meninges.x___1 = strrep(data_meninges.x___1, 'Adol. WT Meninges F', 'P56 WT F');
data_meninges.x___1 = strrep(data_meninges.x___1, 'Adol. WT Meninges M', 'P56 WT M');
data_meninges.x___1 = strrep(data_meninges.x___1, 'P14 PIC Meninges F', 'P14 PIC F');
data_meninges.x___1 = strrep(data_meninges.x___1, 'P14 PIC Meninges M', 'P14 PIC M');
data_meninges.x___1 = strrep(data_meninges.x___1, 'P14 Vehicle Meninges F', 'P14 Vehicle F');
data_meninges.x___1 = strrep(data_meninges.x___1, 'P14 Vehicle Meninges M', 'P14 Vehicle M');
data_meninges.x___1 = strrep(data_meninges.x___1, 'P7 PIC Meninges F', 'P7 PIC F');
data_meninges.x___1 = strrep(data_meninges.x___1, 'P7 PIC Meninges M', 'P7 PIC M');
data_meninges.x___1 = strrep(data_meninges.x___1, 'P7 Vehicle Meninges F', 'P7 Vehicle F');
data_meninges.x___1 = strrep(data_meninges.x___1, 'P7 Vehicle Meninges M', 'P7 Vehicle M');

data_spleen.x___1 = strrep(data_spleen.x___1, 'Adol. PIC Spleen F', 'P56 PIC F');
data_spleen.x___1 = strrep(data_spleen.x___1, 'Adol. PIC Spleen M', 'P56 PIC M');
data_spleen.x___1 = strrep(data_spleen.x___1, 'Adol. Vehicle Spleen F', 'P56 Vehicle F');
data_spleen.x___1 = strrep(data_spleen.x___1, 'Adol. Vehicle Spleen M', 'P56 Vehicle M');
data_spleen.x___1 = strrep(data_spleen.x___1, 'Adol. WT Spleen F', 'P56 WT F');
data_spleen.x___1 = strrep(data_spleen.x___1, 'Adol. WT Spleen M', 'P56 WT M');
data_spleen.x___1 = strrep(data_spleen.x___1, 'P14 PIC Spleen F', 'P14 PIC F');
data_spleen.x___1 = strrep(data_spleen.x___1, 'P14 PIC Spleen M', 'P14 PIC M');
data_spleen.x___1 = strrep(data_spleen.x___1, 'P14 Vehicle Spleen F', 'P14 Vehicle F');
data_spleen.x___1 = strrep(data_spleen.x___1, 'P14 Vehicle Spleen M', 'P14 Vehicle M');
data_spleen.x___1 = strrep(data_spleen.x___1, 'P7 PIC Spleen F', 'P7 PIC F');
data_spleen.x___1 = strrep(data_spleen.x___1, 'P7 PIC Spleen M', 'P7 PIC M');
data_spleen.x___1 = strrep(data_spleen.x___1, 'P7 Vehicle Spleen F', 'P7 Vehicle F');
data_spleen.x___1 = strrep(data_spleen.x___1, 'P7 Vehicle Spleen M', 'P7 Vehicle M');

%% Convert groups to categorical data 

data_brain = convertvars(data_brain,["x___"],"categorical");
data_meninges = convertvars(data_meninges,["x___1"],"categorical");
data_spleen = convertvars(data_spleen,["x___1"],"categorical");


%% Calculate the mean and std dev for each cell type per group

mean_brain = groupsummary(data_brain,"x___","mean",[2:18]);
mean_meninges = groupsummary(data_meninges,"x___1","mean",[2:16]);
mean_spleen = groupsummary(data_spleen,"x___1","mean",[2:16]);

std_brain = groupsummary(data_brain,"x___","std",[2:18]);
std_meninges = groupsummary(data_meninges,"x___1","std",[2:16]);
std_spleen = groupsummary(data_spleen,"x___1","std",[2:16]);

%% Create bar plots of percentages of immune cells per group for brain samples

figure;
nbrain = size(mean_brain, 2)-2;
tiledlayout(3, 5);
for i = 3:nbrain;
        nexttile;
    brain_bar = bar(mean_brain{1:14, i}, 'grouped', 'FaceColor', 'flat');
    xticklabels({'P14 PIC F','P14 PIC M','P14 Vehicle F','P14 Vehicle M','P56 PIC F','P56 PIC M','P56 Vehicle F','P56 Vehicle M','P56 WT F','P56 WT M','P7 PIC F','P7 PIC M','P7 Vehicle F','P7 Vehicle M'});
    ylabel('Percent','FontSize', 12)
    title(mean_brain.Properties.VariableNames{i})
end

%% Create bar plots of percentages of immune cells per group for meninges samples

figure;
nmeninges = size(mean_meninges, 2)-2;
tiledlayout(3, 5);
for i = 3:nmeninges;
        nexttile;
    meninges_bar = bar(mean_meninges{1:14, i}, 'grouped', 'FaceColor', 'flat');
    xticklabels({'P14 PIC F','P14 PIC M','P14 Vehicle F','P14 Vehicle M','P56 PIC F','P56 PIC M','P56 Vehicle F','P56 Vehicle M','P56 WT F','P56 WT M','P7 PIC F','P7 PIC M','P7 Vehicle F','P7 Vehicle M'});
    ylabel('Percent','FontSize', 12)
    title(mean_meninges.Properties.VariableNames{i})
end

%% Create bar plots of percentages of immune cells per group for spleen samples

figure;
nspleen = size(mean_spleen, 2)-2;
tiledlayout(3, 5);
for i = 3:nspleen;
        nexttile;
    spleen_bar = bar(mean_spleen{1:14, i}, 'grouped', 'FaceColor', 'flat');
    xticklabels({'P14 PIC F','P14 PIC M','P14 Vehicle F','P14 Vehicle M','P56 PIC F','P56 PIC M','P56 Vehicle F','P56 Vehicle M','P56 WT F','P56 WT M','P7 PIC F','P7 PIC M','P7 Vehicle F','P7 Vehicle M'});
    ylabel('Percent','FontSize', 12)
    title(mean_spleen.Properties.VariableNames{i})
end