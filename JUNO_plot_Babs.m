function JUNO_plot_Babs(starttime,stoptime)

global epochB doy Bx By Bz x y z;

starttime = irf_time(starttime);
stoptime = irf_time(stoptime);
tint = [starttime stoptime];

%--- Calculate Babs
Babs = sqrt(Bx.^2+By.^2+Bz.^2);

%--- Plot
h = irf_plot(1);

hca = irf_panel('Babs');
irf_plot(hca,[epochB Babs]);
%ylabel(hca,'|B| (nT)','Interpreter','tex');
grid(hca,'off');


% changes to all figure
irf_plot_axis_align;
irf_zoom(h,'x',tint);
irf_zoom(h,'y');
%irf_plot_axis_align(h(1 : 3))
%irf_zoom(h(1 : 3),'x',tint);
irf_timeaxis(h);
cur = gca;
cur.FontSize = 22;


%--- Set figure size
x0=10;
y0=50;
width=750;
height=width*0.65;
set(gcf,'position',[x0,y0,width,height]);



return;