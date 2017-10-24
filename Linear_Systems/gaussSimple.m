function vec = gaussSimple(matrix)
  
m = matrix;
for traverse = 1:(size(matrix,2)-2)
  for i = traverse+1:size(matrix,1)
    m(i,:) = m(i,:) - m(traverse,:).*(m(i,traverse)/m(traverse,traverse));
  endfor;
endfor;

m

columnLength = size(m,2);
rowLength = size(m,1);

result = zeros(rowLength,1);

for row = rowLength:-1:1,
  for column = columnLength-1:-1:(row+1)
    m(row,columnLength) -= result(column)*m(row,column);
  endfor;
  result(row) = m(row,columnLength)/m(row,row);
endfor;

vec = result;



 
 