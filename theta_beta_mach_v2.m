% This script will reproduce the theta-beta-mach relation figure from NACA
% Report 1135. This is also found in Anderson's textbook.

% Clear variables and initiate locus and sonic limit matrices
clear;
locus = [90 0];
SonicLimit = [90 0];
i = 1;

% Set the type of gas by prescribing the ratio of specific heats
gamma = 1.4;

% initiate figure
fig = figure;
%set(gcf, 'Position',  [0, 0, 1296, 720])
hold on

% The loops below provide the same spacing as the NACA report figure.
% Each loop will move through the function and create the plot.
% The plot is initially deflection angle as a function of shock angle,
% therefore the axes must be flipped. This is the reason for the [0 90]
% within the fplot command.
% The locus of each curve is found using fminsearch. This is needed to draw
% the line separating the strong shock solution from the weak shock
% solution.
% The sonic limit is plotted using the equation from the NACA report.
for M = 1.05:0.05:1.45
    f = @(beta) (atand(2.*cotd(beta).*((M^2*(sind(beta).^2)-1)./(M^2.*(gamma+cosd(2.*beta))+2))));
    [xm,ym] = fminsearch(@(t)-f(t),60);
    ym = -ym;
    locus = [locus; xm ym];
    fplot(f,[0 xm],'Color','k','HandleVisibility','off');
    fplot(f,[xm 90],'Color','k','HandleVisibility','off','LineStyle','--');
    %ShockAngle = asind(sqrt((3*M^2 - 2 + sqrt(3*(3*M^4 - 4*M^2 + 13)))/(7*M^2)));
    ShockAngle = asind(sqrt(((gamma+1)*M^2 - (3-gamma) + sqrt((gamma+1)*((gamma+1)*M^4 - 2*(3-gamma)*M^2 + (gamma+9))))/(4*gamma*M^2)));
    DefAngle = atand(2*cotd(ShockAngle)*((M^2*(sind(ShockAngle))^2-1)/(M^2*(gamma+cosd(2*ShockAngle))+2)));
    SonicLimit = [SonicLimit; ShockAngle DefAngle];
    formatspec = '%.2f';
    str = num2str(M,formatspec);
    x = xm+1;
    y = ym+0.1;
    text(x,y,str,'FontSize',6);
    i = i+1;
end
for M = 1.5:0.1:2.0
    f = @(beta) (atand(2.*cotd(beta).*((M^2*(sind(beta).^2)-1)./(M^2.*(gamma+cosd(2.*beta))+2))));
    [xm,ym] = fminsearch(@(t)-f(t),60);
    ym = -ym;
    locus = [locus; xm ym];
    formatspec = '%.1f';
    str = num2str(M,formatspec);
%     if str == '2.0'
%         fplot(f,[0 xm],'Color','m','HandleVisibility','off');
%         fplot(f,[xm 90],'Color','m','HandleVisibility','off','LineStyle','--');
%     else
%         fplot(f,[0 xm],'Color','k','HandleVisibility','off');
%         fplot(f,[xm 90],'Color','k','HandleVisibility','off','LineStyle','--');
%     end
    fplot(f,[0 xm],'Color','k','HandleVisibility','off');
    fplot(f,[xm 90],'Color','k','HandleVisibility','off','LineStyle','--');
    ShockAngle = asind(sqrt(((gamma+1)*M^2 - (3-gamma) + sqrt((gamma+1)*((gamma+1)*M^4 - 2*(3-gamma)*M^2 + (gamma+9))))/(4*gamma*M^2)));
    DefAngle = atand(2*cotd(ShockAngle)*((M^2*(sind(ShockAngle))^2-1)/(M^2*(gamma+cosd(2*ShockAngle))+2)));
    SonicLimit = [SonicLimit; ShockAngle DefAngle];
    formatspec = '%.1f';
    str = num2str(M,formatspec);
    x = xm+1;
    y = ym+0.1;
    text(x,y,str,'FontSize',6);
    i = i+1;
end
for M = 2.2:0.2:4.0
    f = @(beta) (atand(2.*cotd(beta).*((M^2*(sind(beta).^2)-1)./(M^2.*(gamma+cosd(2.*beta))+2))));
    [xm,ym] = fminsearch(@(t)-f(t),60);
    ym = -ym;
    locus = [locus; xm ym];
    fplot(f,[0 xm],'Color','k','HandleVisibility','off');
    fplot(f,[xm 90],'Color','k','HandleVisibility','off','LineStyle','--');
    ShockAngle = asind(sqrt(((gamma+1)*M^2 - (3-gamma) + sqrt((gamma+1)*((gamma+1)*M^4 - 2*(3-gamma)*M^2 + (gamma+9))))/(4*gamma*M^2)));
    DefAngle = atand(2*cotd(ShockAngle)*((M^2*(sind(ShockAngle))^2-1)/(M^2*(gamma+cosd(2*ShockAngle))+2)));
    SonicLimit = [SonicLimit; ShockAngle DefAngle];
    formatspec = '%.1f';
    str = num2str(M,formatspec);
    if str == '3.8'
        x = xm-2;
        y = ym;
    else
        x = xm+1;
        y = ym+0.1;
    end
    text(x,y,str,'FontSize',6);
    i = i+1;
end
for M = 4.5:0.5:5.0
    f = @(beta) (atand(2.*cotd(beta).*((M^2*(sind(beta).^2)-1)./(M^2.*(gamma+cosd(2.*beta))+2))));
    [xm,ym] = fminsearch(@(t)-f(t),60);
    ym = -ym;
    locus = [locus; xm ym];
    formatspec = '%.1f';
    str = num2str(M,formatspec);
%     if str == '5.0'
%         fplot(f,[0 xm],'Color','m','HandleVisibility','off');
%         fplot(f,[xm 90],'Color','m','HandleVisibility','off','LineStyle','--');
%     else
%         fplot(f,[0 xm],'Color','k','HandleVisibility','off');
%         fplot(f,[xm 90],'Color','k','HandleVisibility','off','LineStyle','--');
%     end
    fplot(f,[0 xm],'Color','k','HandleVisibility','off');
    fplot(f,[xm 90],'Color','k','HandleVisibility','off','LineStyle','--');
    ShockAngle = asind(sqrt(((gamma+1)*M^2 - (3-gamma) + sqrt((gamma+1)*((gamma+1)*M^4 - 2*(3-gamma)*M^2 + (gamma+9))))/(4*gamma*M^2)));
    DefAngle = atand(2*cotd(ShockAngle)*((M^2*(sind(ShockAngle))^2-1)/(M^2*(gamma+cosd(2*ShockAngle))+2)));
    SonicLimit = [SonicLimit; ShockAngle DefAngle];
    str = num2str(M);
    x = xm+1;
    y = ym+0.1;
    text(x,y,str,'FontSize',6);
    i = i+1;
end
for M = 6.0:2.0:10.0
    f = @(beta) (atand(2.*cotd(beta).*((M^2*(sind(beta).^2)-1)./(M^2.*(gamma+cosd(2.*beta))+2))));
    [xm,ym] = fminsearch(@(t)-f(t),60);
    ym = -ym;
    locus = [locus; xm ym];
    fplot(f,[0 xm],'Color','k','HandleVisibility','off');
    fplot(f,[xm 90],'Color','k','HandleVisibility','off','LineStyle','--');
    ShockAngle = asind(sqrt(((gamma+1)*M^2 - (3-gamma) + sqrt((gamma+1)*((gamma+1)*M^4 - 2*(3-gamma)*M^2 + (gamma+9))))/(4*gamma*M^2)));
    DefAngle = atand(2*cotd(ShockAngle)*((M^2*(sind(ShockAngle))^2-1)/(M^2*(gamma+cosd(2*ShockAngle))+2)));
    SonicLimit = [SonicLimit; ShockAngle DefAngle];
    str = num2str(M);
    x = xm+1;
    y = ym+0.1;
    text(x,y,str,'FontSize',6);
    i = i+1;
end
M = 20;
f = @(beta) (atand(2.*cotd(beta).*((M^2*(sind(beta).^2)-1)./(M^2.*(gamma+cosd(2.*beta))+2))));
[xm,ym] = fminsearch(@(t)-f(t),60);
ym = -ym;
locus = [locus; xm ym];
fplot(f,[0 xm],'Color','k','HandleVisibility','off');
fplot(f,[xm 90],'Color','k','HandleVisibility','off','LineStyle','--');
ShockAngle = asind(sqrt(((gamma+1)*M^2 - (3-gamma) + sqrt((gamma+1)*((gamma+1)*M^4 - 2*(3-gamma)*M^2 + (gamma+9))))/(4*gamma*M^2)));
DefAngle = atand(2*cotd(ShockAngle)*((M^2*(sind(ShockAngle))^2-1)/(M^2*(gamma+cosd(2*ShockAngle))+2)));
SonicLimit = [SonicLimit; ShockAngle DefAngle];
str1 = '\leftarrow';
str2 = num2str(M);
str = strcat(str1,str2);
x = xm-1;
y = ym;
text(x,y,str,'FontSize',6);

M = 100000;
f = @(beta) (atand(2.*cotd(beta).*((M^2*(sind(beta).^2)-1)./(M^2.*(gamma+cosd(2.*beta))+2))));
[xm,ym] = fminsearch(@(t)-f(t),60);
ym = -ym;
locus = [locus; xm ym];
fplot(f,[0 xm],'Color','k','HandleVisibility','on','DisplayName','Weak shock wave');
fplot(f,[xm 90],'Color','k','HandleVisibility','on','DisplayName','Strong shock wave','LineStyle','--');
ShockAngle = asind(sqrt(((gamma+1)*M^2 - (3-gamma) + sqrt((gamma+1)*((gamma+1)*M^4 - 2*(3-gamma)*M^2 + (gamma+9))))/(4*gamma*M^2)));
DefAngle = atand(2*cotd(ShockAngle)*((M^2*(sind(ShockAngle))^2-1)/(M^2*(gamma+cosd(2*ShockAngle))+2)));
SonicLimit = [SonicLimit; ShockAngle DefAngle];
x = xm+1;
y = ym+0.1;
text(x,y,'\infty','FontSize',6);

%Format plot
view([90 -90])
ylim([0 48])
grid on
grid minor
ax = gca;
ax.XTick = 0:10:90;
ax.YTick = 0:4:48;
ax.XAxis.MinorTickValues = 1:1:90;
ax.YAxis.MinorTickValues = 0.5:0.5:48;
ax.FontSize = 18;
xlabel('Shock-wave angle \beta, degrees');
ylabel('Deflection angle \theta, degrees');
%daspect([3 1 1]);

%Plot strong-weak shock division
plot(locus(:,1),locus(:,2),'-r','HandleVisibility','off')

% Plot sonic limit
plot(SonicLimit(:,1),SonicLimit(:,2),'-.b','DisplayName','Sonic Limit (M_2 = 1.0)')
legend('location',[0.5 0.2 0.3 0.1])