u0 = [ deg2rad( 90 ); 0 ];
f = @(t,u) Pendulum(t,u);
[t,u] = RK4( 0.05, f, u0, [0,10] );

animate( t,u )
pause(15)

for n = 1 : length( t )
    refreshdata;
    pause( 0.01 )
end



% Functions

function [U] = Pendulum( ~, u )
    g = 9.81; % [m/s^2]
    l = 0.5;  % [m]
    U = [
        u(2);
        -(g/l)*sin(u(1));
        ];
end


function animate(t,u)

figure;
set(0,'defaultfigurecolor',[1 1 1])

n = 1;
subplot( 1,3,1 )
h = plot( [ 0, 0.5*sin(u(n)) ], [ 0, -0.5*cos(u(n)) ], '-o', "LineWidth", 2, "MarkerSize", 10 );
h.XDataSource = "[ 0, 0.5*sin(u(1,n)) ]";
h.YDataSource = "[ 0, -0.5*cos(u(1,n)) ]";
axis equal;
axis off;
xlim( [-0.75,0.75] );
ylim( [-0.75,0.0] );
xlabel( "x" )
ylabel( "y" )

grid on;

subplot( 1,3,2 )
ht = plot( t(1:n),u(1,1:n) );
ht.XDataSource = "t(1:n)";
ht.YDataSource = "u(1,1:n)";
xlim( [0,max(t)] );
ylim( 1.25*[min(u(1,:)),max(u(1,:))] );
title( "Angular Position (\theta)" )
xlabel( "t" )
ylabel( "\theta" )
grid on;

subplot( 1,3,3 )
ho = plot( t(1:n),u(2,1:n) );
ho.XDataSource = "t(1:n)";
ho.YDataSource = "u(2,1:n)";
xlim( [0,max(t)] );
ylim( 1.25*[min(u(2,:)),max(u(2,:))] );
title( "Angular Velocity (\theta')" )
xlabel( "t" )
ylabel( "\theta" )
grid on;

end