function result = gaussJordan(matrix)
  m = matrix;
    m(1,:) = m(1,:).*(1/m(1,1));
    for i = 2:size(matrix,1)
        m(i,:) = m(i,:) - m(1,:).*(m(i,1)/m(1,1));
    endfor;
    m
  for traverse = 2:(size(matrix,2)-1)
    m(traverse,:) = m(traverse,:).*(1/m(traverse,traverse));
    for i = 1:size(matrix,1)
      if i != traverse
        m(i,:) = m(i,:) - m(traverse,:).*m(i,traverse);
      endif;
    endfor;
  endfor;
  m
  
  %For ones
  %%for cell = 1:size(m,1)
    %m(cell,:) = m(cell,:).*(1/m(cell,cell));
  %endfor;
  %columnLength = size(m,2);
  %rowLength = size(m,1);
  %m
  %For other zeroes
  %for traverse = rowLength-1:-1:1
   % for i = columnLength-1:-1:traverse+1
    %  traverse 
     % i
     % m(traverse,:) = m(traverse,:) - m(traverse+1,:).*(m(traverse,i)/m(traverse+1,i))
   % endfor;
  %endfor;
  