function PlotSpectopo(EEG, Start, Stop)
% for visual inspection of a dataset, plot topographies of main spectral
% bands.

Bands = [
    1, 4;
    4.5 8;
    8.5 13;
    15 25;
    ];
BandLabels = {'delta', 'theta', 'alpha', 'beta'};
Freqs = 1:.5:30;

Colormap = parula;

Data = EEG.data(:, round(Start*EEG.srate):round(Stop*EEG.srate));


[FFT, ~] = pwelch(Data', [], [], Freqs, EEG.srate);
FFT = FFT';
figure('units','normalized','outerposition',[0 0 .4 .7])

for Indx_B = 1:size(Bands, 1)
    
    F = dsearchn( Freqs', Bands(Indx_B, :)');
    Power = mean(FFT(:, F(1):F(2)), 2);
    subplot(2, 2, Indx_B)
    topoplot(log(Power), EEG.chanlocs, 'style', 'map', 'headrad', 'rim', 'electrodes', 'labels');
    colorbar
    colormap(Colormap)
    title(BandLabels{Indx_B})
    
    
end