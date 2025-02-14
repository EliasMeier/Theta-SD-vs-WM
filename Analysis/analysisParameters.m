function P = analysisParameters()
% Here is located all the common variables, paths, and parameters that get
% repeatedly called by more than one preprocessing script.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Labels

P.Participants = {'P01', 'P02', 'P03', 'P04', 'P05', 'P06', 'P07', 'P08', ...
    'P09', 'P10', 'P11', 'P12', 'P13', 'P14', 'P15', 'P16', 'P17', 'P19'};

P.AllTasks = {'Match2Sample', 'LAT', 'PVT', 'SpFT', 'Game', 'Music'};
P.TaskLabels = {'STM', 'LAT', 'PVT', 'Speech', 'Game', 'Music'};

% Task labels for each session; different because of PVT and LAT
Sessions.Match2Sample = {'Baseline', 'Session1', 'Session2'};
Sessions.LAT = {'BaselineComp', 'Session1Comp', 'Session2Comp'};
Sessions.PVT = {'BaselineComp', 'Session1Comp', 'Session2Comp'};
Sessions.SpFT = {'Baseline', 'Session1', 'Session2'};
Sessions.Game = {'Baseline', 'Session1', 'Session2'};
Sessions.Music = {'Baseline', 'Session1', 'Session2'};
Sessions.Labels = {'BL', 'SR', 'SD'};

P.Sessions = Sessions;

P.Nights = {'Baseline', 'NightPre', 'NightPost'};


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Locations


if exist( 'D:\Data\Raw', 'dir')
    Core = 'D:\Data\';
elseif exist( 'F:\Data\Raw', 'dir')
    Core = 'F:\Data\';
else
    error('no data disk!')
end

Paths.Preprocessed = fullfile(Core, 'Preprocessed');


Paths.Datasets = 'G:\LSM\Data\Raw';
Paths.Data  = fullfile(Core, 'Final'); % where data gets saved once its been turned into something else
Paths.Results = fullfile(Core, 'Results', 'Theta-SD-vs-WM'); % where figures and tables end up
Paths.Paper = 'C:\Users\colas\Dropbox\Research\Publications and Presentations\Sleep\Paper1\Figures';
Paths.PaperStats =  'C:\Users\colas\Dropbox\Research\Publications and Presentations\Sleep\Paper1\Stats';
Paths.Scoring = fullfile(Core, 'Scoring');

% get path where these scripts were saved
Paths.Analysis = mfilename('fullpath');
Paths.Analysis = fullfile(extractBefore(Paths.Analysis, '\Analysis\'));

% add location of subfunctions
addpath(fullfile(Paths.Analysis, 'functions','general'))
addpath(fullfile(Paths.Analysis, 'functions','eeg'))
addpath(fullfile(Paths.Analysis, 'functions','plots'))
addpath(fullfile(Paths.Analysis, 'functions','tasks'))
addpath(fullfile(Paths.Analysis, 'functions','stats'))
addpath(fullfile(Paths.Analysis, 'functions','source_localization'))
addpath(fullfile(Paths.Analysis, 'functions','questionnaires'))
run(fullfile(Paths.Analysis, 'functions', 'external', 'addExternalFunctions'))


% if eeglab has not run, run it so all the subdirectories get added
if ~exist('topoplot', 'file')
    eeglab
    close all
end

P.Paths = Paths;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Plotting settings


Format.FontName = 'Tw Cen MT'; % use something else for papers

% plot sizes depending on which screen I'm using
Pix = get(0,'screensize');
if Pix(3) < 2000
    Format.FontSize = 12;
    Format.TitleSize = 15;
    Format.BarSize = 10;
    Format.TopoRes = 150;
    Format.LW = 2;
    Format.Topo.Sig = 2; % marker size
    Format.ScatterSize = 70; % TODO: seperate features for small or big screen
    Format.OSize = 5; % Spaghetti O
    
else
    Format.FontSize = 25;
    Format.TitleSize = 30;
    Format.BarSize = 18;
    Format.TopoRes = 300;
    Format.LW = 4;
    Format.Topo.Sig = 5; % marker size
    Format.ScatterSize = 200; % TODO: seperate features for small or big screen
    Format.OSize = 20; % Spaghetti O
end


%%% colors and colormaps

% colormaps
Format.Colormap.Linear = flip(colorcet('L17'));
Format.Colormap.Monochrome = colorcet('L2');
Format.Colormap.Divergent = colorcet('D1A');
Format.Colormap.Rainbow = unirainbow;

% discrete color steps for topoplot colormaps
Format.Steps.Linear = 20;
Format.Steps.Divergent = 28;
Format.Steps.Monochrome = 20;

Format.Colorbar = 'west'; % location

Format.Alpha.Participants = .3; % transparency when plotting all participants together
Format.Alpha.Channels = .15; % transparency when plotting all participants together
Format.Alpha.Patch = .4;

% task colors
Format.Colors.AllTasks = getColors(6, 'rainbow');
for Indx_T = 1:numel(P.AllTasks)
    Format.Colors.Tasks.(P.AllTasks{Indx_T}) = Format.Colors.AllTasks(Indx_T, :);
end

% colors for levels in M2S task
Format.Colors.Levels = flip(getColors([1 3], 'rainbow', 'red')); % M2S red
Format.Colors.spEpochs = getColors([1 2], 'rainbow', 'green'); % speech green

% other colors
Format.Colors.SigStar = [0 0 0];
Format.Colors.Participants = reduxColormap(Format.Colormap.Rainbow, numel(P.Participants));
Format.Colors.Generic = [.5 .5 .5];
Format.Colors.Background = [1 1 1];

% colors + shades for all the tasks
Format.Colors.Sessions = getColors([numel(P.AllTasks), 3], 'rainbow');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Power/EEG information

Bands.Delta = [1 4];
Bands.Theta = [4 8];
Bands.Alpha = [8 12];
Bands.Beta = [15 25];
Bands.Gamma = [25 35];

Format.Labels.logBands = [1 2 4 8 16 32]; % x markers for plot on log scale
Format.Labels.Bands = [1 4 8 15 25 35 40]; % normal scale
Format.Labels.FreqLimits = [1 40];
Format.Labels.zPower = 'PSD z-scored';
Format.Labels.Power = 'PSD Amplitude (\muV^2/Hz)';
Format.Labels.Frequency = 'Frequency (Hz)';
Format.Labels.Epochs = {'Encoding', 'Retention1', 'Retention2', 'Probe'}; % for M2S task
Format.Labels.Amplitude = 'Amplitude (\muV)';
Format.Labels.Time = 'Time (s)';
Format.Labels.ES = "Hedge's G";
Format.Labels.t = 't-values';
Format.Labels.Correct = '% Correct';
Format.Labels.RT = 'RT (s)';

%%% Channels and Regions of Interest (ROI)
Channels = struct();

Channels.Remove = [17, 48, 119]; % channels to remove before FFT

% ROIs selected independently of data
Frontspot = [22 15 9 23 18 16 10 3 24 19 11 4 124 20 12 5 118 13 6 112];
Backspot = [66 71 76 84 65 70 75 83 90 69 74 82 89];
Centerspot = [129 7 106 80 55 31 30 37 54 79 87 105 36 42 53 61 62 78 86 93 104 35 41 47  52 92 98 103 110, 60 85 51 97];

Channels.preROI.Front = Frontspot;
Channels.preROI.Center = Centerspot;
Channels.preROI.Back = Backspot;

Format.Colors.preROI = getColors(numel(fieldnames(Channels.preROI)));

% small ROIs based on data
Channels.Peaks.Frontspot = [11 12 5 6]; % frontal midline
Channels.Peaks.Extrafront = [18 16 10 15];
Channels.Peaks.LeftWing = [44 43 38 39]; % fronto-temporal left
Channels.Peaks.RightWing = [114 120 121 115]; % fronto-temporal right
Channels.Peaks.BackSpot = [71 76 75 70 83]; % occipital-central midline
Channels.Peaks.LeftTail = [58 50 64 65 66]; % occipital-temporal left
Channels.Peaks.RightTail = [96 101 95 90 84];
Channels.Peaks.LeftDip = [31 54 30 37 53 36 42]; % center left
Channels.Peaks.RightDip = [103 109 110 116];

% ROI channels based on 10-20 system, pooled
Channels.Standard.F = [11, 6, 5, 12];
Channels.Standard.O = [70 83];
Channels.Standard.P = [58 52 92 96];
Channels.Standard.C = [36 104 129];
Channels.Standard.T = [45 108];
Format.Colors.Standard = getColors(5);

% 10-20 ROIs
Channels.Standard_10_20.Fz = 11;
Channels.Standard_10_20.Fp1 = 22;
Channels.Standard_10_20.Fp2 = 9;
Channels.Standard_10_20.F3 = 24;
Channels.Standard_10_20.F4 = 124;
Channels.Standard_10_20.F7 = 33;
Channels.Standard_10_20.F8 = 122;
Channels.Standard_10_20.Cz = 129; % TEMP
Channels.Standard_10_20.C3 = 36;
Channels.Standard_10_20.C4 = 104;
Channels.Standard_10_20.T7 = 45;
Channels.Standard_10_20.T8 = 108;
Channels.Standard_10_20.Pz = 62;
Channels.Standard_10_20.P3 = 52;
Channels.Standard_10_20.P4 = 92;
Channels.Standard_10_20.P7 = 58;
Channels.Standard_10_20.P8 = 96;
Channels.Standard_10_20.Oz = 75;
Channels.Standard_10_20.O1 = 70;
Channels.Standard_10_20.O2 = 83;

Channels.Standard_10_20_Titles = fieldnames(Channels.Standard_10_20);
Channels.Standard_10_20_All = [];
for Indx = 1:numel(Channels.Standard_10_20_Titles)
    Channels.Standard_10_20_All = cat(2, Channels.Standard_10_20_All, Channels.Standard_10_20.(Channels.Standard_10_20_Titles{Indx}));
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Alternative Format for Pixels

Pixels = Format;

% final figure size in pixels
% lettering for figures
Pixels.Letters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
Pixels.Numerals = {'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII', 'XIII', 'XIV', 'XV', 'XVI', 'XVII', 'XVIII', 'XIX', 'XX'};

Pixels.xPadding = 25; % border & distance between main figures
Pixels.yPadding = 25;
Pixels.xPaddingMinor = 25;
Pixels.yPaddingMinor = 25;
Pixels.PaddingExterior = 40;
Pixels.LetterSize = 30;
Pixels.TopoRes = 300;
Pixels.TitleSize = 22;
Pixels.FontSize = 18;
Pixels.BarSize = 15;
Pixels.PaddingLabels = Pixels.FontSize*2;
Pixels.W = 42; % width of reference "paper"
Pixels.H = 60; % width of reference "paper"
Pixels.LW = 3;
Pixels.ScatterSize = 100;
Pixels.Topo.Sig = 3;
Pixels.OSize = 10; % Spaghetti O


Format_PPT = Format;
Format_PPT.Steps.Divergent = 40;
Format_PPT.BarSize = 25;
Format_PPT.TopoRes = 500;


P.Format_PPT = Format_PPT;
P.Pixels = Pixels;
P.Format = Format;
P.Channels = Channels;
P.Bands = Bands;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Durations for FFT

Durations.Match2Sample =  [-2, -4, 1 2 4 6 8, 10, 12, 15, 20];
Durations.LAT =  [-2, -4, 1 2 4 6 8, 10];
Durations.PVT =  [-2, -4, 1 2 4 6 8];
Durations.SpFT =  [-2, 1 2 4];
Durations.Game =  [-2, -4, 1 2 4 6 8];
Durations.Music =  [-2, 1 2 4];

P.Durations = Durations;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Stats parameters

StatsP = struct();

StatsP.ANOVA.ES = 'eta2';
StatsP.ANOVA.ES_lims = [0 1];
StatsP.ANOVA.nBoot = 2000;
StatsP.ANOVA.pValue = 'pValueGG';
StatsP.ttest.nBoot = 2000;
StatsP.ttest.dep = 'pdep'; % use 'dep' for ERPs, pdep for power
StatsP.Alpha = .05;
StatsP.Trend = .1;
StatsP.Paired.ES = 'hedgesg';
StatsP.Paired.Benchmarks = -2:.5:2;
StatsP.FreqBin = 1; % # of frequencies to bool in spectrums stats
StatsP.minProminence = .1; % minimum prominence for when finding clusters of g values
P.StatsP = StatsP;


