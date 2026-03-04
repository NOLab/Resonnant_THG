function res= postproc_resTHG(geo, dir,simname)

%% Go to the directory
directory=['./' geo '/' dir];
cd(directory)

%% Get the list of folders

N=ls;
s=size(N);
m=s(1)-2;

%% Main Loop: saves the results of all the simulations
for k=1:m

    if (k==1)

        res=[];
        resx=[];
        resy=[];
        resz=[];

    end
    name=N(2+k,:)
    director=['./' name];
    if  strfind(name,simname)
        cd(director)
        load res.mat;
        Rx=result(1,:);
        Ry=result(2,:);
        Rz=result(3,:);
        Rs=Rx+Ry+Rz;


        load resx.mat
        load resy.mat
        load resz.mat
        matx=EmX+EmY+EmZ;
        mm=max(max(matx));
        s=size(matx);
        s2=s(2)/s(1);
        s1=s(1);

        res=[res;Rs];
        resx=[resx; Rx];
        resy=[resy; Ry];
        resz=[resz; Rz];


        cd ..
    end
end

cd ..
cd ..

%% save the results

res=res.';
resx=resx.';
resy=resy.';
resz=resz.';

savefile=['./' date '_' geo '-' dir '-' simname '.mat']
save(savefile,'res', '-ASCII');

savefile=['./' date '_' geo '-' dir '-' simname 'x.mat']
save(savefile,'resx', '-ASCII');

savefile=['./' date '_' geo '-' dir '-' simname  'y.mat']
save(savefile,'resy', '-ASCII');

savefile=['./' date '_' geo '-' dir '-' simname 'z.mat']
save(savefile,'resz', '-ASCII');

%% Display the wavelength dependence in a figure

lambda_values = 1100:5:1300; 

for i = 1:length(lambda_values)
    eval(sprintf('l_%d = res(:, %d);', lambda_values(i), i));
end

figure(1); hold on;
lambda_values = 1100:5:1300; 
colors = jet(length(lambda_values)); 

for i = 1:length(lambda_values)
    plot(res(:, i), 'Color', colors(i, :), 'LineWidth', 1.5, ...
         'DisplayName', sprintf('%d nm', lambda_values(i)));
end

legend('show');
title('THG - Gaussian res.');

xlim([1 31])
xticks([1, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31]);
xticklabels(linspace(0,5,11));
ax.XMinorTick = 'on'; 
grid on;
xlabel('z (\mum)'); 
ylabel('Signal THG'); 

set(gca, 'FontSize', 22); 
set(gca, 'LineWidth', 3);

xlabel('geometry'); 
ylabel('THG'); 
legend('show');
set(gca, 'FontSize', 14); 
set(gca, 'LineWidth', 1.5);
grid on;
