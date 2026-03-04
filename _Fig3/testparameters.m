function[]=testparameters(lambda0,deltalambda,lambdavalues,chi_0)

option='single';
vecchi=zeros(1,length(lambdavalues));
for k=1:length(lambdavalues)
    lambda=lambdavalues(k);
chi=susceptibility(lambda,lambda0,deltalambda,chi_0,option);
vecchi(k)=chi;
end
figure(3)
subplot(2,3,1);
plot(lambdavalues,abs(vecchi))
xlabel('wavelength'); 
ylabel('norm of \chi^3'); 
subplot(2,3,2);
plot(lambdavalues,imag(vecchi))
title('\chi3 values on the wavelength range considered - Single res.');
xlabel('wavelength'); 
ylabel('Imaginary part of \chi^3'); 
subplot(2,3,3);
plot(lambdavalues,real(vecchi))
xlabel('wavelength'); 
ylabel('Real part of \chi^3');

option='Gaussian';
 lambdavalues=[1100:1:1300]*1e-9;
vecchi=zeros(1,length(lambdavalues));
for k=1:length(lambdavalues)
    lambda=lambdavalues(k);
chi=susceptibility(lambda,lambda0,deltalambda,chi_0,option);
vecchi(k)=chi;
end

subplot(2,3,4);
plot(lambdavalues,abs(vecchi))
xlabel('wavelength'); 
ylabel('Norm of \chi^3');
subplot(2,3,5);
plot(lambdavalues,imag(vecchi))
title('\chi3 values on the wavelength range considered - Sum of Gaussian res.');
xlabel('wavelength'); 
ylabel('Imaginary part of \chi^3');
subplot(2,3,6);
plot(lambdavalues,real(vecchi))
xlabel('wavelength'); 
ylabel('Real part of \chi^3');