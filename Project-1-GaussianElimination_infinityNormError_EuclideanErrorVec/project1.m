
h_1 = zeros(11, 11);       %hilebert 11 matrix
h_1 = hilb(11);
disp(h_1);
b_1=[1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1] %actual x soln
disp(b_1);
disp(h_1);
result_1 = h_1 * b_1 % calculated matrix b
disp(result_1);


h_2 = zeros(12, 12);       %hilebert 12 matrix
h_2 = hilb(12);
b_2=[1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1] %actual x soln
disp(h_2);
result_2 = h_2 * b_2 % calculated matrix b
disp(result_2);

h_3 = zeros(13, 13);       %hilebert 13 matrix
h_3 = hilb(13);
b_3=[1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1] %actual x soln
disp(h_3);

result_3 = h_3 * b_3 % calculated matrix b
disp(result_3);


A=h_3;
b=result_3;

count = 0;
[n, n] = size(A);     % Find size of matrix A
[n, k] = size(b);     % Find size of matrix b
x = zeros(n,k);      % Initialize x

for i = 1:n-1
    
    m = -A(i+1:n,i)/A(i,i); % make multipliers
    
    for j = i+1:n
        fprintf('Multiply the multiplier into the %i row, subtract %i row from the %i row\n', j, j, j+1);
        count=count+(n-i-1);
    end
    fprintf('Multipliers in order : %6.4f\n',m);
    
    
    A(i+1:n,:) = A(i+1:n,:) + m*A(i,:); %multiplication
    b(i+1:n,:) = b(i+1:n,:) + m*b(i,:); %multiplication
    
    
    disp(A);
    disp(b);
end;


% Use back substitution to find unknowns
x(n,:) = b(n,:)/A(n,n); %divide vector b by left element in matrix H
  
    for j = n:-1:i
        count=count+i;
    end
    
fprintf('x1....%i is :\n ', n ); % mark

error_list=zeros(11,1); % preallocate

for i = n:-1:1
    x(i,:) = (b(i,:) - A(i,i+1:n)*x(i+1:n,:))/A(i,i); %calculated equation divide vector b by left element in matrix H
    
    error_list(i) = x(i,:);         %add error element between exact solution and computed solution
    
    disp(x(i,:));  
    
    for j = i:n
        count = count +1;
    end
        
end

g = b_3 - error_list;

disp('error lists between exact solution and computed solution  : ')

for i = n:-1:1 %The loop is the printer for error list(exact soln - computed soln)
    
    fprintf(' %6.4f ', g(i));

end
fprintf('\nnumber of multiple count : ')
fprintf([num2str(count)]);  % number of multiplication and division

error_norm=norm(g, 'Inf')   %infinity norm of the error vector 


Euclid_error_norm = norm(g, 2)
