function PlotSummaryPower(Power, Freqs, Chanlocs, Bands, Channels, Title, Format)
% plot a little figure with the power bands

BandLabels = fieldnames(Bands);

Data = 10*log(Power);
bData = bandData(Data, Freqs, Bands, 'last');
chData = meanChData(Power, Chanlocs, Channels.Peaks, 1);
 
ChLabels = fieldnames(Channels.Peaks);

figure('units','normalized','outerposition',[0 0 .7 .5])

% plot spectrum of hotspots
subplot(2, numel(BandLabels), 1:numel(BandLabels))
plotSpectrum(chData, Freqs, ChLabels, getColors(numel(ChLabels)), 1, 3, Format)
set(gca, 'FontSize', Format.FontSize)
title(Title, 'FontSize', Format.TitleSize)

% plot topography of bands
for Indx_B = 1:numel(BandLabels)
   subplot(2, numel(BandLabels),  numel(BandLabels)+Indx_B)
   plotTopo(bData(:, Indx_B), Chanlocs, [], 'dB', 'Linear', Format)
   title(BandLabels{Indx_B})
end
