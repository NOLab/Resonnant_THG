
%lambda=1200e-9;
lambda0=410e-9;
deltalambda=30e-9;
chi_0=1;
option='single';
 lambdavalues=[1100:1:1300]*1e-9;
vecchi=zeros(1,length(lambdavalues));
for k=1:length(lambdavalues)
    lambda=lambdavalues(k);
chi=susceptibility(lambda,lambda0,deltalambda,chi_0,option);
vecchi(k)=chi;
end
figure(3)
subplot(1,3,1);
plot(lambdavalues,abs(vecchi))
subplot(1,3,2);
plot(lambdavalues,imag(vecchi))
subplot(1,3,3);
plot(lambdavalues,real(vecchi))

option='Gaussian';
 lambdavalues=[1100:1:1300]*1e-9;
vecchi=zeros(1,length(lambdavalues));
for k=1:length(lambdavalues)
    lambda=lambdavalues(k);
chi=susceptibility(lambda,lambda0,deltalambda,chi_0,option);
vecchi(k)=chi;
end
figure(4)
subplot(1,3,1);
plot(lambdavalues,abs(vecchi))
subplot(1,3,2);
plot(lambdavalues,imag(vecchi))
subplot(1,3,3);
plot(lambdavalues,real(vecchi))