function y=lu(matrix)
	nRows=size(matrix,1)
	nColumns=size(matrix,2)

	u=matrix;
	l=eye(nRows,nColumns)
	i=2;
	j=1;

	inversa=[]
	while i<=nRows

		while j<=nColumns
			if j==1
				ch1=matrix(i,j);
				ch2=matrix(1,j);
			end
			
			u(i,j)=matrix(i,j)-matrix(1,j)*(ch1/ch2);
			if j<=(i-1)
				l(i,j)=ch1/ch2;
			end

			j++;
		end
		i++;
		j=1;
	end


	u
	l
	i=1;
	while i<=nRows
		d=zeros(nRows,1)
		d(i)=1;

		d=inv(l)*d;
		x=inv(u)*d;
		i++;
		inversa=[inversa x];
	end
	inversa
	inversa*matrix

end

