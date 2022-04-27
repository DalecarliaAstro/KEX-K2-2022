function output = KEX_cross_density(alpha, R_ss_range, divs)

global dataX dataRho;

R_ss_diff = R_ss_range(2)-R_ss_range(1);
d_R_ss = R_ss_diff / divs;
dataLen = length(dataX);

R=sqrt(dataX.^2+dataRho.^2);
theta = arrayfun(@(i) atan2(dataRho(i),dataX(i)), 1:dataLen);
R_ss = arrayfun(@(i) R(i) / ((2/(1+cos(theta(i))))^alpha), 1:dataLen);

crossings = zeros([1 divs]);
%min_theta = arrayfun(@(i) pi/2, 1:divs);
min_theta = pi/2;
max_theta = arrayfun(@(i) pi/2, 1:divs);

for i=1:dataLen
    diff = R_ss(i)-R_ss_range(1);
    d = int32(ceil(diff/d_R_ss));
    crossings(d) = crossings(d)+1;
    if theta(i) < min_theta
        min_theta=theta(i);
    end
    if theta(i) > max_theta(d)
        max_theta(d)=theta(i);
    end
end

cd = zeros([1 divs]);

for i=1:divs
    if crossings(i) == 0
        cd(i)=0;
    else
        R_ss_1 = R_ss_range(1)+(i-1)*d_R_ss;
        R_ss_2 = R_ss_range(1)+i*d_R_ss;
        R_ss_hat = (R_ss_2^2-R_ss_1^2)*(2^(2*alpha))/(4*alpha-1);
        area = R_ss_hat * (f(max_theta(i),alpha)-f(min_theta,alpha));
        cd(i) = crossings(i) / area;
    end
end

output = cd;
R_ss_axis = arrayfun(@(i) R_ss_range(1)+(i-1/2)*d_R_ss, 1:divs);

cd_ = cd(cd>0);
axis_ = R_ss_axis(cd>0);

start_zeros = 5;
for z = 1:start_zeros
    cd_(2:end+1) = cd_;
    cd_(1) = 0;
    axis_(2:end+1) = axis_;
    axis_(1) = axis_(2)-d_R_ss;
end

%cd_(end+1) = 0;
%axis_(end+1) = axis_(end)+d_R_ss;

lb1 = [-inf, -inf, -inf];% [40, 10, -inf];
ub1 = [inf, inf, inf];% [80, 20, inf];
lb2 = [-inf, -inf, -10, -inf];% [40, 10, -20, -inf];
ub2 = [inf, inf, inf, inf];% [80, 20, 0, inf];

pdf_params1 = lsqcurvefit(@normalpdf, [70 40 5], axis_, cd_, lb1, ub1)
pdf_params2 = lsqcurvefit(@skewnormalpdf, [70 40 -10 5], axis_, cd_, lb2, ub2)
x = linspace(axis_(1), axis_(end), 100);

%pdf_params1(2) = 9;

figure
colororder({'k','k'})
set(gca, 'FontSize', 14)
hold on
yyaxis left
bar(axis_, cd_, 'FaceColor', [1 .2 .2]) %[1 .2 .2]) [.2 .5 1])
ylabel('Cross density (R_{J}^{-2})', 'interpreter', 'tex', 'FontSize', 16)
yyaxis right
plot(x, 1*normalpdf([pdf_params1(1:end-1) 1],x), 'LineWidth', 2);
plot(x, 1*skewnormalpdf([pdf_params2(1:end-1) 1],x), 'LineWidth', 2);
ylabel('Cross probability density', 'interpreter', 'tex', 'FontSize', 16)
%plot(R_ss_axis, npdf())
hold off
legendText = ["Density of BS crossings" "Normal pdf" "Skew normal pdf"];
legend(arrayfun(@(i) sprintf(legendText(i)), 1:length(legendText), 'UniformOutput', false), 'Location', 'northwest')
%xticks(axis_(1):4:axis_(2))
xlabel('R_{ss} (R_J)', 'interpreter', 'tex', 'FontSize', 16)
set(gcf,'color','w');
return;

function out = f(x,k)
out = abs(sin(x/2))*cot(x/2)*((cos(x)+1)^(-2*k))*KEX_Hypergeometric2F1(1/2, 1/2-2*k, 3/2-2*k, cos(x/2)^2, 20);
return;

function out = normalpdf(const,x)
mu = const(1);
sigma = const(2);
A = const(3);
out = A./sigma.*normpdf((x-mu)./sigma);
return;

function out = skewnormalpdf(const,x)
mu = const(1);
sigma = const(2);
alpha = const(3);
A = const(4);
in = (x-mu)/sigma;
out = A/sigma.*normpdf(in).*(1+erf(alpha.*in./sqrt(2)));
return;

