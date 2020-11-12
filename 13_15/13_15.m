function [x,fx]=Newton(x0,maxit,es)
    for i=1:maxit
        xold=x0;
        x0=x0-df(x0)/ddf(x0);
        e=abs((x0-xold)/x0);
        fprintf("%d %g %g %g %g\n",i,x0,df(x0),ddf(x0),e);
        if e<es break end
    end
    x=x0;
    fx=f(x);
end

function y=f(x)
    y=2*sin(x)-x^2/10;
end

function y=df(x)
    y=2*cos(x)-x/5;
end

function y=ddf(x)
    y=-2*sin(x)-0.2;
end

% octave:5> [x,fx]=Newton(2.5,5,0.00001)
% 1 0.995082 0.889853 -1.87761 1.51236
% 2 1.46901 -0.0905823 -2.18965 0.322618
% 3 1.42764 -0.000197339 -2.17954 0.0289767
% 4 1.42755 -1.16979e-09 -2.17952 6.34245e-05
% 5 1.42755 -1.11022e-16 -2.17952 3.75972e-10
% x =  1.4276
% fx =  1.7757