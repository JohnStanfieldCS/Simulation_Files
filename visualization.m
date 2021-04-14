function visualization(Xp,Re)
% Orbit Visualization


figure(1);
plot3(Xp(:,1), Xp(:,2), Xp(:,3),'g-','linewidth',3);
xlabel('x (km)','fontsize',16);ylabel('y (km)','fontsize',16); 
zlabel('z (km)','fontsize',16);
set(gca,'fontsize',14)

% Plotting the Earth using Matlabsphere command
[XS, YS, ZS] = sphere(30); 
hold on;
surf(XS*Re, YS*Re, ZS*Re);
axis([-1.5e4, 1.5e4, -1.5e4, 1.5e4, -1.5e4, 1.5e4])
hold off;
end