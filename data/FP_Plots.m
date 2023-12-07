% EAS 4810C Final Project
% Plot generation

%% Plot lift V vs weight

clc; clear; close all;

Lvoltage = [10.013
            9.835
            9.531
            8.673
            7.585
            6.732
            5.362
            4.532
            3.379
            2.412
            0.923
            0]; % +-0.003 V

weight =   [2.2670
            2.2470
            2.1971
            1.9974
            1.6977
            1.4980
            1.1984
            0.9987
            0.6990
            0.4994
            0.1998
            0.0000]; % +-0.0001 g

uV = 0.003*ones(size(Lvoltage));
uW = 0.0001*ones(size(weight));

weight = weight.*9.81;
        
coeff = polyfit(Lvoltage,weight,1);
trend = polyval(coeff,Lvoltage);
    
figure(1);
c = '#A6A6A6';
hold on;
errorbar(Lvoltage,weight,uV,'both','k.','MarkerSize',10);
plot(Lvoltage,trend,'Color',c,'LineWidth',2);
xlabel('Voltage (V)')
ylabel('Weight (N)')
grid on;
box off;
matlab2tikz('liftCal.tex','height','\fheight','width','\fwidth')

%% Plot drag V vs weight

clc; clear; close all;

Dvoltage = [-10.007
            -9.799
            -9.515
            -8.705
            -7.617
            -6.774
            -5.58
            -4.692
            -3.296
            -2.367
            -0.972
            -0.041]; % +-0.003 V

weight =   [2.2670
            2.2470
            2.1971
            1.9974
            1.6977
            1.4980
            1.1984
            0.9987
            0.6990
            0.4994
            0.1998
            0.0000]; % +-0.0001 g

uV = 0.001*ones(size(Dvoltage));
uW = 0.0001*ones(size(weight));

weight = weight.*9.81;
        
coeff = polyfit(Dvoltage,weight,1);
trend = polyval(coeff,Dvoltage);
    
figure(2);
c = '#A6A6A6';
hold on;
errorbar(Dvoltage,weight,uV,'both','k.','MarkerSize',10);
plot(Dvoltage,trend,'Color',c,'LineWidth',2);
xlabel('Voltage (V)')
ylabel('Weight (N)')
grid on;
box off;
matlab2tikz('dragCal.tex','height','\fheight','width','\fwidth')

%% Plot cant angle vs L/D

clc; clear; close all;

angle = [0
        10
        20
        30
        40
        50
        60
        70
        80
        90];

LD =   [11.64853273
        11.81669992
        11.85528946
        11.87318544
        11.90900866
        11.80731170
        11.67565529
        11.51966778
        11.34330254
        11.29101694];
    
figure(3);
hold on;
plot(angle,LD,'k.','MarkerSize',20);
xlabel('Cant Angle (deg)')
ylabel('L/D')
grid on;
box off;
matlab2tikz('XFLR5.tex','height','\fheight','width','\fwidth')

%% Plot cant angle vs L/D for both datasets

clc; clear; close all;

angle = [0
        10
        20
        30
        40
        50
        60
        70
        80
        90]; % +-1 deg

LD =   [11.64853273
        11.81669992
        11.85528946
        11.87318544
        11.90900866
        11.80731170
        11.67565529
        11.51966778
        11.34330254
        11.29101694];

LDexp = [10.36862817
        10.4378036
        10.44548976
        10.63946302
        10.69422496
        10.62381675
        10.60152292
        10.41259212
        10.390625
        10.07575758];

uAng = 1*ones(size(angle));
uLD = LDexp.*0.0033;

orange = '#FA4616';

figure(4);
hold on;
plot(angle,LD,'k.','MarkerSize',20);
errorbar(angle,LDexp,uLD,'both','diamond','MarkerEdgeColor',orange,'MarkerFaceColor',orange);
xlabel('Cant Angle (deg)')
ylabel('L/D')
legend({'XFLR5','Experimental'},'Location','northeast')
grid on;
box off;
matlab2tikz('bothStuff.tex','height','\fheight','width','\fwidth')

%% Plot linear model

clc; clear; close all;

angle = [0
        10
        20
        30
        40
        50
        60
        70
        80
        90];

LDexp = [10.36862817
        10.4378036
        10.44548976
        10.63946302
        10.69422496
        10.62381675
        10.60152292
        10.41259212
        10.390625
        10.07575758];
        
coeff = polyfit(angle,LDexp,1);
trend = polyval(coeff,angle);

orange = '#FA4616';

figure(5);
hold on;
plot(angle,LDexp,'square','MarkerEdgeColor',orange,'MarkerFaceColor',orange);
plot(angle,trend,'Color','k','LineWidth',2);
xlabel('Cant Angle (deg)')
ylabel('L/D')
grid on;
box off;
matlab2tikz('linear.tex','height','\fheight','width','\fwidth')

%% Plot quadratic model

clc; clear; close all;

angle = [0
        10
        20
        30
        40
        50
        60
        70
        80
        90];

LDexp = [10.36862817
        10.4378036
        10.44548976
        10.63946302
        10.69422496
        10.62381675
        10.60152292
        10.41259212
        10.390625
        10.07575758];
        
coeff = polyfit(angle,LDexp,2);
x = linspace(angle(1), angle(length(angle)));
trend = polyval(coeff,x);

orange = '#FA4616';

figure(6);
hold on;
plot(angle,LDexp,'square','MarkerEdgeColor',orange,'MarkerFaceColor',orange);
plot(x,trend,'Color','k','LineWidth',2);
xlabel('Cant Angle (deg)')
ylabel('L/D')
grid on;
box off;
matlab2tikz('quadratic.tex','height','\fheight','width','\fwidth')

%% Plot cubic model

clc; clear; close all;

angle = [0
        10
        20
        30
        40
        50
        60
        70
        80
        90];

LDexp = [10.36862817
        10.4378036
        10.44548976
        10.63946302
        10.69422496
        10.62381675
        10.60152292
        10.41259212
        10.390625
        10.07575758];
        
coeff = polyfit(angle,LDexp,3);
x = linspace(angle(1), angle(length(angle)));
trend = polyval(coeff,x);

orange = '#FA4616';

figure(7);
hold on;
plot(angle,LDexp,'square','MarkerEdgeColor',orange,'MarkerFaceColor',orange);
plot(x,trend,'Color','k','LineWidth',2);
xlabel('Cant Angle (deg)')
ylabel('L/D')
grid on;
box off;
matlab2tikz('cubic.tex','height','\fheight','width','\fwidth')

%% Plot quartic model

clc; clear; close all;

angle = [0
        10
        20
        30
        40
        50
        60
        70
        80
        90];

LDexp = [10.36862817
        10.4378036
        10.44548976
        10.63946302
        10.69422496
        10.62381675
        10.60152292
        10.41259212
        10.390625
        10.07575758];
        
coeff = polyfit(angle,LDexp,4);
x = linspace(angle(1), angle(length(angle)));
trend = polyval(coeff,x);

orange = '#FA4616';

figure(8);
hold on;
plot(angle,LDexp,'square','MarkerEdgeColor',orange,'MarkerFaceColor',orange);
plot(x,trend,'Color','k','LineWidth',2);
xlabel('Cant Angle (deg)')
ylabel('L/D')
grid on;
box off;
matlab2tikz('quartic.tex','height','\fheight','width','\fwidth')