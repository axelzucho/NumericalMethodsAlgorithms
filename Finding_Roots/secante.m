function y = secante(f, x0, xi, tv = 1, es = .001, imax = 100)
  ea = inf;
  et = inf;
  iter=1;

  do
    x2=xi-(f(xi)*(x0-xi))/(f(x0)-f(xi));

    if(x2 != 0 && iter > 1)
      ea = abs(((x2-xi)/x2)*100);
    end
    et = abs(((tv-x2)/tv)*100);

    printf("Iteration: %d, Xi-1: %f, Xi: %f, Xi+1: %f, Ea: %f, Et: %f\n",iter,x0,xi,x2,ea,et);
    x0=xi;
    xi=x2;

    iter++;
  until(ea < es || iter >= imax)
end
