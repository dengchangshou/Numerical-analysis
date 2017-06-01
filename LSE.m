% 最小拟合曲线
x = input('enter data pairs in a matrix form: ');
a = ones(8,2);
a(:,2) = x(:,1);     % 1-order
a(:,3) = x(:,1).^2;  % 2-order
a(:,4) = x(:,1).^3;  % 3-order
a(:,5) = x(:,1).^4;  % 4-order
b = x(:,2);
yy = inv(a'*a)*a'*b;
xx = linspace(-4,4,50);
y = yy(1) + yy(2)*xx;                                               % 1-order
y = yy(1) + yy(2)*xx + yy(3)*xx.^2;                                 % 2-order
y = yy(1) + yy(2)*xx + yy(3)*xx.^2 + yy(4)*xx.^3;                   % 3-order
y = yy(1) + yy(2)*xx + yy(3)*xx.^2 + yy(4)*xx.^3 + yy(5)*xx.^4;     % 4-order
figure;
plot(xx,y);
hold on
for ii = 1:size(x,1),
    plot(x(ii,1),x(ii,2),'rx');
    hold on
end
hold off
