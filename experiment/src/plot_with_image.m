function plot_with_image(image_name, REGION_CONFIG, CONTROL_PARAM, botZ, botCz, v, c)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Zengjie Zhang
% Date: July 20, 2022

% Run main.m to perform the simulation.
% Run plot_results to plot the data.

    
    sz = size(botZ);
    nAgent = sz(1);

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
    
    
    
    
    %% Plot the locus
    figure();
    hold on;
    
    line(REGION_CONFIG.BOUNDARIES_VERTEXES(:,1), REGION_CONFIG.BOUNDARIES_VERTEXES(:,2), 'LineWidth',1.5,'LineStyle','-.','Color', [0,0,0]);
    for i = 1:nAgent
        line(v(c{i},1), v(c{i},2), 'LineWidth',1.5,'LineStyle',':','Color', [0,0,0]);
        fill(v(c{i},1), v(c{i},2), Pcolor_milky(i,:), 'FaceAlpha',0.4);
    end
    
    for i = 1:nAgent
        
        botZX = reshape(botZ(i, 1, end), [1, 1]);
        botZY = reshape(botZ(i, 2, end), [1, 1]);
        plot(botZX, botZY,'o','LineWidth',2,'MarkerSize',6, 'Color', Pcolor_dark(i,:));
        
        circle(botZX, botZY, CONTROL_PARAM.V_CONST/CONTROL_PARAM.W_ORBIT, Pcolor_dark_2(i,:));
    
    
        botCzX = reshape(botCz(i, 1, end), [1, 1]);
        botCzY = reshape(botCz(i, 2, end), [1, 1]);
        plot(botCzX, botCzY,'o', 'LineWidth',2,'MarkerSize',6, 'Color', Pcolor(i,:));
    
    end
    
    I = imread(image_name); 
    h = image([0 REGION_CONFIG.REGION_MAX_X], [REGION_CONFIG.REGION_MAX_Y 0],I); 
    uistack(h,'bottom')
    
    axis([0, max(REGION_CONFIG.BOUNDARIES_VERTEXES(:,1)), 0, max(REGION_CONFIG.BOUNDARIES_VERTEXES(:,2))]);
    
    ag = gca();
    grid on;
    set(gca,'GridLineStyle','-.', 'FontSize', 9);
    
    x0=500;
    y0=200;
    width=320;
    height=240;
    
    set(gcf,'position',[x0,y0,width,height]);
    hold off;
    
    
    
    function h = circle(x, y, r, col)
        th = 0:pi/50:2*pi;
        xunit = r * cos(th) + x;
        yunit = r * sin(th) + y;
        h = plot(xunit, yunit, 'LineWidth',1,'LineStyle','-', 'Color', col);
    end
end