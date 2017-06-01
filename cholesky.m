% cholesky分解法解线性方程
function x = cholesky(A,b)
n = length(A);
L = zeros(n);
for j = 1:n
    sum = 0;
    for k = 1:j-1
        sum = sum + L(j,k)^2;
    end
    L(j,j) = sqrt(A(j,j)-sum);
    for i = j+1:n
        L(i,j) = A(i,j);
        for k = 1:j-1
            L(i,j) = L(i,j) - L(i,k)*L(j,k);
        end
        L(i,j) = L(i,j)/L(j,j);
    end
end
L
x = zeros(n,1);
y = zeros(n,1);
y(1) = b(1)/L(1,1);
for i = 2:n
    ly = 0;
    for k = 1:i-1
        ly = ly+L(i,k)*y(k);
    end
    y(i) = (b(i)-ly)/L(i,i);
end
x(n) = b(n);
for i = n-1:-1:1
    lx = 0;
    for k = i+1:n
        lx = lx+L(k,i)*x(k);
    end
    x(i) = (b(i)-lx)/L(i,i);
end 
y