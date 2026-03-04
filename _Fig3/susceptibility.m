function chi=susceptibility(lambda,lambda0,deltalambda,chi_0,option) 

w=2*pi*3*10^(8)/(lambda);
w0=2*pi*3*10^(8)/(lambda0);
wmin=2*pi*3*10^(8)/(lambda0+deltalambda/4);
wmax=2*pi*3*10^(8)/(lambda0-deltalambda/4);
deltaw=abs(wmin-wmax)/2;%largeur de la resoance en freq

if (strcmp(option,'single'))
    chimax=abs((1)/(-1i*deltaw));
    chi=(chi_0/chimax)*(1/((w0-3*w)-1i*deltaw));
end

if (strcmp(option,'Gaussian'))
    delta_w=2*pi*3*10^(8)/(1*10^(-4)); % largeur de chaque resonance elementaire
    freq=[wmin: delta_w/2 : wmax];  % frequences elementaires considerres
    chi=0;
    chimax=0;
    for n=1:length(freq)
        ww0=freq(n);
        amplitude=exp(-(ww0-3*w).^2/(2*deltaw^2)); % gaussienne de largeur deltaomega
        chi=chi+amplitude*(1)/((ww0-3*w)-1i*delta_w); %addition de toutes les resonances elementaires
    end
    %normalize by amplitude of chi at resonance
    w=w0/3;
    for n=1:length(freq)
        ww0=freq(n);
        amplitude=exp(-(ww0-3*w).^2/(2*deltaw^2)); % gaussienne de largeur deltalambda
        chimax=chimax+amplitude*(1)/((ww0-3*w)-1i*delta_w); %addition de toutes les resonances elementaires
    end
    chi=chi_0*chi/abs(chimax);
end