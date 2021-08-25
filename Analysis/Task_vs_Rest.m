% This script plots all the tasks' change from baseline (fixation post), to
% indicate whether the change with sleep deprivation within tasks matches
% their task-specific theta.

% Predictions:
% If SHY hypothesis is true: SD increases in theta should have the
% same topography as BL theta, but with larger amplitude.
% If COMP/ALPHA hypothesis is true: both some tasks (especially WM) and all SD
% conditions should just have a frontal hotspot of theta
% If LS/N1 hypothesis is true, general frontal increase in SD, independant of
% theta in tasks.

clear
close all
clc


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Parameters

P = analysisParameters();

Paths = P.Paths;
Participants = P.Participants;
AllTasks = P.AllTasks;
TaskLabels = P.TaskLabels;
Bands = P.Bands;
Format = P.Format;
Sessions = P.Sessions;
StatsP = P.StatsP;
Channels = P.Channels;

Duration = 4;
WelchWindow = 8;
Tag = [ 'window',num2str(WelchWindow), 's_duration' num2str(Duration),'m'];
TitleTag = strjoin({'Task', 'Topos', 'vs' 'Fixation', 'Welch', num2str(WelchWindow), 'zscored'}, '_');

Results = fullfile(Paths.Results, ['Task_vs_Rest_Topographies_', Tag]);
if ~exist(Results, 'dir')
    mkdir(Results)
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Setup data

Filepath =  fullfile(P.Paths.Data, 'EEG', ['Unlocked_' Tag]);
[AllData, Freqs, Chanlocs] = loadAllPower(P, Filepath, AllTasks);

% z-score it
zData = zScoreData(AllData, 'last');

% save it into bands
bData = bandData(zData, Freqs, Bands, 'last');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Plot data

BandLabels = fieldnames(Bands);
BL_CLabel = 'z-score';
CLims_Diff = [-2 2];

%% Plot all topo changes together

Ch = Channels.Standard_10_20_All;
Ch = labels2indexes(Ch, Chanlocs);

for Indx_B = 1:numel(BandLabels)
    HedgesG_SD = nan(numel(AllTasks), numel(Chanlocs));
    for Indx_T = 1:numel(AllTasks)
        figure('units','normalized','outerposition',[0 0 .5 .5])
        
        % plot baseline topography
        Data = squeeze(bData(:, 1, Indx_T, :, Indx_B));
        BL = nanmean(Data, 1);
        Max = max(abs(BL));
        
        subplot(2, 3, 1)
        plotTopo(BL, Chanlocs, [-Max Max], BL_CLabel, 'Divergent', Format)
        title(strjoin({'BL', TaskLabels{Indx_T}, BandLabels{Indx_B}}, ' '), ...
            'FontSize', 14)
        
        % plot change from BL
        for Indx_S = [2,3]
            Data2 = squeeze(bData(:, Indx_S, Indx_T, :, Indx_B));
            
            subplot(2, 3, Indx_S)
            Stats = plotTopoDiff(Data, Data2, Chanlocs, CLims_Diff, StatsP, Format);
            title(strjoin({Sessions.Labels{Indx_S}, 'vs BL', TaskLabels{Indx_T}, BandLabels{Indx_B}}, ' '), ...
                'FontSize', 14)
            HedgesG_SD(Indx_T, :) = Stats.(StatsP.Paired.ES);
        end
        
        % plot change from Fix
        for Indx_S = 1:numel(Sessions.Labels)
            if Indx_T == numel(AllTasks) % skip for fixation
                continue
            end
            
            Data1 = squeeze(bData(:, Indx_S, end, :, Indx_B));
            Data2 = squeeze(bData(:, Indx_S, Indx_T, :, Indx_B));
            
            subplot(2, 3, Indx_S+3)
            plotTopoDiff(Data1, Data2, Chanlocs, CLims_Diff, StatsP, Format);
            title(strjoin({Sessions.Labels{Indx_S}, TaskLabels{Indx_T}, 'vs', Sessions.Labels{Indx_S}, 'Rest'}, ' '), ...
                'FontSize', 14)
        end
        
        % save
        saveFig(strjoin({TitleTag, 'Diffs', TaskLabels{Indx_T}, BandLabels{Indx_B}}, '_'), Results, Format)
    end
    
    figure('units','normalized','outerposition',[0 0 1 .45])
    hold on
    for Indx_T = 1:numel(AllTasks)
        plot(1:numel(Ch), HedgesG_SD(Indx_T, Ch), 'Color', Format.Colors.AllTasks(Indx_T, :), 'LineWidth', 2)
    end
    xticks(1:numel(Ch))
    xticklabels(Channels.Standard_10_20_Titles)
    title(strjoin({ BandLabels{Indx_B}, StatsP.Paired.ES}, ' '))
    set(gca, 'FontName', Format.FontName, 'FontSize', 18,  'YGrid', 'on', 'YTick', StatsP.Paired.Benchmarks)
    ylabel(StatsP.Paired.ES)
    saveFig(strjoin({TitleTag, '10-20', 'AllTasks', 'Hedgesg', BandLabels{Indx_B}}, '_'), Results, Format)
end



%% plot bargraph of widespreadness of SD effects

Edges = [-50, StatsP.Paired.Benchmarks, 50];
nLabels = numel(StatsP.Paired.Benchmarks);
Labels = {};
for Indx_L = 1:nLabels+1
    if Indx_L == 1
        L = ['g < ', num2str(StatsP.Paired.Benchmarks(Indx_L))];
    elseif Indx_L ==  nLabels + 1
        L = ['g > ', num2str(StatsP.Paired.Benchmarks(Indx_L-1))];
    else
        L = [num2str(StatsP.Paired.Benchmarks(Indx_L-1)), ' < g < ', num2str(StatsP.Paired.Benchmarks(Indx_L))];
    end
    
    Labels = cat(2, Labels, L);
end
Colors = reduxColormap(Format.Colormap.Divergent, nLabels+1);


for Indx_B = 1:numel(BandLabels)
    figure('units','normalized','outerposition',[0 0 .5 .35])
    for Indx_S = 2:3
        Data1 = squeeze(bData(:, 1, :, :, Indx_B));
        Data2 = squeeze(bData(:, Indx_S, :, :, Indx_B));
        Stats = hedgesG(Data1, Data2, StatsP);
        
        subplot(1, 2, Indx_S-1)
        plotPieBars(Stats.hedgesg, Edges, TaskLabels, Colors, Format)
        title(strjoin({Sessions.Labels{Indx_S} 'vs BL', BandLabels{Indx_B}, 'Hedges G Frequencies'}, ' '))
    end
    
    % save
    saveFig(strjoin({TitleTag, 'Widespreadness', 'SD', BandLabels{Indx_B}}, '_'), Results, Format)
    
end

PlotColorLegend(Colors, Labels, Format)
saveFig(strjoin({TitleTag, 'Widespreadness', 'Legend'}, '_'), Results, Format)

%% plot bargraph of widespreadness of task effects

for Indx_B = 1:numel(BandLabels)
    figure('units','normalized','outerposition',[0 0 .785 .35])
    for Indx_S = 1:numel(Sessions.Labels)
        Data1 = bData(:, Indx_S, end, :, Indx_B);
        Data2 = squeeze(bData(:, Indx_S, 1:numel(AllTasks)-1, :, Indx_B));
        
        Data1 = squeeze(repmat(Data1, [1,1,  numel(AllTasks)-1, 1]));
        Stats = hedgesG(Data1, Data2, StatsP);
        
        subplot(1, numel(Sessions.Labels), Indx_S)
        plotPieBars(Stats.hedgesg, Edges, TaskLabels(1:end-1), Colors, Format)
        title(strjoin({Sessions.Labels{Indx_S} 'Task vs BL', BandLabels{Indx_B}, 'Hedges G Frequencies'}, ' '))
    end
    
    % save
    saveFig(strjoin({TitleTag, 'Widespreadness', 'Task', BandLabels{Indx_B}}, '_'), Results, Format)
    
end


%% plot 10-20 channels for every task difference

Ch = Channels.Standard_10_20_All;
Indx_BL = find(strcmpi(Channels.Standard_10_20_Titles, 'Cz'));
Ch = labels2indexes(Ch, Chanlocs);

for Indx_B = 1:numel(BandLabels)
    
    Data1 = squeeze(bData(:, 1, :, Ch, Indx_B));
    Data2 = squeeze(bData(:, 3, :, Ch, Indx_B));
    Data = Data2-Data1;
    Data = permute(Data, [1 3 2]);
    
    % plot spaghetti-o plot of tasks x sessions for each ch and each band
    figure('units','normalized','outerposition',[0 0 1 .45])
    Stats = plotSpaghettiOs(Data, Indx_BL, Channels.Standard_10_20_Titles, TaskLabels, ...
        Format.Colors.AllTasks, StatsP, Format);
    ylabel('Power Diff (z-scored)')
    title(strjoin({BandLabels{Indx_B}, 'Difference'}, ' '))
    saveFig(strjoin({TitleTag, '10-20', 'AllTasks', 'Diff', BandLabels{Indx_B}}, '_'), Results, Format)
    
end


%% SSSC Poster

ThetaIndx = strcmpi(BandLabels, 'theta');

Fix = squeeze(bData(:, 1, end, :, ThetaIndx));

figure('units','normalized','outerposition',[0 0 1 .5])
tiledlayout(2,numel(AllTasks), 'Padding', 'none', 'TileSpacing', 'compact');
for Indx_T = 1:numel(AllTasks)
    
    % theta at baseline, minmax colorbars
    Data = squeeze(bData(:, 1, Indx_T, :, ThetaIndx));
    
    Max = max(abs(nanmean(Data,1)));
     nexttile
    plotTopo(nanmean(Data,1), Chanlocs, [-Max Max], BL_CLabel, 'Divergent', Format)
    title(TaskLabels{Indx_T}, 'Color', Format.Colors.AllTasks(Indx_T, :), 'FontSize', 30)
    

    
end
    
for Indx_T = 1:numel(AllTasks)-1
 
      Data = squeeze(bData(:, 1, Indx_T, :, ThetaIndx));
      
    % change from fixation
     nexttile
    plotTopoDiff(Fix, Data, Chanlocs, CLims_Diff, StatsP, Format);
    title([TaskLabels{Indx_T}, ' vs Rest'], 'Color', Format.Colors.AllTasks(Indx_T, :), 'FontSize', 20)
    
end

saveFig(strjoin({ 'SSSSC', TitleTag, 'Theta_Baseline_Task'}, '_'), Results, Format)



%%
figure('units','normalized','outerposition',[0 0 1 .5])
tiledlayout(2,numel(AllTasks), 'Padding', 'none', 'TileSpacing', 'compact');
for Indx_T = 1:numel(AllTasks)
    BL = squeeze(bData(:, 1, Indx_T, :, ThetaIndx));
    
    % Sleep restriction vs baseline
    SR = squeeze(bData(:, 2, Indx_T, :, ThetaIndx));
    
    nexttile
    plotTopoDiff(BL, SR, Chanlocs, CLims_Diff, StatsP, Format);
    title([TaskLabels{Indx_T}, ' SR vs BL'], 'Color', Format.Colors.AllTasks(Indx_T, :), 'FontSize', 30)
    
end

for Indx_T = 1:numel(AllTasks)
    BL = squeeze(bData(:, 1, Indx_T, :, ThetaIndx));
    
    % Sleep deprivation vs baseline
    SD = squeeze(bData(:, 3, Indx_T, :, ThetaIndx));
    
    nexttile
    plotTopoDiff(BL, SD, Chanlocs, CLims_Diff, StatsP, Format);
    title([TaskLabels{Indx_T}, ' SD vs BL'], 'Color', Format.Colors.AllTasks(Indx_T, :), 'FontSize', 30)
    
end

saveFig(strjoin({ 'SSSSC', TitleTag, 'Theta_SD'}, '_'), Results, Format)







