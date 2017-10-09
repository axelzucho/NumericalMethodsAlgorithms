
function y=bairstow(array,r,s, es = .1)

	groots=[];



  while columns(array)>3
  	array=rot90(array);
		array=rot90(array);

  	n=columns(array);
  	eas=1;
  	ear=1;

		while abs(eas)>=es || abs(ear)>=es
			bn=array(n);
			bn1=array(n-1)+(r*bn);

			b(n)=bn;
			b(n-1)=bn1;

			i=n-2;
			while i>0
				b(i)=array(i)+(r*b(i+1))+(s*b(i+2));
				i--;
			end
			b


			cn=bn;
			cn1=bn1+r*cn;
			c(n)=cn;
			c(n-1)=cn1;
			i=n-2;
			while i>1
				c(i)=b(i)+(r*c(i+1))+(s*c(i+2));
				i--;
			end
			c

			REF = [c(2),c(3),c(4),b(1),b(2)];
			f = @(y) myfun(y,REF);
			out = fsolve(f,[0,0]);

			sant=s;
			rant=r;

			r=r+out(1);
			s=s+out(2);

			printf("r0= %f, s0= %f, r1= %f, s1= %f\n",rant,sant,r,s);

			ear=((r-rant)/r)*100;
			eas=((s-sant)/s)*100;




		end


		x=(r+sqrt(r^2+4*s))/2;
		printf("x1= %f ",x);

		x=(r-sqrt(r^2+4*s))/2;
		printf("x2= %f\n",x);

		groots=[groots x];
		groots=[groots x];




		v=[1 -r -s]
		orderedArr=rot90(array);
		orderedArr=rot90(orderedArr);
		%u=polin

		array = deconv(orderedArr,v);


	end
	array
	y=horzcat(groots,rot90(roots(array)))




end

function y = myfun (x,REF)

	y(1)=REF(2)*x(1)+REF(3)*x(2)+REF(5);
	y(2)=REF(1)*x(1)+REF(2)*x(2)+REF(4);


end
