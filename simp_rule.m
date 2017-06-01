% 复合辛普森求积分
function I = simp_rule(f,a,b,M)
h = (b-a)/M;
s = 0;
for k=0:(M-1)
    x = a+h*k+0.5*h;
    s = s+feval(f,x);
end
s2 = 0;
for k=1:(M-1)
    x2 = a+h*k;
    s2 = s2+feval(f,x2);
end

I = h*(feval(f,a)+feval(f,b))/6+2/3*h*s+1/3*h*s2;
