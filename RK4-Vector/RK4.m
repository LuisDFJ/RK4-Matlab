function [t,u] = RK4( h, f, u0, dom )
    m = size(u0,1);
    t = dom(1):h:dom(2);
    u = zeros( m, length(t) );
    u(:,1) = u0;
    for n = 1 : length(t) - 1
        u(:,n+1) = u(:,n) + Delta(h, f, t(n), u(:,n));
    end
end

function d = Delta(h, f, tn, un)
    k1 = h*f(tn      , un);
    k2 = h*f(tn+0.5*h, un+0.5*k1);
    k3 = h*f(tn+0.5*h, un+0.5*k2);
    k4 = h*f(tn+h    , un+k3);
    d = k1/6 + k2/3 + k3/3 + k4/6;
end
