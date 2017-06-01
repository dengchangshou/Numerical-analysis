% 矩阵的LU分解法
% PA=LU: factorization with pivoting. To construct the solution to the 
% linear system AX=B, where A is a non-singular matrix.

function X = lufact(A,B)

% input A - a nxn matrix
% B - a nx1 matrix
% output X - a nx1 maxtrix containing the solution to AX=B

[N,N] = size(A);
X = zeros(N,1); % initialization
Y = zeros(N,1);
C = zeros(1,N); % temporary storage matrix C
R = 1:N;     % permutation information matrix

for p = 1:N-1,
    % find the pivot row for column p
    [max1,j] = max(abs(A(p:N,p)));
    % interchange row p and j
    C = A(p,:);
    A(p,:) = A(j+p-1,:);
    A(j+p-1,:) = C;
    d = R(p);
    R(p) = R(j+p-1);
    R(j+p-1) = d;
    if A(p,p) == 0,
        error('A is singular, No unique solution.');
        break
    end
    % calculate multiplier and place in sub-diagnoal portion of A
    for k = (p+1):N,
        mult = A(k,p)/A(p,p);
        A(k,p) = mult;
        A(k,(p+1):N) = A(k,(p+1):N) - mult*A(p,(p+1):N);
    end
end
% solve for Y
Y(1) = B(R(1));
for k = 2:N,
    Y(k) = B(R(k)) - A(k,1:(k-1))*Y(1:(k-1));
end
% solve for X
X(N) = Y(N)/A(N,N);
for k = (N-1):-1:1,
    X(k) = (Y(k)-A(k,(k+1):N)*X((k+1):N))/A(k,k);
end