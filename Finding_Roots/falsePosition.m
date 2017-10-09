function falsePosition =falsePosition(f, xl, xu, tv = 1, es = .001, imax = 100)
  iter = 0;
  xr = inf;
  ea = inf;
  et = 0;
  do
    fl = f(xl);
    fu = f(xu);
    xrold = xr;
    xr = xu-fu*(xl-xu)/(fl-fu);
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
