%% 1
x = normrnd(30, 10, 1, 10000);
figure; h = histogram(x);
hold on;
h2 = histogram(normrnd(0, 20, 1, 1000));
%%
% h.BinWidth = h2.BinWidth;
h.FaceColor = [0, 1, 0];

%% 2

load('seamount.mat')
figure; s = scatter3(x, y, z, [], z, 'filled');
xlabel('x');
ylabel('y');
zlabel('z');


%% 3

% load('patients.mat');
t = readtable("patients.xlsx");
% t = table(Age, Height, Weight, Gender, Smoker, Diastolic, Systolic);
mdl = fitlm(t, 'Diastolic ~ Age + Height + Weight + Smoker + Gender')

figure; mdl.plotAdded('Smoker');

mdl_anova = anova(t, 'Diastolic ~ Age + Height + Weight + Smoker + Gender', 'CategoricalFactors',["Smoker", "Gender"])

%% 4

% See the fib() function

%% 5

% data = readtable("indomethacin.xlsx");
% 
% time = data.time(data.subject == 1);
% conc = reshape(data.concentration, length(time), length(unique(data.subject)));

subs = unique(data.subject);

timepoints = unique(data.time);
conc = nan(length(timepoints), length(subs));

for i = 1:length(subs)
    subdata = data(data.subject == subs(i),:);
    for j = 1:length(timepoints)
        
        c = subdata.concentration(subdata.time == timepoints(j));
        if (isempty(c))
            continue;
        else
            conc(j , i) = c;
        end
    end
end
%%
figure;
p = plot(time, conc);
% hold on; errorbar(time, mean(conc, 2), std(conc, [], 2), 'LineWidth', 1.5, 'Color', 'k');
hold on; e = errorbar(time, mean(conc, 2, 'omitnan'), std(conc, [], 2, 'omitnan'));
e.LineWidth = 1.5;
e.Color = 'k';