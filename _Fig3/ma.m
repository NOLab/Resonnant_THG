% THG Intensity as a function of wavelength
M = zeros(1, size(data, 2));
w=2*pi*3*10^(8)/(1.2*10^(-6));
W = [w-10:2:w+10];
lambda=((2*pi*(3.0*10^8))/(3*w))*10^9;
L=[lambda-10:2:lambda+10];

for i = 1:size(data, 2)
    M(i) = max(data(:,size(data, 2)- i+1));
end


plot(L, M);
title('THG Signal as a function of wavelength');
xlabel('Wavelength of the incident beam (nm)');
ylabel('THG Intensity (cd)');