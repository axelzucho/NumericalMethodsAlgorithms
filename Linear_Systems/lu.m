function [l,u]=lu(matrix)
	nRows=size(matrix,1)
	nColumns=size(matrix,2)

	u=matrix;
	l=eye(nRows,nColumns);
	i=2;
	j=1;
	rowToFix=0;
	colToFix=0;

	inversa=[];
	while i<=nRows

		while j<=nColumns
			if j==1
				ch1=matrix(i,j);
				ch2=matrix(1,j);
			end
			

			res=matrix(i,j)-matrix(1,j)*(ch1/ch2);
			
			if j<=(i-1)
				if res==0
					u(i,j)=res;
				else,
					rowToFix=i;
					colToFix=j;
					u(i,j)=res;
				end

				l(i,j)=ch1/ch2;
			else,
				u(i,j)=res;
			end

			j++;
		end
		if(rowToFix>0)
			[u,ch1,ch2]=fixRow(u,rowToFix,colToFix);
			l(rowToFix,colToFix)=ch1/ch2;
			rowToFix=0;
			colToFix=0;
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
	inversa*matrix

end

function [matrix,ch1,ch2]=fixRow(matrix,row,column)
	nColumns=size(matrix,2)

	ch1=matrix(row,column)
	ch2=matrix(row-1,column)

	i=1;
	while i<=nColumns
		
		rAct=matrix(row,i)
		rAnt=matrix(row-1,i)
		res=rAct-rAnt*(ch1/ch2)
		matrix(row,i)=res;
		i++;
	end
	matrix

end

