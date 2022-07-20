%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Zengjie Zhang
% Date: July 20, 2022

% Run main.m to perform the simulation.
% Run plot_results to plot the data.

addpath('./commons');
addpath('./rgb_hsl');

CostColor = [0, 51, 153]/255;
CostColor_milky = [204, 221, 255]/255;

Color_H = linspace(0,1,nAgent+1)';
Pcolor_hsl = [Color_H(1:nAgent), ones(nAgent, 1)*0.6, ones(nAgent, 1)*0.6 ];

Pcolor_dark_hsl = Pcolor_hsl;
Pcolor_dark_hsl(:,3) = ones(nAgent, 1)*0.05;

Pcolor_dark_2_hsl = Pcolor_hsl;
Pcolor_dark_2_hsl(:,3) = ones(nAgent, 1)*0.3;

Pcolor_milky_hsl = Pcolor_hsl;
Pcolor_milky_hsl(:,3) = ones(nAgent, 1)*0.95;

Pcolor = hsl2rgb(Pcolor_hsl);
Pcolor_dark = hsl2rgb(Pcolor_dark_hsl);
Pcolor_dark_2 = hsl2rgb(Pcolor_dark_2_hsl);
Pcolor_milky = hsl2rgb(Pcolor_milky_hsl);



%% Plot the cost
figure(1);

hold on;
plot(simConfig.t_scale, botCost,'LineWidth',1.5,'LineStyle','-.','Color', CostColor);
fill([simConfig.t_scale, simConfig.T,0], [botCost,0,0], CostColor_milky);
ylabel('$V(\mathcal{Z})$','Interpreter','latex', 'FontSize', 9);
grid on;
set(gca,'GridLineStyle','-.', 'FontSize', 9);
xlabel('time (s)','Interpreter','latex', 'FontSize', 10);

x0=500;
y0=200;
width=320;
height=160;

set(gcf,'position',[x0,y0,width,height]);
hold off;

%% Plot the input
figure(2);

hold on;
for i = 1:nAgent
    plot(simConfig.t_scale, botInput(i,:)-simConfig.agentWOrbit(i),'LineWidth',1.5,'LineStyle','-.','Color', Pcolor(i,:));
end
ylabel('{\boldmath{$u$}}$_k(t) - ${\boldmath{$\omega$}}$_0$','Interpreter','latex', 'FontSize', 9);
grid on;
set(gca,'GridLineStyle','-.', 'FontSize', 9);
xlabel('time (s)','Interpreter','latex', 'FontSize', 10);
 
x0=500;
y0=200;
width=320;
height=160;

set(gcf,'position',[x0,y0,width,height]);
hold off;

%% Plot the locus
figure(3);

hold on;

[v, c]= Function_VoronoiBounded(botZ(:, 1, end), botZ(:, 2, end), regionConfig.bndVertexes);
c = outlierVertexList(v, c, [0 regionConfig.maxX], [0 regionConfig.maxY]);

line(regionConfig.bndVertexes(:,1), regionConfig.bndVertexes(:,2), 'LineWidth',1.5,'LineStyle','-.','Color', [0,0,0]);
for i = 1:nAgent
    line(v(c{i},1), v(c{i},2), 'LineWidth',1.5,'LineStyle',':','Color', [0,0,0]);
    fill(v(c{i},1), v(c{i},2), Pcolor_milky(i,:));
end



for i = 1:nAgent
    
    botPoseX = reshape(botPose(i, 1, 1), [1, 1]);
    botPoseY = reshape(botPose(i, 2, 1), [1, 1]);
    plot(botPoseX, botPoseY,'x','LineWidth',1,'MarkerSize',10, 'Color', Pcolor(i,:));
    botPoseX = reshape(botPose(i, 1, :), [1, simConfig.maxIter]);
    botPoseY = reshape(botPose(i, 2, :), [1, simConfig.maxIter]);
    plot(botPoseX, botPoseY,'LineWidth',1,'LineStyle','-', 'Color', Pcolor(i,:));
    botPoseX = reshape(botPose(i, 1, end), [1, 1]);
    botPoseY = reshape(botPose(i, 2, end), [1, 1]);
    plot(botPoseX, botPoseY,'o','LineWidth',1,'MarkerSize',10, 'Color', Pcolor(i,:));
    
    botZX = reshape(botZ(i, 1, 1), [1, 1]);
    botZY = reshape(botZ(i, 2, 1), [1, 1]);
    plot(botZX, botZY,'x', 'LineWidth',2,'MarkerSize',10, 'Color', Pcolor_dark(i,:));
    botZX = reshape(botZ(i, 1, :), [1, simConfig.maxIter]);
    botZY = reshape(botZ(i, 2, :), [1, simConfig.maxIter]);
    plot(botZX, botZY, 'LineWidth',2,'LineStyle',':', 'Color', Pcolor_dark(i,:));
    botZX = reshape(botZ(i, 1, end), [1, 1]);
    botZY = reshape(botZ(i, 2, end), [1, 1]);
    plot(botZX, botZY,'o','LineWidth',2,'MarkerSize',10, 'Color', Pcolor_dark(i,:));
    
    botCzX = reshape(botCz(i, 1, 1), [1, 1]);
    botCzY = reshape(botCz(i, 2, 1), [1, 1]);
    plot(botCzX, botCzY,'x', 'LineWidth',2,'MarkerSize',10, 'Color', Pcolor_dark_2(i,:));
    botCzX = reshape(botCz(i, 1, :), [1, simConfig.maxIter]);
    botCzY = reshape(botCz(i, 2, :), [1, simConfig.maxIter]);
    plot(botCzX, botCzY, 'LineWidth',2, 'LineStyle','-.', 'Color', Pcolor_dark_2(i,:));
    botCzX = reshape(botCz(i, 1, end), [1, 1]);
    botCzY = reshape(botCz(i, 2, end), [1, 1]);
    plot(botCzX, botCzY,'o', 'LineWidth',2,'MarkerSize',10, 'Color', Pcolor_dark_2(i,:));
%    color = get(H, 'Color');
end
axis([0,regionConfig.maxX,0,regionConfig.maxY]);



% ylabel('Y Coordinate','Interpreter','latex', 'FontSize', 9);
ag = gca();
%ag.YRuler.Exponent = -2;
grid on;
set(gca,'GridLineStyle','-.', 'FontSize', 9);
% xlabel('X Coordinate','Interpreter','latex', 'FontSize', 10);

x0=500;
y0=200;
width=320;
height=240;

set(gcf,'position',[x0,y0,width,height]);
hold off;

