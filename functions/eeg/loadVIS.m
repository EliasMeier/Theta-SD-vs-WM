function [Percent, Minutes, SleepQuality] = loadVIS(Filepath)
% Script for reading a VIS file in a folder, and 

EL = 20; % epoch length in seconds

Percent = struct();
Minutes = struct();
SleepQuality = struct();

Content = getContent(Filepath);
Content(~contains(Content, '.vis')) = [];

% find correct vis file
if any(contains(Content, 'rh')) % if reto scored it
    VIS_Filename = Content(contains(Content, 'rh'));
elseif numel(Content) == 1 % if there's only one vis
    VIS_Filename = Content;
      warning(['No Reto score in ', Filepath])
elseif numel(Content) > 1 % if there's more than one, just get the first
      VIS_Filename = Content(1);
      warning(['More than one VIS in ', Filepath])
else
    warning(['No VIS in ', Filepath])
    return
end

% read .vis file
[~, strScores, ~] = visfun.readtrac(fullfile(Filepath, VIS_Filename), 1);

Tot = numel(strScores); % total epochs scored

%%% calculate metrics

% sleep stages in percent
Percent.wake = 100*nnz(strScores=='0')/Tot;
Percent.rem = 100*nnz(strScores=='r')/Tot;
Percent.n1 = 100*nnz(strScores=='1')/Tot;
Percent.n2 = 100*nnz(strScores=='2')/Tot;
Percent.n3 = 100*nnz(strScores=='3')/Tot;

% sleep stages in minutes
Minutes.wake = nnz(strScores=='0')*EL/60;
Minutes.rem = nnz(strScores=='r')*EL/60;
Minutes.n1 = nnz(strScores=='1')*EL/60;
Minutes.n2 = nnz(strScores=='2')*EL/60;
Minutes.n3 = nnz(strScores=='3')*EL/60;

% sleep quality metric
SO = find(strScores=='2' | strScores=='3' | strScores=='r', 1, 'first'); % sleep onset
if isempty(SO)
    SO = Tot;
end

RO = find(strScores=='r', 1, 'first');
if isempty(RO)
    RO = Tot;
end

SleepQuality.sol = SO*EL/60; % sleep onset latency (first N2 or N3 episode)
SleepQuality.sd = nnz(strScores~='0')*EL/60; % sleep duration
SleepQuality.waso = nnz(strScores(SO:end)=='0')*EL/60; % wake after sleep onset
SleepQuality.se = 100*(Tot-nnz(strScores=='0'))/Tot; % sleep efficiency
SleepQuality.rol =  RO*EL/60; % rem onset

