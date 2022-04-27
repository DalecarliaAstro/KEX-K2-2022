function JUNO_plot_B_R_WAV(starttime, stoptime)

global epochB doy Bx By Bz x y z;
global epoch_E_WAV E_WAV_LFR_LO_f E_WAV_LFR_LO_data;

fprintf('Plotting data\n');
len = 360;

%--- Plot subinterval?
if nargin>1
    starttime = irf_time(starttime);
    stoptime = irf_time(stoptime);
    tint = [starttime stoptime];
else
    tint = [epochB(1) epochB(end)];
end

%--- Calculate Babs
Babs = sqrt(Bx.^2+By.^2+Bz.^2);
Btheta = acos(Bx./Babs);

%--- Calculate spherical coordinate avarages
Br_ = zeros(1, len*2);
Btheta_ = zeros(1, len*2);
epochB_ = arrayfun(@(k) starttime + k, -len:len-1);
for m = -1:0
    valR = 0;
    valTheta = 0;
    for k = 1:len
        index = int32(starttime + m * len + k - epochB(1));
        valR = valR + Babs(index) / len;
        valTheta = valTheta + Btheta(index) / len;
    end
    for k = 1:len
        index = (m+1) * len + k;
        Br_(index) = valR;
        Btheta_(index) = valTheta;
    end
end

%--- Calculate R
RJ = 69911;
R = sqrt(x.^2+y.^2+z.^2)/RJ;

%--- Prepare spectrum
size(epoch_E_WAV);
size(E_WAV_LFR_LO_data);
WAVspec=struct('t', epoch_E_WAV);
WAVspec.p = E_WAV_LFR_LO_data;
WAVspec.p_label={};%{'PSD', '[V^2 m^{-2} Hz^{-1}]'};
WAVspec.f_label={};%{'f', '[Hz]'};
WAVspec.f = E_WAV_LFR_LO_f;

%--- Plot
n = 4; %4
h = irf_plot(n);

%hca = irf_panel('Babs');
%h(1) = hca;
%irf_plot(hca,[epochB' Babs']);
%ylabel(hca,'|B| (nT)','Interpreter','tex');
%grid(hca,'off');

hca = irf_panel('B');
h(1) = hca;
irf_plot(hca,[epochB' Bx']);
hold(hca,'on');
irf_plot(hca,[epochB' By']);
irf_plot(hca,[epochB' Bz']);
hold(hca,'off');
irf_legend(hca,{'B_x','B_y','B_z'},[0.98 0.95],'FontSize',25); % font size 15
hca.FontSize = 22;
ylabel(hca,'B (nT)','Interpreter','tex', 'FontSize', 18);
grid(hca,'off');

hca = irf_panel('Babs');
h(2) = hca;
irf_plot(hca,[epochB_' Br_']);
ylabel(hca,'|B| (nT)','Interpreter','tex', 'FontSize', 18);
grid(hca,'off');

hca = irf_panel('theta');
h(3) = hca;
irf_plot(hca,[epochB_' Btheta_']);
ylabel(hca,'\theta (rad)','Interpreter','tex', 'FontSize', 18);
grid(hca,'off');

hca = irf_panel('E_WAV');
h(4) = hca;
%[hspect hcb] = irf_spectrogram(hca, WAVspec);
[hspect hcb] = irf_spectrogram(hca, WAVspec, 'log');
hca.YScale = 'log';
hca.YTick = [1e2 1e3 1e4];
%irf_zoom(hca,'y',[1e2 2e4]);
irf_zoom(hca,'y',[3e1 2e4]);
colormap(hca,'jet');
caxis(hca,[-11 -5]);
yyaxis left
ylabel(hca,'f (Hz)','interpreter','tex', 'FontSize', 20);
yyaxis right
hca.YTick = [];
ylabel(hcb,'PSD (V^2 m^{-2} Hz^{-1})', 'interpreter', 'tex', 'FontSize', 16);
yyaxis left
%hcb.Label.String(1) = {'log Diff. energy flux'};
%hca.FontSize = 20; %FS1

%hca = irf_panel('R');
%h(4) = hca;
%irf_plot(hca,[epochB' R']);
%ylabel(hca,'R (R_J)','Interpreter','tex');
%grid(hca,'off');

% changes to all figure
irf_plot_axis_align;
irf_zoom(h,'x',tint);
irf_zoom(h,'y');
%irf_plot_axis_align(h(1:n))
%irf_zoom(h(1 : 3),'x',tint);
irf_timeaxis(h);
cur = gca;
cur.FontSize = 19;
xlabel(cur, '2017-01-11', 'interpreter', 'tex', 'FontSize', 20);


%--- Set figure size
x0=10;
y0=10;
width=700;
height=width*0.85;
%set(gcf,'position',[x0,y0,width,height]);



return;