% 牛顿插值法，给定一系列插值点（x,y),得到xi对应的牛顿插值多项的值yi
function yi = Newton(x,y,xi)
    n = length(x);  % 输入x的个数
    m = length(y);  % 输入y的个数
    num = length(xi); % 输入xi的个数
    A = zeros(n);   % 定义均差表
    A(:,1) = y;     % 均差表第一列为y
    for j=2:n       % j为列
        for i=1:(n-j+1)  % i为行
            A(i,j)=(A(i+1,j-1)-A(i,j-1))/(x(i+j-1)-x(i));  % 计算均差表
        end
    end
    A
    for p = 1:num
        z = xi(p);
    % 根据均差表求xi对应的牛顿插值多项的值yi
    N(1,1) = A(1,1);
    for j=2:n
        T = 1;
        for i=1:j-1
            T = T*(z-x(i));
        end
        N(j) = A(1,j)*T;
     end
     yi(p) = sum(N);  % yi的值    
    end 
end


