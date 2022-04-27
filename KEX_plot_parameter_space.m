function output = KEX_plot_parameter_space(R_ss_range, alpha_range, detail, accuracy, caption, inverse)

global dataX dataRho;

data_x = dataX * 71492 / 69911;
data_rho = dataRho * 71492 / 69911;

R_ss = linspace(R_ss_range(1), R_ss_range(2), detail);
alpha = linspace(alpha_range(1), alpha_range(2), detail);
theta = linspace(0, 4*pi/5, accuracy);

[X,Y] = ndgrid(R_ss, alpha);

for i = 1:detail
    for j = 1:detail
        D = 0;
        for m = 1:length(data_x)
            d=0;
            for k = 1:accuracy
                r = R_ss(i)*(2/(1+cos(theta(k))))^alpha(j);
                x = r*cos(theta(k));
                rho = r*sin(theta(k));
                
                d_x = x-data_x(m);
                d_rho = rho-data_rho(m);
                dist2 = d_x^2+d_rho^2;
                
                if dist2 < d || d == 0
                    d = dist2;
                elseif dist2 > d
                    break;
                end
            end
            D = D + d;
        end
        if (inverse) Z(i,j) = 1/sqrt(D);
        else Z(i,j) = sqrt(D); end
    end
    clc
    fprintf('Computing parameter space: %0.1f %%', 100 * i / detail);
end

[row, col] = find(ismember(Z, max(Z(:))));
best_R_ss = R_ss(row(1));
best_alpha = alpha(col(1));

output = [best_R_ss best_alpha]

f=figure;
surf(Y,X,Z)
set(gca, 'FontSize', 15)
set(gcf, 'color', 'white')
shading interp
title(caption, 'interpreter', 'tex')
xlabel('\alpha', 'interpreter', 'tex', 'FontSize', 25)
ylabel('R_{ss}', 'interpreter', 'tex', 'FontSize', 20)
%colormap(f, flipud(colormap(f)))
colorbar
view(0,90)
% view(90,0)

return;