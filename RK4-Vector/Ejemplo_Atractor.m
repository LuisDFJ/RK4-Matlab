f = @(t,u) Attractor(t,u);
u0 = [ 1; 1; 1 ];
[t,u] = RK4( 0.01, f, u0, [0,100] );
u0 = [ 1; 1; 0.99999 ];
[~,v] = RK4( 0.01, f, u0, [0,100] );

animate( t,u, v )

pause(20)
for i = 1 : length( t ) / 2
    n = i*2;
    refreshdata;
    pause( 0.0001 )
end



% Functions

function [U] = Attractor( ~, u )
    s = 10;
    b = 8/3;
    r = 28;
    U = [
        s*( u(2) - u(1) );
        u(1)*(r - u(3)) - u(2);
        u(1)*u(2) - b*u(3);
        ];
end

function animate(t,u,v)

figure;
set(0,'defaultfigurecolor',[1 1 1])

n = 1;
subplot( 1,4,1 )
h = plot3( u(1,1:n), u(2,1:n), u(3,1:n) , '-', "Color", "#F61067" );
h.XDataSource = "u(1,1:n)";
h.YDataSource = "u(2,1:n)";
h.ZDataSource = "u(3,1:n)";
hold on;

hp = plot3( u(1,n), u(2,n), u(3,n) , 'o', "Color", "#F61067", "MarkerFaceColor","#F61067" );
hp.XDataSource = "u(1,n)";
hp.YDataSource = "u(2,n)";
hp.ZDataSource = "u(3,n)";

g = plot3( v(1,1:n), v(2,1:n), v(3,1:n) , '-', "Color", "#00F0B5" );
g.XDataSource = "v(1,1:n)";
g.YDataSource = "v(2,1:n)";
g.ZDataSource = "v(3,1:n)";

gp = plot3( v(1,n), v(2,n), v(3,n) , 'o', "Color", "#00F0B5", "MarkerFaceColor", "#00F0B5" );
gp.XDataSource = "v(1,n)";
gp.YDataSource = "v(2,n)";
gp.ZDataSource = "v(3,n)";

axis equal;
axis off;

xlabel( "x" )
ylabel( "y" )
zlabel( "z" )
set(gca,'view',[0 0])

grid on;

subplot( 1,4,2 )
ht = plot( t(1:n),u(1,1:n), "Color", "#F61067" );
ht.XDataSource = "t(1:n)";
ht.YDataSource = "u(1,1:n)";
hold on;
gt = plot( t(1:n),v(1,1:n), "Color", "#00F0B5" );
gt.XDataSource = "t(1:n)";
gt.YDataSource = "v(1,1:n)";

xlim( [0,max(t)] );
ylim( 1.25*[min(u(1,:)),max(u(1,:))] );
title( "X Position" )
xlabel( "t" )
ylabel( "x(t)" )
grid on;

subplot( 1,4,3 )
ho = plot( t(1:n),u(2,1:n), "Color", "#F61067" );
ho.XDataSource = "t(1:n)";
ho.YDataSource = "u(2,1:n)";
hold on;

go = plot( t(1:n),v(2,1:n), "Color", "#00F0B5" );
go.XDataSource = "t(1:n)";
go.YDataSource = "v(2,1:n)";

xlim( [0,max(t)] );
ylim( 1.25*[min(u(2,:)),max(u(2,:))] );
title( "Y Position" )
xlabel( "t" )
ylabel( "y(t)" )
grid on;

subplot( 1,4,4 )
ho = plot( t(1:n),u(3,1:n), "Color", "#F61067" );
ho.XDataSource = "t(1:n)";
ho.YDataSource = "u(3,1:n)";
hold on;

go = plot( t(1:n),v(3,1:n), "Color", "#00F0B5" );
go.XDataSource = "t(1:n)";
go.YDataSource = "v(3,1:n)";

xlim( [0,max(t)] );
ylim( 1.25*[min(u(3,:)),max(u(3,:))] );
title( "Z Position" )
xlabel( "t" )
ylabel( "z(t)" )
grid on;

end