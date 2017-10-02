%% Detect self-intersections


close all;
addpath(genpath('.'));


% Load (x,y,t) data as a 3xN matrix. This data is the estimated trajectory
% of the camera as it records a parallel strip of the quadrat. 
load('positiondata.mat');

%% Display the raw data in 3-D 
plot3(position(1,:),position(2,:),position(3,:),'r-','LineWidth',4);
ax = gca;
ax.XTick = [];
ax.YTick = [];
ax.ZTick = [];
box on
title('Camera Trajectory Example in 3-D Raw Data'); 


%% Fit a spline curve to the points. Using all points. 
% If needed, re-sample the data to reduce the number of points. 

% This step fits the spline but it does not plot the result. It returns the
% spline points so we can use them later
p = fnplt(cscvn(position),'r',4);

% This step fits the spline and plots the curve.
figure;
fnplt(cscvn(position),'r',4);
hold off
title('Camera Trajectory Example in 3-D'); 


%% Fitting/plot the spline again but a subset of the original points.
subSetPts = position(1:3,1:50:end);  
figure;
fnplt(cscvn(subSetPts),'r',4);
hold off
title('Camera Trajectory Example in 3-D'); 


%% Show splines in 2-D
figure;
fnplt(cscvn(position(1:2,:)),'r',4);
hold off
title('Camera Trajectory Example in 2-D (all points)'); 

figure;
fnplt(cscvn(subSetPts(1:2,:)),'r',4);
hold off
title('Camera Trajectory Example in 2-D (subset)'); 

%% Fit spline to original points and detect self-intersections

pts = fnplt(cscvn(position(1:2,:)),'r',4);

% Detect self intersections
x = pts(1,:);
y = pts(2,:);
[x0,y0,segments]=selfintersect(x,y);

% Display self intersections on the original curve 
fnplt(cscvn(position(1:2,:)),'r',4);
hold on; 
plot(x0,y0,'ro','Marker','o','MarkerSize',10,'MarkerEdgeColor','b','MarkerFaceColor','b');



