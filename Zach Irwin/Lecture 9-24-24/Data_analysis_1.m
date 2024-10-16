load(fullfile(matlabroot,'examples','signal','data','weight2012.dat'));

days = weight2012(end:-1:1,1);
weight = weight2012(end:-1:1,2);

lineardays = 1:length(days);

t1 = datetime(2012, 1, 1);
caldays = t1 + lineardays-1;

%% plot data with labels:

figure; plot(lineardays, weight);
xlabel('Day');
ylabel('Weight (lb)');
title('2012 weight over the year')

figure; plot(caldays, weight);
xlabel('Day');
ylabel('Weight (lb)');
title('2012 weight over the year')

%% plot smoothed data

figure; plot(caldays, weight);
smoothedweight = smoothdata(weight, 'movmean', 7);
hold on; plot(caldays, smoothedweight);
legend('Raw data', 'Smoothed data')
xlabel('Day');
ylabel('Weight (lb)');
title('2012 weight over the year')

%% plot data by month:

months = [caldays.Month];
figure; boxchart(months, weight)
xlabel('Month')
ylabel('Average weight (lb)')
title('Average weight per 2012 month')
