function bisection = bisection(f, xl, xu, tv = 1, es = .001, imax = 100)
  iter = 0;
  fl = f(xl);
  xr = inf;
  ea = inf;
  et = 0;
  do
    xrold = xr;
    xr = (xl+xu)/2;
    fr = f(xr);
    ++iter;
    if(xr != 0 && iter > 1)
      ea = abs(((xr-xrold)/xr)*100);
    end
    et = abs(((tv-xr)/tv)*100);
    test = fl*fr;
    if(test < 0)
      xu = xr;
    elseif(test > 0)
      xl = xr;
      fl = fr;
    else
      ea = 0;
    end
    printf("Iterations: %d, Root: %f, Ea: %f, Et: %f\n",iter,xr,ea,et);
  until(ea < es || iter >= imax)
  bisection = xr;
end
