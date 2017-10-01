clearvars;close all;clc;
rng(1) % initialise random numbers generation
%
% Multiple clusters two variables : magniture (r) and direction (\theta)
Nsensors =3; % number of clusters
Nsamples = 100; % number of samples


%COLOR = parula(Nsensors); % color choice

% Red, green, blue
mymap = [1 0 0
    0 1 0
    0 0 1];

COLOR = mymap;




%% generation of records. 

% Cluster centers. Number of centers must be equal to the number of clusters. 
% ClusterCenters = [180,270,0,90]'; Use this one for 4 cluster centers
DirClusterCenters = [180,270,90]'; 

Dir = DirClusterCenters * ones(1,Nsamples)+...
    20.*randn(Nsensors,Nsamples); % #1 Mean wind direction

% Mean magnitudes 
MagClusterCenters = [ 1, .3, .9 ]';

%U = abs(1.*randn(Nsensors,Nsamples)+...
%    ones(Nsensors,1)*linspace(5,20,Nsamples)); %#2 Mean wind  speed

U = MagClusterCenters * ones(1,Nsamples)+...
    60.*randn(Nsensors,Nsamples); % #1 Mean wind speed



% plot the wind rose
jj=1;
figure
for ii=1:Nsensors,
    h{ii} = ScatterWindRose(Dir(ii,:),U(ii,:),'labelY','radius (r)');
    set(h{ii},'Marker','o','markerfacecolor',...
        COLOR(ii,:),'markeredgecolor','k')
	hold on
    set(h{ii},'color',COLOR(ii,:))
    leg{jj} = ['cluster ',num2str(jj)];
    jj=jj+1;
end
set(gcf,'color','w');
legend([h{:}],leg,'location','NorthEastOutside');

% put axis and text on top
th1 = findobj(gcf,'Type','text');
th2 = findobj(gcf,'Type','line');
for jj = 1:length(th1),
    uistack(th1(jj),'top');
    set(th1(jj),'FontSize',14);
end
for jj = 1:length(th2),
    uistack(th2(jj),'top');
    set(th2(jj),'LineWidth',1);
end

%set(gca,'LineWidth',2);

