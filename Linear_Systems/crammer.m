function res = crammer(matrix)
  rowNum = size(matrix,1);
  colNum = size(matrix,2);
  determinant = det(matrix(:,1:colNum-1));
  res = zeros(rowNum,1);
  for i = 1:rowNum
    newMatrix = [matrix(:,1:i-1), matrix(:,colNum), matrix(:,i+1:colNum-1)]
    res(i) = det(newMatrix)/determinant;
  endfor;
  
    
  