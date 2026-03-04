%% Fig3 D-E RedBllodCells
%% 1: 415 40 1
close all;
lambda0_1 = 415e-9;       % max of linear absorption - default 410e-9;
deltalambda_1 = 40e-9;    % width of linear abs - default 40e-9;
lambdavalues_1=1e-9*[1100:5:1350]; % wavelengths used for the simulations
chi_0_1 = 1;                        % amplitude of the resonance (in AU, as a reference chi3 of water is 1.68)
restype = 'single'; % Single Lorentzian
geo = 'interfacez'; % interface along z
dir = 'FW';
simname1='Fig3-415-40-chiR1-chiNR2-single-interfacez';
ResTHG2024(lambda0_1,deltalambda_1,lambdavalues_1,chi_0_1,restype,simname1) 

%% 2: 415 40 0.8
close all;
lambda0_2 = 415e-9;       
deltalambda_2 = 40e-9;    
lambdavalues_2=1e-9*[1100:5:1350];
chi_0_2 = 0.5;                      
restype = 'single'; e
geo = 'interfacez';
dir = 'FW';
simname2='Fig3-415-40-chiR0_5-chiNR2-single-interfacez';
ResTHG2024(lambda0_2,deltalambda_2,lambdavalues_2,chi_0_2,restype,simname2) 

%% 3 : 415 40 0.0
close all;
lambda0_3 = 415e-9;       
deltalambda_3 = 40e-9;    
lambdavalues_3 = 1e-9*[1100:5:1350];
chi_0_3 = 0.0;                        
restype = 'single'; 
geo = 'interfacez';
dir = 'FW';
simname3='Fig3-415-40-chiR0-chiNR2-single-interfacez';
ResTHG2024(lambda0_3,deltalambda_3,lambdavalues_3,chi_0_3,restype,simname3) 

%% 4 : 415 40 0.25
close all;
lambda0_4 = 415e-9;       
deltalambda_4 = 40e-9;    
lambdavalues_4 = 1e-9*[1100:5:1350];
chi_0_4 = 0.25;                        
restype = 'single'; 
geo = 'interfacez';
dir = 'FW';
simname4='Fig3-415-40-chiR0.25-chiNR2-single-interfacez';
ResTHG2024(lambda0_4,deltalambda_4,lambdavalues_4,chi_0_4,restype,simname4) 

%% 5 : 415 40 0.75
close all;
lambda0_4 = 415e-9;       
deltalambda_4 = 40e-9;    
lambdavalues_4 = 1e-9*[1100:5:1350];
chi_0_4 = 0.75;                        
restype = 'single'; 
geo = 'interfacez';
dir = 'FW';
simname4='Fig3-415-40-chiR0.25-chiNR2-single-interfacez';
ResTHG2024(lambda0_4,deltalambda_4,lambdavalues_4,chi_0_4,restype,simname4) 


%% Fig 3-GHI Xantophore

%% 5 : xantho 260 80 0
close all;
lambda0_5 = 260e-9;       
deltalambda_5 = 80e-9;    
lambdavalues_5=1e-9*1125;
chi_0_5 = 0;                        
restype = 'single'; 
geo = 'interfacez';
dir = 'FW';
simname5='Fig3-260-80-chiR0-chiNR2-single-interfacez';
ResTHG2024(lambda0_5,deltalambda_5,lambdavalues_5,chi_0_5,restype,simname5) 


%% 6 : xantho 260 80 5
close all;
lambda0_6 = 260e-9;       
deltalambda_6 = 80e-9;    
lambdavalues_6=1e-9*1280;
chi_0_6 = 5;                        
restype = 'single'; 
geo = 'interfacez';
dir = 'FW';
simname6='Fig3-260-80-chiR5-chiNR2-single-interfacez';
ResTHG2024(lambda0_6,deltalambda_6,lambdavalues_6,chi_0_6,restype,simname6) 

%% 7 : xantho 260 80 2
close all;
lambda0_7 = 260e-9;       
deltalambda_7 = 80e-9;    
lambdavalues_7=1e-9*1125;
chi_0_7 = 2;                        
restype = 'single'; 
geo = 'interfacez';
dir = 'FW';
simname7='Fig3-260-80-chiR2-chiNR2-single-interfacez';
ResTHG2024(lambda0_7,deltalambda_7,lambdavalues_7,chi_0_7,restype,simname7) 