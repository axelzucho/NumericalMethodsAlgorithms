function [inversa]=luinverse(matrix)
	nRows=size(matrix,1)
	nColumns=size(matrix,2)
	inversa=[];
	[l,u]=lu(matrix);
	i=1;
	while i<=nRows
		d=zeros(nRows,1)
		d(i)=1;

		d=inv(l)*d;
		x=inv(u)*d;
		i++;
		inversa=[inversa x];
	end
	inversa*matrix

end



