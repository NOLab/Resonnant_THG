function [C,lim]=geometryRBC(longueur,largeur,b,bz,option,param,chi)

%% Initialisation

larg=2*largeur+1;
long=2*longueur+1;
C=1.68*ones(larg,larg,long); %water everywhere

cx=param(1)*(100e-9)/b; %in pixel of 100nm needs to be translated to units of b
% cy=param(2)*(500e-9)/b;
cy=param(2)*(100e-9)/b;
rayon=1e-6;
rayon_cylinder=4e-6;
height_cylinder=1010e-9;
rayon_sphere=1e-6;


%% Milieu homogene

if (strcmp(option,'homogene')==1)
    C=1;
    lim=1;
end

%% Sphere



if strcmp(option,'Sphere2d')
    lim=rayon;

    for m=-largeur:largeur
        for n=-largeur:largeur
            for p=-longueur:longueur
                if(sqrt(b*b*(m-cx)*(m-cx)+b*b*(n-cy)*(n-cy)+bz*bz*p*p)<rayon)
                    C(largeur+1+m,largeur+1+n,longueur+1+p)=2.1+chi;
                end
            end
        end
    end

end

%% Two Spheres
if strcmp(option, 'TwoSpheres')
    lim = rayon_outer;
    for m = -largeur:largeur
        for n = -largeur:largeur
            for p = -longueur:longueur
                dist_outer = sqrt(b*b*(m-cx)*(m-cx) + b*b*(n-cy)*(n-cy) + bz*bz*p*p);
                dist_inner = sqrt(b*b*(m-cx)*(m-cx) + b*b*(n-cy)*(n-cy) + bz*bz*p*p);

                % Check if the point is within the outer sphere
                if dist_outer < rayon_outer
                    % Check if the point is outside the inner sphere
                    if dist_inner > rayon_inner
                        C(largeur + 1 + m, largeur + 1 + n, longueur + 1 + p) = 1.68 + chi; % espace entre les deux sphères
                    else
                        C(largeur + 1 + m, largeur + 1 + n, longueur + 1 + p) = 1.68 + chi; % inside the smaller sphere
                    end
                end
            end
        end
    end
end


%% Sphere Inside Cylinder
if strcmp(option, 'SphereInsideCylinder')
    lim = rayon_cylinder;
    for m = -largeur:largeur
        for n = -largeur:largeur
            for p = -longueur:longueur
                dist_to_center = sqrt(b*b*(m-cx)*(m-cx) + b*b*(n-cy)*(n-cy));

                % Check if the point is within the cylinder radius
                if dist_to_center < rayon_cylinder
                    % Check if the point is within the cylinder height
                    if abs(p)*bz < height_cylinder/2
                        % Check if the point is outside the sphere
                        if sqrt(b*b*(m-cx)*(m-cx) + b*b*(n-cy)*(n-cy) + bz*bz*p*p) > rayon_sphere
                            C(largeur + 1 + m, largeur + 1 + n, longueur + 1 + p) = 1.85+chi; % between sphere and cylinder
                        else
                            C(largeur + 1 + m, largeur + 1 + n, longueur + 1 + p) = 2; % inside sphere
                        end
                    end
                end
            end
        end
    end
end

%}


if (strcmp(option,'interfacez')==1)
    C=1.68*ones(larg,larg,long); %water everywhere
    lim=cy;
    if(cy<long)
        for k=1:cy
            C(:,:,k)=(2+chi)*ones(larg,larg);
            
        end
    end
end


if (strcmp(option,'slabz')==1)
    lim=cy;
    epaisseur=lim;
    if(cy<longueur);
        for c=longueur+1-epaisseur:longueur+1+epaisseur
            C(:,:,c)=chi*ones(larg,larg);
        end
    end
end

OuterRadius = 10e-6; %rayon total du cheveu
OuterChi = 2; %chi du cuticule
InnerRadius = 7e-6; %rayon du coeur du cheveu
InnerChi= chi; %chi du coeur du cheveu

%% NeuronY
if (strcmp(option,'NeuronY')==1)
    lim=cy;

    %add water everywhere
    C=1.68*ones(larg,larg,long);

    for xx=-largeur:largeur
        for yy=-largeur:largeur
            for zz=-longueur:longueur
                if(sqrt(b*b*(xx-cy)*(xx-cy)+bz*bz*zz*zz)<OuterRadius)
                    C(largeur+1+xx,largeur+1+yy,longueur+1+zz)=OuterChi;
                end
                if(sqrt(b*b*(xx-cy)*(xx-cy)+bz*bz*zz*zz)<InnerRadius)
                    C(largeur+1+xx,largeur+1+yy,longueur+1+zz)=InnerChi;
                end
            end
        end
    end
end

%% NeuronW
if (strcmp(option,'NeuronZ')==1)
    lim=cy;

    %add water everywhere
    C=1.68*ones(larg,larg,long);

    for xx=-largeur:largeur
        for yy=-largeur:largeur
            for zz=-longueur:longueur
                if(sqrt(b*b*(xx)*(xx)+bz*bz*(zz-cy)*(zz-cy))<OuterRadius)
                    C(largeur+1+xx,largeur+1+yy,longueur+1+zz)=OuterChi;
                end
                if(sqrt(b*b*(xx)*(xx)+bz*bz*(zz-cy)*(zz-cy))<InnerRadius)
                    C(largeur+1+xx,largeur+1+yy,longueur+1+zz)=InnerChi;
                end
            end
        end
    end
end


%% NeuronX
% if (strcmp(option,'NeuronX')==1)
% lim=oy;
% 
% %add water everywhere
% C=1.68*ones(larg,larg,long);
% 
% 
%     for xx=-largeur:largeur
%         for yy=-largeur:largeur
%             for zz=-longueur:longueur
%                 if(sqrt(b*b*(yy-oy)*(yy-oy)+bz*bz*zz*zz)<OuterRadius)
%                 C(largeur+1+xx,largeur+1+yy,longueur+1+zz)=OuterChi;
%                 end
%                 if(sqrt(b*b*(yy-oy)*(yy-oy)+bz*bz*zz*zz)<InnerRadius)
%                 C(largeur+1+xx,largeur+1+yy,longueur+1+zz)=InnerChi;
%                 end
%             end
%         end
%     end
% end
% 
% end