n=20
h_1 = zeros(n, n);       %Initialize n by n matrix
h_1 = hilb(n);           %hilebert 20 matrix
disp(h_1);
x = zeros(n,1)          %X_0
r = zeros(n,1)          %residual
b=zeros(n,1)            % b vector


for i = 1:n
    b(i)=sum(h_1(i,:))   %The loop to sum row of h as b vector
    x(i)=0               % Set x_0 vector value . 1, 0, 0, 0, 0, 0, 0, 0...
end
x(1) = 1 %The number of first row X_0

r = h_1*x - b;        %r_0
v = r * -1            %v_0
disp(r)
t = (transpose(r) * v)/(transpose(v)*h_1*v)*-1 %t_0

error_norm=norm(r, 'Inf')           %infinity norm for X_0

if (error_norm < 0.001) % Determine whether |norm X_0|infinity is less than 0.001 or not
    p=1;
else
    p=75;              %Set number of iteration 
end

j=0;                %Counter for number of iteration
for i = 1:p         % Start from x_1 . and calculate conjugate gradient through loop   
    
    r = h_1*x-b;        %The previous steps to get r, t, v, X are repeated during 75-iterations. 
    v = r*-1
    t = (transpose(r) * v)/(transpose(v)*h_1*v)*-1
   
    x = x +t*v;
    j=i;
    fprintf('The residual vector in X_%i \n', i )
    fprintf('%6.4f\n', r);  %residual vector format
    
    error_norm = norm(r, 'Inf')     %|norm X_n|infinity 
    
    if (error_norm < 0.001)         % If |norm X_n|infinity is less than 0.0001. The loop end.
        break;
    end
end

fprintf('The number of iteration : %6i\n', j);
fprintf('|Residual for X_n| infinity : ');
disp(error_norm)            % the last result for number of iteration and |norm X_n|infinity
    





