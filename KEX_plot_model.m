function KEX_plot_model(R_ss, alpha, color, lineType, resolution, legendText)


plot(0, 0, '.', 'Color', '#D95319', 'MarkerSize', 20);
xlim([-100, 100]);
ylim([-100, 100]);

N = resolution;
theta = linspace(-pi, pi, N);

if length(R_ss) > 0
    hold on
    for i = 1 : length(R_ss)
        R = R_ss(i) * (2./(1 + cos(theta))).^alpha(i);
        x = R.*cos(theta);
        rho = R.*sin(theta);
        p(i) = plot(x, rho, lineType(i), 'Color', color(i), 'linewidth', 2);
    end
    hold off
end

legend(arrayfun(@(i) sprintf(legendText(i)), 1:length(legendText), 'UniformOutput', false))
xlabel('X (R_{J})', 'fontsize', 24, 'interpreter', 'tex');
ylabel('\rho (R_{J})', 'fontsize', 24, 'interpreter', 'tex');
set(gca,'FontSize', 13);
set(gcf,'color','white')
    
return;