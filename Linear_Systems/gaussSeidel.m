function x = gaussSeidel(matrix, lambda, es) % Diagonally dominant matrix requirement

a = matrix(:,1:columns(matrix)-1);
x = zeros(rows(a),1);
b = matrix(:,columns(matrix));

for row = 1:rows(a)
    old = x(row);
    sum = b(row);
    for col = 1:columns(a)
        if(row != col)
            sum = sum-a(row,col)*x(col);
        endif
    endfor
    sum = sum/a(row,row);
    x(row) = lambda*sum + (1-lambda)*old;
endfor
iter = 1
x
do
    %sentinel = 1;
    iter = iter+1
    precise = 0;
    for row = 1:rows(a)
        old = x(row);
        sum = b(row);
        for col = 1:columns(a)
            if(row != col)
                sum = sum-a(row,col)*x(col);
            endif
        endfor
        sum = sum/a(row,row);
        x(row) = lambda*sum + (1-lambda)*old;
        %if(sentinel == 1 && x(row != 0)
        ea = abs((x(row)-old)/x(row))*100
        if(ea<es)
                %sentinel = 0;
             precise = precise + 1;
        endif
    endfor
    x
until(precise == rows(a) || iter == 10)

%until(sentinel == 1);
