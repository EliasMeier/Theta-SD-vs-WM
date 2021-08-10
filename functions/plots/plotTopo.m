function plotTopo(Data, Chanlocs, CLims, CLabel, Colormap, Format)
% Data is a Ch x 1 matrix. If CLims is empty, uses "minmax". Colormap is
% string.

if numel(CLims) ~= 2
    CLims = 'minmax';
end

topoplot(Data, Chanlocs, 'style', 'blank', 'headrad', 'rim', 'whitebk', 'on', ...
   'electrodes', 'on',  'maplimits', CLims, 'gridscale', Format.TopoRes);
xlim([-.55 .55])
ylim([-.55 .6])

topoplot(Data, Chanlocs, 'style', 'map', 'headrad', 'rim', 'whitebk', 'on', ...
   'electrodes', 'on',  'maplimits', CLims, 'gridscale', Format.TopoRes);

set(gca, 'FontName', Format.FontName, 'FontSize', 12)

h = colorbar;
ylabel(h, CLabel, 'FontName', Format.FontName, 'FontSize', 12)

Colormap = Format.Colormap.(Colormap);
colormap(Colormap)