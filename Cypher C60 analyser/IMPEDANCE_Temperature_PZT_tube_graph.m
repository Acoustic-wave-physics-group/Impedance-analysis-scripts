%%2D
%% impedance
figure
h1 = loglog(Z_1_AIR_23DEGREE_170912_01_imp.FREQUENCY,...
              Z_1_AIR_23DEGREE_170912_01_imp.IMPEDANCE,'-ko');         
hold on
h2 = loglog(Z_2_WATER_60DEGREE_170912_01_imp.FREQUENCY,...
              Z_2_WATER_60DEGREE_170912_01_imp.IMPEDANCE,'--ro');
hold on
h3 = loglog(Z_3_WATER_53DEGREE_170912_01_imp.FREQUENCY,...
              Z_3_WATER_53DEGREE_170912_01_imp.IMPEDANCE,'--bo');
hold on
h4 = loglog(Z_4_WATER_47DEGREE_170912_01_imp.FREQUENCY,...
              Z_4_WATER_47DEGREE_170912_01_imp.IMPEDANCE,'--go');
hold on
h5 = loglog(Z_5_WATER_42DEGREE_170912_01_imp.FREQUENCY,...
              Z_5_WATER_42DEGREE_170912_01_imp.IMPEDANCE,'--mo');

hold on
h6 = loglog(Z_6_WATER_38DEGREE_170912_01_imp.FREQUENCY,...
              Z_6_WATER_38DEGREE_170912_01_imp.IMPEDANCE,'--mo');
hold on
h7 = loglog(Z_7_WATER_34DEGREE_170912_01_imp.FREQUENCY,...
              Z_7_WATER_34DEGREE_170912_01_imp.IMPEDANCE,'--mo'); 
          
hold on
h8 = loglog(Z_8_WATER_32DEGREE_170912_01_imp.FREQUENCY,...
              Z_8_WATER_32DEGREE_170912_01_imp.IMPEDANCE,'--mo');  
    
hold on
h9 = loglog(Z_9_WATER_28DEGREE_170912_01_imp.FREQUENCY,...
              Z_9_WATER_28DEGREE_170912_01_imp.IMPEDANCE,'--mo');  
          
hold on
          
set(h1, 'MarkerSize', 1, 'MarkerFaceColor', [0,0,0],'color',[0,0,0],'LineStyle','-','LineWidth',1,  ...
    'MarkerEdgeColor', [0,0,0]);

set(h2, 'MarkerSize', 1, 'MarkerFaceColor', [1,0,0],'color',[1,0,0],'LineStyle','-','LineWidth',2,  ...
    'MarkerEdgeColor', [1,0,0]);

set(h3, 'MarkerSize', 1, 'MarkerFaceColor', [1,0,0.2],'color',[1,0,0.2],'LineStyle','-','LineWidth',1,  ...
    'MarkerEdgeColor', [1,0,0.2]);

set(h4, 'MarkerSize', 1, 'MarkerFaceColor', [0.8,0,0.4],'color',[0.8,0,0.4],'LineStyle','-','LineWidth',1,  ...
    'MarkerEdgeColor', [0.8,0,0.4]);

set(h5, 'MarkerSize', 1, 'MarkerFaceColor', [0.6,0,0.6],'color',[0.6,0,0.6],'LineStyle','-','LineWidth',1,  ...
    'MarkerEdgeColor', [0.6,0,0.6]);

set(h6, 'MarkerSize', 1, 'MarkerFaceColor', [0.4,0,0.8],'color',[0.4,0,0.8],'LineStyle','-','LineWidth',1,  ...
    'MarkerEdgeColor', [0.4,0,0.8]);

set(h7, 'MarkerSize', 1, 'MarkerFaceColor', [0.2,0,0.8],'color',[0.2,0,0.8],'LineStyle','-','LineWidth',1,  ...
    'MarkerEdgeColor', [0.2,0,0.8]);

set(h8, 'MarkerSize', 1, 'MarkerFaceColor', [0,0,1],'color',[0,0,1],'LineStyle','-','LineWidth',1,  ...
    'MarkerEdgeColor', [0,0,1]);

set(h9, 'MarkerSize', 1, 'MarkerFaceColor', [0,0,1],'color',[0,0,1],'LineStyle','-','LineWidth',2,  ...
    'MarkerEdgeColor', [0,0,1]);



xlabel('Frequency (Hz)') 
ylabel('|Z| (\Omega)')

title({[]});
set(get(gca,'XLabel'),'FontSize', 40, 'fontName','Arial');
set(get(gca,'YLabel'),'FontSize', 40, 'fontName','Arial');
set(gca, 'FontSize', 40, 'fontName','Arial');
set(gca,'OuterPosition',[0 0 1 1]);
set(gca,'Position',[0.2 0.2 0.7 0.7]);

set(gca, ...
  'Box'         , 'on'     , ...
  'TickDir'     , 'in'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'off'      , ...
  'YMinorTick'  , 'off'      , ...
  'XGrid'       , 'off'      , ...
  'YGrid'       , 'off'      , ...
  'XColor'      , [0 0 0], ...
  'YColor'      , [0 0 0], ...
  'LineWidth'   , 1         );

axis([5e5 1.3e6 1 600])
set(gca, 'XScale', 'log')

% set(gca,'XTick',[0.1 10 1000 100000]);
% set(gca,'YTick',[0 1 10 100 1000 10000 100000 1000000]);

set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperSize', [20 8]);
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperPosition', [0 0 20 8]);

set(gcf, 'renderer', 'painters');

print(gcf, '-dpdf', 'Z_PEDOT_psspercent_NEUTRAL.pdf');
print(gcf, '-dpng', 'Z_PEDOT_psspercent_NEUTRAL.png');
print(gcf, '-depsc2', 'Z_PEDOT_psspercent_NEUTRAL.eps');
       
       
       
       
       
       