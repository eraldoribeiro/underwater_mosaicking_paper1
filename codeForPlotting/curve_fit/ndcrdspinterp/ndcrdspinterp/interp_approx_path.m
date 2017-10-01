close all, clear all, clc





n=100;   

% %-----------------------------------------------% 
%%%% Cardinal Spline 3D Interpolation %%%%%%%%%%
% % We have 3D data (control points)
%  Px=[35  35  16 15 25 40 65 50 60 80 80];	
%  Py=[47  47  40 15 36 15 25 40 42 27 27];	
%  Pz=[-17 -17 20 15 36 15 25 20 25 -7 -7];	
%  
 load('../../position.mat');
 
Px = position(1,1:10:end);
Py = position(2,1:10:end);
%Pz = position(3,1:10:end);

% %-----------------------------------------------% 
%%%% Cardinal Spline 2D Interpolation %%%%%%%%%%
% % We have 2D data (control points)
%Px=[35 35 16 15 25 40 65 50 60 80 80];	
%Py=[47 47 40 15 36 15 25 40 42 27 27];	
% % Note first and last points are repeated so that spline passes
% % through all the control points

Px = [ Px(1) Px Px(end) ];
Py = [ Py(1) Py Py(end) ];



% when Tension=0 the class of Cardinal spline is known as Catmull-Rom spline
Tension=0; 
figure, hold on
for k=1:length(Px)-3
    
    [XiYi]=crdatnplusoneval([Px(k),Py(k)],[Px(k+1),Py(k+1)],[Px(k+2),Py(k+2)],[Px(k+3),Py(k+3)],Tension,n);
    
    % % XiYi is 2D interpolated data
    

    
    % Between each pair of control points plotting n+1 values of first two rows of XiYi 
    plot(XiYi(1,:),XiYi(2,:),'-b','linewidth',6) % interpolated data
    %drawnow;
    %plot(Px,Py,'ro','linewidth',2)          % control points
    hold on;

end
%title('\bf 2D Cardinal Spline')
xlabel('\bf X-axis','FontSize',16)
ylabel('\bf Y-axis','FontSize',16)
%legend('\bf Interpolated Data','\bf Control Points','Location','NorthEast')
grid on


set(gcf, 'color', 'white'); 
ylim([0  7000]);   % 7000 is the lowest 1000 after Py(end), manually set. 
set(gca, 'FontSize', 16); 
set(gca, 'LineWidth', 2); 























% 
% % Note first and last points are repeated so that spline curve passes
% % through all points
% 
% figure, hold on
% Tension=0; 
% for k=1:length(Px)-3
%     
%     [XiYiZi]=crdatnplusoneval([Px(k),Py(k),Pz(k)],[Px(k+1),Py(k+1),Pz(k+1)],[Px(k+2),Py(k+2),Pz(k+2)],[Px(k+3),Py(k+3),Pz(k+3)],Tension,n);
%     % % XiYiZi is 3D interpolated data
%     
%     % Between each pair of control points plotting n+1 values of first three rows of MatOut 
%      plot3(XiYiZi(1,:),XiYiZi(2,:),XiYiZi(3,:),'b','linewidth',4) 
%      plot3(Px,Py,Pz,'ro','linewidth',4) 
% end
% 
% title('\bf 3D Cardinal Spline')
% xlabel('\bf X-axis')
% ylabel('\bf Y-axis')
% zlabel('\bf Z-axis')
% legend('\bf Interpolated Data','\bf Control Points','Location','NorthEast')
% grid on
% 
% view(3);
% box;
% % %-----------------------------------------------% 

% % Using similar approach you can do Cardinal Spline interpolation for
% % N-Dimensional data


% % --------------------------------
% % This program or any other program(s) supplied with it does not provide any
% % warranty direct or implied.
% % This program is free to use/share for non-commerical purpose only. 
% % Kindly reference the author.
% % Author: Dr. Murtaza Khan
% % Author Reference : http://www.linkedin.com/pub/dr-murtaza-khan/19/680/3b3
% % Research Reference: http://dx.doi.org/10.1007/978-3-642-25483-3_14
% % --------------------------------
