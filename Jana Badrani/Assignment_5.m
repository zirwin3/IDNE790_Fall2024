% ZI: Great work! Just remember for loops, and you don't have to have data
% in a table to use the plot/scatter functions - sometimes a table is super
% useful, and sometimes it's just more work. Grade: 95

%% Question 1

Q1 = normrnd(30,10, 10000, 1);

%% Question 1A - histogram

histogram(Q1);

%% Question 1B - overlay histogram 2

Q1b = normrnd(0,20,10000,1);

histogram(Q1)
hold on
histogram(Q1b)

%% Question 1C - same bin width for this histograms

histogram(Q1, 'BinWidth', 5)
hold on
histogram(Q1b, 'BinWidth', 5)

%% Question 1D - change the color of histogram 1

histogram(Q1, 'BinWidth', 5, 'FaceColor', '#7E2F8E')
hold on
histogram(Q1b, 'BinWidth', 5)

    % ZI: Good work, although remember that you can change properties after
    % plotting using the objects returned by the histogram() function so
    % you don't have to replot everything. The only issue with the code at
    % the moment is that you don't create a new figure/turn off the hold
    % after each plot, so at the end we end up with 6 histograms on the
    % same axes... Of course, I didn't tell you NOT to have 6 histograms,
    % so no points off, but just remember to check the outputs

%% Question 2

load("seamount.mat");
Q2 = table(x, y, z);

%% Question 2A - plot coordinates

scatter3(Q2, "x", "y", "z", "filled", "ColorVariable","z")

%% Question 2B - label axes

scatter3(Q2, "x", "y", "z", "filled", "ColorVariable","z")
xlabel('x-coordinate')
ylabel('y-coordinate')
zlabel('height')

    % ZI: Looks great! Just remember to create a new figure every time you
    % plot so you don't accidentally plot onto an existing figure. 

%% Question 3

Q3 = readtable("patients.xlsx");

mdl = fitlm(Q3, 'Diastolic ~ Age + Height + Weight + Gender + Smoker');

%% Question 3A - plot the effect of being a smoker on DBP

plotAdded(mdl, 'Smoker')

%% Question 3B - ANOVA

Q3B = anova(Q3, 'Diastolic ~ Age + Height + Weight + Gender + Smoker', CategoricalFactors= ["Gender" "Smoker"]);

    % ZI: Great work!

%% Question 4 - fib function

[test1, test2] = fib(4)

    % ZI: Looks great, except the sum for n = 1 should be 1 instead of 2.
    % You just need to check the input at the last line to account for the
    % 2nd element in a. 1/4 off, but looks great otherwise

%% Question 5

Q5 = readtable("indomethacin.xlsx");

S1time = [Q5.time(Q5.subject == 1)];
S1conc = [Q5.concentration(Q5.subject == 1)];
S2time = [Q5.time(Q5.subject == 2)];
S2conc = [Q5.concentration(Q5.subject == 2)];
S3time = [Q5.time(Q5.subject == 3)];
S3conc = [Q5.concentration(Q5.subject == 3)];
S4time = [Q5.time(Q5.subject == 4)];
S4conc = [Q5.concentration(Q5.subject == 4)];
S5time = [Q5.time(Q5.subject == 5)];
S5conc = [Q5.concentration(Q5.subject == 5)];
S6time = [Q5.time(Q5.subject == 6)];
S6conc = [Q5.concentration(Q5.subject == 6)];

S1 = table(S1time, S1conc, 'VariableNames', ["time", "concentration"]);
S2 = table(S2time, S2conc, 'VariableNames', ["time", "concentration"]);
S3 = table(S3time, S3conc, 'VariableNames', ["time", "concentration"]);
S4 = table(S4time, S4conc, 'VariableNames', ["time", "concentration"]);
S5 = table(S5time, S5conc, 'VariableNames', ["time", "concentration"]);
S6 = table(S6time, S6conc, 'VariableNames', ["time", "concentration"]);

plot(S1, "time", "concentration")
hold on
plot(S2, "time", "concentration")
plot(S3, "time", "concentration")
plot(S4, "time", "concentration")
plot(S5, "time", "concentration")
plot(S6, "time", "concentration")
legend("Subject 1", "Subject 2", "Subject 3", "Subject 4", "Subject 5", "Subject 6")

%% Question 5A - plot mean concentration at each time

times = unique(Q5.time)
T1 = [Q5.concentration(Q5.time == 0.2500)];
T2 = [Q5.concentration(Q5.time == 0.5000)];
T3 = [Q5.concentration(Q5.time == 0.7500)];
T4 = [Q5.concentration(Q5.time == 1.0000)];
T5 = [Q5.concentration(Q5.time == 1.2500)];
T6 = [Q5.concentration(Q5.time == 2.0000)];
T7 = [Q5.concentration(Q5.time == 3.0000)];
T8 = [Q5.concentration(Q5.time == 4.0000)];
T9 = [Q5.concentration(Q5.time == 5.0000)];
T10 = [Q5.concentration(Q5.time == 6.0000)];
T11 = [Q5.concentration(Q5.time == 8.0000)];

mT1 = mean(T1);
mT2 = mean(T2);
mT3 = mean(T3);
mT4 = mean(T4);
mT5 = mean(T5);
mT6 = mean(T6);
mT7 = mean(T7);
mT8 = mean(T8);
mT9 = mean(T9);
mT10 = mean(T10);
mT11 = mean(T11);

meanconc = [mT1 mT2 mT3 mT4 mT5 mT6 mT7 mT8 mT9 mT10 mT11];
meanconc = meanconc';

meanline = table(meanconc, times, 'VariableNames', ["concentration" "time"]);

sT1 = std(T1);
sT2 = std(T2);
sT3 = std(T3);
sT4 = std(T4);
sT5 = std(T5);
sT6 = std(T6);
sT7 = std(T7);
sT8 = std(T8);
sT9 = std(T9);
sT10 = std(T10);
sT11 = std(T11);

err = [sT1 sT2 sT3 sT4 sT5 sT6 sT7 sT8 sT9 sT10 sT11];
err = err';

plot(S1, "time", "concentration")
hold on
plot(S2, "time", "concentration")
plot(S3, "time", "concentration")
plot(S4, "time", "concentration")
plot(S5, "time", "concentration")
plot(S6, "time", "concentration")
errorbar(times,meanconc, err)
legend("Subject 1", "Subject 2", "Subject 3", "Subject 4", "Subject 5", "Subject 6", "MEAN")

%% Question 5B - make mean and error bars thicker

plot(S1, "time", "concentration")
hold on
plot(S2, "time", "concentration")
plot(S3, "time", "concentration")
plot(S4, "time", "concentration")
plot(S5, "time", "concentration")
plot(S6, "time", "concentration")
errorbar(times,meanconc, err, 'LineWidth', 1.5)
legend("Subject 1", "Subject 2", "Subject 3", "Subject 4", "Subject 5", "Subject 6", "MEAN")


    % ZI: The plot looks great, although you did some extra work that you
    % could have avoided - remember "for" loops :)



