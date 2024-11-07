load('carsmall.mat')

Origin = strtrim(string(Origin));

data = table(MPG, Acceleration, Displacement, Horsepower, Weight, Origin);
data.OriginUSA = data.Origin == "USA";

%% multicollinearity - how correlated are the input variables?

r = corr(data{:, 2:end}, 'rows','pairwise')

%%

% datanorm = data;
% for i = 1:size(datanorm, 2)
%     datanorm{:, i} = normalize(datanorm{:, i});
% end
datanorm = normalize(data);

mdl = fitlm(datanorm, 'MPG ~ Acceleration + Weight')
figure; plot(mdl);

% figure; plot(mdl.Fitted, datanorm.MPG, '.')
% xlabel('Fitted MPG');
% ylabel('Actual MPG');
% hold on; plot([min(mdl.Fitted), max(mdl.Fitted)], [min(datanorm.MPG), max(datanorm.MPG)])

%% generalize linear model:

mdl = fitglm(data, 'OriginUSA ~ Acceleration + Weight', 'Distribution', 'Binomial');

figure; plot(data.Weight, data.OriginUSA, '.');
ax = gca;
ax.YLim = [-.2, 1.2];

weights = 1000:5000;
prob_usa = 1./(1 + exp(- (-6.4461 + 0.0026828*weights)));
hold on; plot(weights, prob_usa)
