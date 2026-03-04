I=zeros(2*largeur+1,2*largeur+1);

for i=1:size(result,2)
    res=result(:,i);
    for m=-largeur:largeur
        for n=-largeur:largeur
            p=largeur+1+m-((2*largeur+1)/2+1);
            dist=sqrt(2*(p)^2);
            I(largeur+1+m,largeur+1+n)=res(p);
        end
    end
end   


I=I/max(max(I));
imwrite(I.',[dirname 'RBC_THG''.png'],'png');
        