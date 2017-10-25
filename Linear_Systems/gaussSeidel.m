function x = gaussSeidel(matrix, lambda, es)

%a = repmat(matrix,rows(matrix),columns(matrix)-1);
%a = repmat(matrix, size(matrix,1), size(matrix,2)-1);
a = matrix(:,1:columns(matrix)-1);
x = zeros(rows(a),1);
b = matrix(:,columns(matrix));
for row = 1:rows(a)
    sum = b(row);
    for col = 1:columns(a)
        if(row != col)
            sum = sum-a(row,col)*x(col);
        endif
    endfor
    x(row) = sum/a(row,row);
endfor
iter = 1;
precise = false;
do
    %sentinel = 1;
    for row = 1:rows(a)
        iter
        x
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
        ea = abs((x(row)-old)/x(row))*100;
        if(ea<es)
                %sentinel = 0;
             precise = true;
        endif
    endfor
    iter = iter+1;
until(precise)

%until(sentinel == 1);
