w = 2*pi*3*10^(8)/(1.2*10^(-6));
W = [w-10:2:w+10];
W_t= [w-100:2:w+100];
chivalues = zeros(size(W, 2));

% Boucle pour les points (pas assez de points ici pour obtenir toute la
% courbe de mod et phase)

for n = 1:size(W, 2)
    w_0 = W(n); 
    chi = 1.85+susceptibilite(w, w_0);
    chivalues(n) = chi;
end

mod = abs(chivalues);
phase = angle(chivalues);

% Boucle pour les courbes de mod et phase

for n = 1:size(W_t, 2)
    w_0 = W_t(n); 
    chi_t = 1.85+susceptibilite(w, w_0);
    chivalues_t(n) = chi_t;
end

Mod = abs(chivalues_t);
Phase = angle(chivalues_t);

uif = uifigure(); 

uax1 = uiaxes(uif, 'Position', [50 100 400 200]); 
plot(uax1, data2(:,:,1));
title(uax1, 'THG Intensity along the z axis');
xlabel(uax1, 'Mesh Cell Index Along z (mesh cell size is 30 nm)'); 
ylabel(uax1, 'Intensity of the THG Signal (cd)'); 


grid(uax1, 'on');

uax2 = uiaxes(uif, 'Position', [500 100 400 200]); 
plot(uax2, W_t, Mod);
title(uax2, 'Module of the third-order non-linear susceptibility');
xlabel(uax2, 'Angular Frequency (rad/s)'); 
ylabel(uax2, 'Module'); 


uax3 = uiaxes(uif, 'Position', [950 100 400 200]); 
plot(uax3, W_t, Phase);
title(uax3, 'Phase of the third-order non-linear susceptibility');
xlabel(uax3, 'Angular Frequency (rad/s)'); 
ylabel(uax3, 'Phase'); 

n = size(data2, 3);
uis = uislider(uif, 'Position', [50 50 1300 3],...
    'Value', 1, ...
    'Limits', [1, n], ...
    'MajorTicks', 1:n, ...
    'MinorTicks', []);

uis.ValueChangedFcn = @(h,~)updateGraphs(uax1, uax2, uax3, data2, W_t, Mod,Phase, W, mod, phase, round(h.Value));

function updateGraphs(uax1, uax2, uax3, data2, W_t, Mod, Phase, W, mod, phase, index)

    plot(uax1, data2(:,:,index));
    title(uax1, ['THG Intensity along the z axis - ' num2str(index)]);
    xlabel(uax1, 'Mesh Cell Index Along z (mesh cell size is 30 nm)'); 
    ylabel(uax1, 'Intensity of the THG Signal (cd)'); 
    
    plot(uax2, W_t, Mod);
    hold(uax2, 'on');
    scatter(uax2, W(index), mod(index), 'r', 'filled');
    title(uax2, 'Module of the third-order non-linear susceptibility');
    xlabel(uax2, 'Angular Frequency (rad/s)'); 
    ylabel(uax2, 'Module'); 
    scatter(uax2,W(index),1.68,'filled');
    scatter(uax2,W(index),2,'filled');
    %legend(uax2, 'Red dot : module of the third-order susceptibility at the considered angular frequency ');
    %legend(uax2, 'Purple dot : third-order susceptibility of the nuclei');
    %legend(uax2, 'Yellow dot : third-order susceptibility of water');

    plot(uax3, W_t, Phase);
    hold(uax3, 'on');
    scatter(uax3, W(index), phase(index), 'b', 'filled');
    title(uax3, 'Phase of the third-order non-linear susceptibility');
    xlabel(uax3, 'Angular Frequency (rad/s)'); 
    ylabel(uax3, 'Phase'); 
    
    hold(uax2, 'off');
    hold(uax3, 'off');
    
end
