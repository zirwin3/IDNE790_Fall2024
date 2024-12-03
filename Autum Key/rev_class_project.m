% 
info = getInfoFile();
sinfo = info({info.ID} == "BB029"); %sinfo now holds metadata specific to subject "BB029"
finfo = sinfo.File({sinfo.File.FileName} == "buzz_multiPW"); %finfo: Metadata for the specific file "buzz_multiPW" associated with "BB029"

%% load data
[data, fi] = LoadDatav2("BB029", "buzz_multiPW");
%asked what is data here
%% 
trials = ParseStimulusTrials(fi);

%% 
%% Filter the data for DBS 

DBS = data(finfo.DBSChans,:);
DBS = DBS(2:4,:) - DBS(5:7,:); %how to know which ones to choose?
[b, a] = butter(2, [10, 30]/50e2, 'bandpass'); %filter set to look at beta band (10-30)

    for i = 1:size(DBS, 1)
        DBS(i,:) = filtfilt(b, a, double(DBS(i,:)));
    end
    
%% Initialize the output variable before the loop
window = [-100, 1500]; %set window
% input a conversion factor to milliseconds. Window currently in samples
sr_ms = (finfo.SampleRate)/1000; % converts samples per second to samples per ms
new_win=window/sr_ms; %c and converts the window (samples) to ms. Use to create x-axis. 

num_channels = size(DBS, 1); % Number of channels. was not happy when I tried to change the number of channels
num_timepoints = length(window(1):window(2)); % Number of time points per epoch
DBS_Stimtimes= [trials.StimLoc_sample];
num_epochs = length(DBS_Stimtimes); % Total number of epochs

output = zeros(num_channels, num_timepoints, num_epochs); % Pre-allocate with zeros
%% 
%% 
for i = 1:num_epochs
    idxs = DBS_Stimtimes(i) + window(1) : DBS_Stimtimes(i) + window(2);
      output(:, :, i) = DBS(:, idxs);
end

%% 

stim_response=mean(output,3);
t=linspace(new_win(1), new_win(2), size(stim_response,2));



%% Plot the data
figure(1) %creates a figure

plot(t, stim_response(:,:), 'r-', 'LineWidth', 2); % Red line with thickness 2. This is where I change the channels 

xlabel('Time (ms)');
ylabel('Response');

legend %makes a figure legend
title('DBS Stimulus Response');
grid on;

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Filter the data for ECOG
ecog = data(finfo.ECOGChans,:);
ecog = ecog(1:5,:) - ecog(2:6,:); %how to know which ones to choose?
[b, a] = butter(2, [10, 30]/50e2, 'bandpass'); %filter set to look at beta band (10-30)
for i = 1:5
    ecog(i,:) = filtfilt(b, a, double(ecog(i,:)));
end

%% Initialize the ecog output variable before the loop
ecog_window = [-100, 1500]; %set window
sr_ms = (finfo.SampleRate)/1000;
new_ecog_win = ecog_window/sr_ms; %use to create x-axis. 

num_ecogchannels = size(ecog, 1); % Number of channels
num_ecogtimepoints = length(ecog_window(1): ecog_window(2)); % Number of time points per epoch
ecogStimtimes= [trials.StimLoc_sample];
num_ecogepochs = length(ecogStimtimes); % Total number of epochs

ecog_output = zeros(num_ecogchannels, num_ecogtimepoints, num_ecogepochs); % Pre-allocate with zeros


%% 

for i = 1:num_ecogepochs
    % Compute indices for the current epoch
    idxs = ecogStimtimes(i) + ecog_window(1) : ecogStimtimes(i) + ecog_window(2);

    % Check if any indices are out of bounds
    if any(idxs < 1) || any(idxs > size(ecog, 2))
        % Skip this epoch if indices are invalid
        continue;
    end

    % Extract and resize data if necessary
    temp_data = ecog(:, idxs);
    if size(temp_data, 2) < size(ecog_output, 2)
        % Pad if too small
        temp_data = [temp_data, zeros(size(ecog, 1), size(ecog_output, 2) - size(temp_data, 2))];
    else
        % Truncate if too large
        temp_data = temp_data(:, 1:size(ecog_output, 2));
    end

    % Store the data
    ecog_output(:, :, i) = temp_data;
end

%% 
ecog_stim_response=mean(ecog_output,3);
t_ecog=linspace(new_ecog_win(1), new_ecog_win(2), size(ecog_stim_response,2));
%% plot the data
figure(1), %clf %creates a figure

% plot(t_ecog, ecog_stim_response(1,:));% plots the stimresponse that is within the designated timepoint

plot(t_ecog, ecog_stim_response(1,:), 'g-', 'LineWidth', 2); % green line with thickness 2
xlabel('Time (ms)');
ylabel('Response');

legend %makes a figure legend
title('ecog Stim Response')

grid on;

