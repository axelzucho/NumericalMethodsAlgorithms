function x=lusolve(a,b)

	[l,u]=lu(a);


	y=inv(l)*b

	x=inv(u)*y
end