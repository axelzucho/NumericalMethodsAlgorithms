function y = newtonRaphson(f, df, x, tv = 1, es = .001, imax = 100)
  et = inf;
  ea = inf;
  iter = 1;
  do
    xi=x-(f(x)/df(x));
    if(xi != 0 && iter > 1)
      ea = abs(((xi-x)/xi)*100);
    end
    et = abs(((tv-xi)/tv)*100);
    printf("Iteration: %d, X: %f, Xi: %f, Ea: %f, Et: %f\n",iter,x,xi,ea,et);
    x=xi;
    iter++;
  until(ea < es || iter >= imax)
end
