function JUNO_plot_B(starttime,stoptime)

global epochB doy Bx By Bz x y z;

if nargin>1
    starttime = irf_time(starttime);
    stoptime = irf_time(stoptime);
    tint = [starttime stoptime];
else
    tint = [epochB(1) epochB(end)];
end

%--- Calculate Babs
Br = sqrt(Bx.^2+By.^2+Bz.^2);
Btheta = acos(Bz./Br);
Bphi = arrayfun(@(i) atan2(By(i),Bx(i)), 1:length(Bx));

n = 1000;
len = floor(length(Br) / n);
Br_ = zeros(1, len*n);
Btheta_ = zeros(1, len*n);
Bphi_ = zeros(1, len*n);
epochB_ = epochB(1:len*n);
for m = 1:n
    valR = 0;
    valTheta = 0;
    valPhi = 0;
    for k = 1:len
        index = k + (m-1)*len;
        valR = valR + Br(index) / len;
        valTheta = valTheta + Btheta(index) / len;
        valPhi = valPhi + Bphi(index) / len;
    end
    for k = 1:len
        index = k + (m-1)*len;
        Br_(index) = valR;
        Btheta_(index) = valTheta;
        Bphi_(index) = valPhi;
    end
end


%--- Plot
n = 3;
h = irf_plot(n);

hca = irf_panel('Bxyz');
irf_plot(hca,[epochB' Bx']);
hold(hca,'on');
irf_plot(hca,[epochB' By']);
irf_plot(hca,[epochB' Bz']);
hold(hca,'off');
irf_legend(hca,{'B_x','B_y','B_z'},[0.98 0.95],'FontSize',24);
ylabel(hca,'B (nT)','Interpreter','tex');
grid(hca,'off');

hca = irf_panel('Babs');
irf_plot(hca,[epochB_' Br_']);
ylabel(hca,'|B| (nT)','Interpreter','tex');
grid(hca,'off');

hca = irf_panel('Angles');
irf_plot(hca,[epochB_' Btheta_']);
hold(hca, 'on');
irf_plot(hca,[epochB_' Bphi_']);
hold(hca, 'off');
irf_legend(hca,{'\theta','\phi'},[0.98 0.95],'FontSize',26);
ylabel(hca,'Angle (rad)','Interpreter','tex');
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
y0=50;
width=750;
height=width*0.85;
set(gcf,'position',[x0,y0,width,height]);



return;