function outvar = RK4FallObj_()
    format long
    t=0;
    tfinal=15;
    u=0;
    exact=0;
    dt=.075;
    g=9.81;
    cd=.25;
    m=75;
    uplot=u;
    tplot=t;
    exactplot=exact;
    error=0;
    while(t<tfinal)
        if(t+dt>tfinal)
            dt=tfinal-t;
        end
        k1=dt*rhs(g,cd,m,u);
        k2=dt*rhs(g,cd,m,u+k1/2);
        k3=dt*rhs(g,cd,m,u+k2/2);
        k4=dt*rhs(g,cd,m,u+k3);
        u=u+k1/6.+k2/3+k3/3+k4/6;
        t=t+dt;
        exact=sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t);
        if(abs(u-exact)>error)
            error=abs(u-exact);
        end
        exactplot = [exactplot exact]; 
        uplot = [uplot u];
        tplot = [tplot t];
    end
    %plot(tplot,exactplot,'blue');
    %plot(tplot,uplot,'.');
    plot(tplot,uplot,tplot,exactplot);
    xlabel('time');
    ylabel('position');
    error=max(abs(uplot-exactplot))

    
  