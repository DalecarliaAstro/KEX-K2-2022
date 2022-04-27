function KEX_plot_B_pos(starttime,stoptime)

global epochB doy Bx By Bz x y z;

%--- Plot subinterval?
if nargin>1
    starttime = irf_time(starttime);
    stoptime = irf_time(stoptime);
    tint = [starttime stoptime];
else
    tint = [epochB(1) epochB(end)];
end;

%--- Calculate Babs
Babs = sqrt(Bx.^2+By.^2+Bz.^2);

%--- Calculate R
RJ = 69911;
R = sqrt(x.^2+y.^2+z.^2)/RJ;
X = x./RJ;
Y = y./RJ;
Z = z./RJ;

%--- Plot
n = 4;
h = irf_plot(n);

hca = irf_panel('Bx');
irf_plot(hca,[epochB' Bx']);
hold(hca,'on');
irf_plot(hca,[epochB' By']);
irf_plot(hca,[epochB' Bz']);
hold(hca,'off');
irf_legend(hca,{'B_x','B_y','B_z'},[0.98 0.95],'FontSize',15);
ylabel(hca,'B (nT)','Interpreter','tex');
grid(hca,'off');

hca = irf_panel('X');
irf_plot(hca,[epochB' X']);
ylabel(hca,'X (R_J)','Interpreter','tex');
grid(hca,'off');

hca = irf_panel('Y');
irf_plot(hca,[epochB' Y']);
ylabel(hca,'Y (R_J)','Interpreter','tex');
grid(hca,'off');

hca = irf_panel('Z');
irf_plot(hca,[epochB' Z']);
ylabel(hca,'Z (R_J)','Interpreter','tex');
grid(hca,'off');

% changes to all figure
irf_plot_axis_align;
irf_zoom(h,'x',tint);
irf_zoom(h,'y');
%irf_plot_axis_align(h(1:n))
%irf_zoom(h(1 : 3),'x',tint);
irf_timeaxis(h);
cur = gca;
cur.FontSize = 16;


%--- Set figure size
x0=10;
y0=10;
width=700;
height=width*0.85;
%set(gcf,'position',[x0,y0,width,height]);



return;