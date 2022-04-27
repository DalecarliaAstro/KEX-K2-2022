function KEX_plot_orbit(starttime,stoptime)

global epochB doy Bx By Bz x y z dataX dataY dataZ dataRho;

%--- Plot subinterval?
if nargin>1
    starttime = irf_time(starttime);
    stoptime = irf_time(stoptime);
    tint = [starttime stoptime];
else
    tint = [epochB(1) epochB(end)];
end

%--- Calculate rho
RJ = 69911;
rho = sqrt(y.^2+z.^2);

%subplot(2,2,1);
%plot(x/RJ,y/RJ,'k');
%axis equal;
%xlabel('X (R_J)', 'interpreter', 'tex', 'fontSize', 14);
%ylabel('Y (R_J)', 'interpreter', 'tex', 'fontSize', 14);
%hold on
%for n = 1: length(BS_cross_X)
%    plot(BS_cross_X(n),BS_cross_Y(n),'ro')
%end
%hold off

%subplot(2,2,2);
%plot(x/RJ,z/RJ,'k');
%axis equal;
%xlabel('X (R_J)', 'interpreter', 'tex');
%ylabel('Z (R_J)', 'interpreter', 'tex');
%hold on
%for n = 1: length(BS_cross_X)
%    plot(BS_cross_X(n),BS_cross_Z(n),'ro')
%end
%hold off

%subplot(2,2,3);
%plot(y/RJ,z/RJ,'k');
%axis equal;
%xlabel('Y (R_J)', 'interpreter', 'tex');
%ylabel('Z (R_J)', 'interpreter', 'tex');
%hold on
%for n = 1: length(BS_cross_X)
%    plot(BS_cross_Y(n),BS_cross_Z(n),'ro')
%end
%hold off

%subplot(2,2,4);
%plot(x/RJ,rho/RJ,'k');
%axis equal;
%set(gca,'FontSize', 14);
%title("BS crossings", 'interpreter', 'tex', 'FontSize', 18);
%xlabel('X (R_J)', 'interpreter', 'tex', 'FontSize', 18);
%ylabel('\rho (R_J)', 'interpreter', 'tex', 'FontSize', 18);
%hold on
%for n = 1: length(BS_cross_X)
%    BS_cross_Rho = sqrt(BS_cross_Y(n)^2 + BS_cross_Z(n)^2);
%    plot(BS_cross_X(n),BS_cross_Rho,'ro')
%end
set(gcf, 'color', 'white');
hold off

return;