function[]=ResTHG2024(lambda0,deltalambda,lambdavalues,chi_0,restype,simname) 

%% Default Input parameters
   %  if nargin < 1
   %      lambda0 = 415-9; %~410 for deoxy %420 for oxy
   %  end
   %  if nargin < 2
   %      deltalambda=40e-9;
   %  end
   %  if nargin < 3
   %      lambdavalues=1e-9*[1100:5:1350];
   %      % lambdavalues = 1145 * 1e-9;
   %      % lambdavalues = 1e-9 * [1140, 1180, 1200, 1220, 1260];
   %  end
   %  if nargin < 4
   %      chi_0 = 0; %amplitude of the resonance
   %  end
   % if nargin < 5
   %      restype='single';
   % end
   %  if nargin < 6
   %      simname='20250515_415-40-chiR0-chiNR2-single-interfacez';
   %  end

vecchi=zeros(1,length(lambdavalues));
%% Geometry
dx=30; %meshsize in xy in nm defalut 30
nx=50; %number of mesh elements in xy defaut 50
dz=50; %meshsize in z in nm default 30
nz=150; %number of mesh elements in z default 80
ffdet=10; %number of far-field pixel (2*n+1)*(2n+1) default 10
ffdist=0.1; % distance between far-field detectors (in units of distance to focal volume) default 0.1

A= [nz,dz,nx,dx,ffdet,ffdist];

NA=1.2; %Na of the objective
filing_factor=1.5; %lens filling factor
direction='FW'; %FW or BW
detectiontype='plane'; %'plane' or 'sphere', use plane by default
NA_det=1.2; %detection NA when using 'sphere' option
n_fund=1.324; %index of refraction for excitation;
n_thg=1.34; %index of refraction for excitation default 1.339;
%geometry='SphereInsideCylinder'; %type of geometry, see "geometry.m"
geometry='interfacez';
n_geometry=31; %number of different geometries, see "geometry.m"

%% loop over the incoming wavelength
%close
parpool('threads',min(length(lambdavalues),12)); %starts all the simulations per wavelength at the same time
parfor k=1:length(lambdavalues)
    lambda=lambdavalues(k);

B=[NA, NA_det, lambda, n_thg,n_fund,filing_factor];


    %disp(['k=' num2str(k)]);
    chi=susceptibility(lambda,lambda0,deltalambda,chi_0,restype); %replace by Gaussian to test 
    vecchi(k)=chi;
    %to do save as wavelength instead%
    % if (k<10)
    % name=[simname '_1DX_00' int2str(k)];
    % elseif (k<100)
    % name=[simname '_1DX_0' int2str(k)];
    % else
    % name=[simname '_1DX_' int2str(k)];
    % end
    name=[simname '_1DX_' int2str(lambda*1e9)]
    pause(10*rand);
    test=THG2024scan1d(A,B,geometry,direction,detectiontype,n_geometry,name,chi); % option a changer en fonction de la geometrie
    %test=THG2020sphere1d([60,30,60,30,10,0.1],[1.05 1.2 1.2e-6, 1.339,1.324,1.5],'SphereInsideCylinder','FW','plane',10,name,chi);
end
delete(gcp('nocreate'));