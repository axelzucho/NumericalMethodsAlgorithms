function y = muller(f, x0,x1,x2, tv = 1, es = .001, imax = 100)
  ea = 1;
  iter = 1;

  do

    h0=x1-x0;
    h1=x2-x1;

    d0=(f(x1)-f(x0))/h0;
    d1=(f(x2)-f(x1))/h1;

    a=(d1-d0)/(h1+h0)
    b=d1+a*h1
    c=f(x2)

    if abs(b+sqrt(b^2-4*a*c)) > abs(b-sqrt(b^2-4*a*c)),
      x3=x2+(-2*c)/(b+sqrt(b^2-4*a*c));
    else,
      x3=x2+(-2*c)/(b-sqrt(b^2-4*a*c));
    end

    if(x3 != 0 && iter > 1),
      ea=abs((x3-x2)/x3)*100;
    end
     et = abs(((tv-x3)/tv)*100);

    printf("Iteration: %d, X0: %f, X1: %f, X2: %f, X3: %f, Ea: %f, Et: %f\n", iter, x0, x1, x2, x3, ea, et);

    x0=x1;
    x1=x2;
    x2=x3;

    iter++;

  until(ea < es || iter >= imax)

end
