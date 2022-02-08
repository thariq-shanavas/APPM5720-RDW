function der = dydt(pars,t,y)


der = [pars(1)*y(1)-pars(2)*y(1)*y(2); pars(3)*y(1)*y(2)-pars(4)*y(2)];
end

