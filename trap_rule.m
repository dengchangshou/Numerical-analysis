% 复合梯形求积分
function s = trap_rule(f,a,b,n)
% f表示被积函数
% a, b表示积分上下限
% n 是子区间的个数
h = (b-a)/n;
s = 0;
for k=1:(n-1)
    x = a + h*k;
    s = s+feval(f,x);
end
s = h*(feval(f,a)+feval(f,b))/2+h*s;

