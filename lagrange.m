% 拉格朗日插值
function y = lagrange(x0,y0,x)
% x0: interpolation nodes
% y0: provided function values on interpolation nodes
% x: target nodes
% y: estimated function values on target nodes
n = length(x0);
m = length(x);
for i = 1:m
    z = x(i);
    s = 0;
    for k = 1:n
        p = 1;
        for j = 1:n
            if j ~= k
                p = p*(z-x0(j))/(x0(k)-x0(j));
            end
        end
        s = p*y0(k) + s;
    end
    y(i) = s;
end
