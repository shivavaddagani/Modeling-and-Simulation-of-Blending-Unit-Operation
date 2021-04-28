
%%
% Fill level=50%; r1=6mm,r2=3mm; speed:6rpm; simulation time=180sec; time
% step=1e-5;No of particles=51373

% data_reading;
%%
clc
% clear all
% close all
% load 80fillcomp20low24rpm % DOE5_worest BLENDING CASE
xmax=22.5;
xmin=-22.5;
ymax=22.5;
ymin=-22.5;
zmax=51.3;
zmin=0;
%% blender geometry details
z1=0;
z2=7.6;
z3=25.4;
z4=51.3;
rc1=6.5;
rc2=6.5;
rc3=22.5;
rc4=22.5;
%%
% [Zmax,im]=max(z(:)); % Zmax= maxValue, im=linearIndexofMaxvalue
% [rowsOfMaxes colsOfMaxes] = find(z == Zmax);
% 
% xm1=x(rowsOfMaxes,colsOfMaxes)
% ym1=y(rowsOfMaxes,colsOfMaxes)
% xm2=-xm1
% ym2=-ym1
% % zm1=z3
% zm2=z(rowsOfMaxes,colsOfMaxes)
% pause

%% samples calculations
delt=1e-5; %sec  %to be specified
total_time=151; %sec  %to be specified
rotation_speed=24.0/60.0 % rps  12rpm % to be specified
sample_data=5e4; % evry 50000 step data collected
no_samples=total_time*rotation_speed/1
time_single_rotation=1/rotation_speed
no_time_step_one_rotation=time_single_rotation/delt
sampling_frequency=no_time_step_one_rotation/sample_data
no_files = total_time/delt/sample_data
% pause
%%
%nxx=nx/sampling_frequency;
nxx=no_samples+1;
% count_a(1:nxx,1:6)=0;
% count_b(1:nxx,1:6)=0;
% numb(1:nxx,1:6)=0;
% numb_out(1:nxx)=0;
% kk1=nx-no_files; % nx= total no of files including addition
kk1=12;% insertion
kk(1)=kk1;
for k=1:no_samples,
    kk1 = kk1 + sampling_frequency;
    kk(k+1) = round(kk1);
end
kk;
delta=1;
Nx=(xmax-xmin)/(delta);
Ny=(ymax-ymin)/(delta);
Nz=(51-0)/(delta);
% Nz1=(z2-z1)/(0.5);
% Nz2=(z3-z2)/(0.5);
% Nz3=(z4-z3)/(0.5);
% count_a(1:Nx,1:Ny,1:Nz)=0;
% count_b(1:Nx,1:Ny,1:Nz)=0;
% numb(1:Nx,1:Ny,1:Nz)=0;

% pause
for i=1:nxx
    k1 = kk(i); % sampling frequency
    a = nn1(k1); % dumping frequency, nn1
%     znew=zeros(k1,j);
    for j=1:a
        znew(i,j)=(z(k1,j));
        xnew(i,j) = x(k1,j);
        ynew(i,j) = y(k1,j);
%         pause
    end 
end
znew;
% [Zmax,im]=max(znew(:)); % Zmax= maxValue, im=linearIndexofMaxvalue
% [rowsOfMaxes colsOfMaxes] =find(znew == Zmax);
%  
% 
% xm1=x(rowsOfMaxes,colsOfMaxes)
% ym1=y(rowsOfMaxes,colsOfMaxes)
% xm2=-xm1
% ym2=-ym1
% % zm1=z3
% % zm2=z(rowsOfMaxes,colsOfMaxes)
% zm2=Zmax
% % pause
% ss(1:nxx,1:10)=0; 
% ss_a(1:nxx,1:10)=0;
% ss_b(1:nxx,1:10)=0;

 %k=25
for nd1=1, %1:6
    
for k=1:nxx,
%     a
%     pause
%% 
    count_a(1:Nx,1:Ny,1:Nz)=zeros(Nx,Ny,Nz);
    count_b(1:Nx,1:Ny,1:Nz)=zeros(Nx,Ny,Nz);
    numb(1:Nx,1:Ny,1:Nz)=zeros(Nx,Ny,Nz);
    %%
    zz = znew(k,:);
    [Zmax,im]=max(zz);
    zm2=Zmax;
    xm1=xnew(k,im);
    ym1=ynew(k,im);
    xm2=-xm1;
    ym2=-ym1;
    
    k1 = kk(k); % sampling frequency
    k2 = k;     % sample no
    a = nn1(k1); % dumping frequency, nn1
    
     
    zm1=0;
    for j=1:a
        if(xnew(k,j)>(xm2-0.05))
            if(ynew(k,j)>(ym2-0.05))
                if(znew(k,j)>zm1)
                    zm1=znew(k,j);
                end
            end
        end
    end
    zm1;
    % pause
    
    
    
    for j=1:a,
        
        %%       XYZ   direction sampling
      %% lower cylinder
        for ii=1:Nx
            xii=xmin+(ii-1)*delta;
            if((xnew(k,j)>xii)&&(xnew(k,j)<=xii+delta))
                for jj=1:Ny
                    yjj=ymin+(jj-1)*delta;
                    if((ynew(k,j)>yjj)&&(ynew(k,j)<=yjj+delta))
                        for kkk=1:Nz
                            zkkk1=z1+(kkk-1)*delta;
                            if((znew(k,j)>=z1)&&(znew(k,j)<z2)) %% lower cylinder
                                if((znew(k,j)>zkkk1)&&(znew(k,j)<=zkkk1+delta))
                                    
                                    if((xnew(k,j)^2+ynew(k,j)^2)<=rc1^2)
                                        numb(ii,jj,kkk) = numb(ii,jj,kkk)+1;
                                        
                                        if(rad(k1,j)==r1)
                                            count_a(ii,jj,kkk)=count_a(ii,jj,kkk)+1;
                                        else
                                            count_b(ii,jj,kkk)=count_b(ii,jj,kkk)+1;
                                            
                                        end
                                    end
                                end
                            elseif((znew(k,j)>=z2)&&(znew(k,j)<z3))%% cone
                                if((znew(k,j)>zkkk1)&&(znew(k,j)<=zkkk1+delta))
                                    rcnew = rc2 + ((znew(k,j)-z2)*(rc3-rc2)/(z3-z2));
                                    if((xnew(k,j)^2+ynew(k,j)^2)<=rcnew^2)
                                        numb(ii,jj,kkk) = numb(ii,jj,kkk)+1;
                                        if(rad(k1,j)==r1)
                                            count_a(ii,jj,kkk)=count_a(ii,jj,kkk)+1;
                                        else
                                            count_b(ii,jj,kkk)=count_b(ii,jj,kkk)+1;
                                        end
                                        
                                    end
                                end
                            else
                                if((znew(k,j)>=z3)&&(znew(k,j)<z4))
                                    %% upper cylinder
                                    
                                    if((znew(k,j)>zkkk1)&&(znew(k,j)<=zkkk1+delta))
                                        
                                        if((xnew(k,j)^2+ynew(k,j)^2)<=rc4^2)
                                            numb(ii,jj,kkk) = numb(ii,jj,kkk)+1;
                                            if(rad(k1,j)==r1)
                                                count_a(ii,jj,kkk)=count_a(ii,jj,kkk)+1;
                                            else
                                                count_b(ii,jj,kkk)=count_b(ii,jj,kkk)+1;
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
%%

%%
%%
% numb
% count_a
% count_b
%pause
V1=(4/3)*pi*(r1^3);%cc
V2=(4/3)*pi*(r2^3);%cc
rho1=1.6; %g/cc
rho2=1.6; %g/cc
M1=V1*rho1;
M2=V2*rho2;

numb1=0;
%% note: this section need to be changed according to 6 directions of sampling

    switch nd1
        case 1,
            xyz;
        case 2,
            xzy;
        case 3,
            yxz;
        case 4,
            yzx;
        case 5,
            zxy;
        case 6,
            zyx;
    end
%   for jj1=1:Ny
%     
%         for Kk1=1:Nz
%             for ii1=1:Nx
%               
%             if(numb(ii1,jj1,Kk1)>0)
%                 numb1=numb1+1;
%                 numb_new(numb1)=numb(ii1,jj1,Kk1);
%                 count_a_new(numb1)=count_a(ii1,jj1,Kk1);
%                 mass_a(numb1)=count_a(ii1,jj1,Kk1)*M1;% mass of particle type A
%                 count_b_new(numb1)=count_b(ii1,jj1,Kk1);
%                 mass_b(numb1)=count_b(ii1,jj1,Kk1)*M2;% mass of particle type B
%                 tot_mass(numb1)=mass_a(numb1)+mass_b(numb1);% TOTAL MASS
%                 inew(numb1)=ii1;
%                 jnew(numb1)=jj1;
%                 knew(numb1)=Kk1;
%             end
%         end
%     end
% end

numb11(k) = numb1;

ns=800;% ns=no of samples
sample_size=floor(sum(sum(sum(tot_mass)))/ns);
ss(k,1:ns)=zeros(1,ns); 
ss_a(k,1:ns)=zeros(1,ns);
ss_b(k,1:ns)=zeros(1,ns);
jind=1;
ssn(k,1:ns)=zeros(1,ns); 
ss_an(k,1:ns)=zeros(1,ns);
ss_bn(k,1:ns)=zeros(1,ns);



   i=1; 
   ss_count(k,1:ns)=zeros(1,ns);
while(i>0)
    ssold=ss(k,jind);
    ssaold = ss_a(k,jind);
    ssbold = ss_b(k,jind);
    [i numb_new(i) count_a_new(i) count_b_new(i)];
    ss;
    ss_a;
    ss_b;
    [sum(ss(k,:)) sum(ss_a(k,:)) sum(ss_b(k,:))];
    ssn(k,jind)=ssn(k,jind)+numb_new(i);
    ss_an(k,jind)=ss_an(k,jind)+count_a_new(i);
    ss_bn(k,jind)=ss_bn(k,jind)+count_b_new(i);
    
    ss(k,jind)=ss(k,jind)+tot_mass(i);
    ss_a(k,jind)=ss_a(k,jind)+mass_a(i);
    ss_b(k,jind)=ss_b(k,jind)+mass_b(i);
    if(ss(k,jind)>=sample_size)
         if(jind<=ns)
         if((ss(k,jind)-sample_size)>(sample_size-ssold))
            ss(k,jind)=ssold;
            ss_a(k,jind)=ssaold;
            ss_b(k,jind)=ssbold;
            i=i-1;
        end
         end
        i;
        ss_count(k,jind)=i;
        jind=jind+1;
%        pause
         if(jind>ns)
             if(i<numb1)
                 for ik = i+1:numb1,
                     ssn(k,ns)=ssn(k,ns)+numb_new(ik);
                     ss_an(k,ns)=ss_an(k,ns)+count_a_new(ik);
                     ss_bn(k,ns)=ss_bn(k,ns)+count_b_new(ik);
                     
                   ss(k,ns)=ss(k,ns)+tot_mass(ik);
                    ss_a(k,ns)=ss_a(k,ns)+mass_a(ik);
                    ss_b(k,ns)=ss_b(k,ns)+mass_b(ik);
                 end
                 ss_count(k,ns)=ik;
   %             pause
                break;
             end
         end
    end
    i = i+1;
    if(i>numb1)
        k;
        ss_count(k,jind)=i-1;
        numb11;
%         pause
        break;
    end
end

end
%% k loop ends
%%
for i = 1:nxx,
    numtot(i) = 0;
    atot(i)=0;
    btot(i)=0;
    
    for j = 1:ns-5,
        numtot(i) = numtot(i)+ss(i,j);
        atot(i) = atot(i) + ss_a(i,j);
        btot(i) = btot(i) + ss_b(i,j);       
        if(ss(i,j)==0)
            fr_a(i,j)=0;
            fr_b(i,j)=0;
        else
            fr_a(i,j) = ss_a(i,j)/ss(i,j);
            fr_b(i,j) = ss_b(i,j)/ss(i,j);
        end
        
    end
  
   
end

numtot;
atot;
btot;
ss;
ss_a;
ss_b;
ssn;
ss_an;
ss_bn;
fr_a;
fr_b;

%% Performance analysis
sint=1;%600 samples% subsampling %20 for 30 samples, 10 for 60samples and 5 for 120samples
init=5;
final=ns-5;
fr_a_bar(nd1,:)=mean(fr_a(:,init:sint:final),2); % mean
sigma_square(nd1,:)=var(fr_a(:,init:sint:final),0,2); % Variance
sigma(nd1,:)=std(fr_a(:,init:sint:final),0,2); % standard deviation

avgnumparticlesa(nd1,:)=mean(ss_an(:,init:sint:final),2);
avgnumparticlesb(nd1,:)=mean(ss_bn(:,init:sint:final),2);
% n01=avgnumparticlesa+avgnumparticlesb;
Na(nd1,:)=floor(8*avgnumparticlesa(nd1,:));
Nb(nd1,:)=floor(avgnumparticlesb(nd1,:));
n0(nd1,:)=Na(nd1,:)+Nb(nd1,:);



p=0.8;% proportion of material A 
sigma0_square=(p*(1-p)); % Variance: segregated case (unmixed)
sigma0=sqrt(sigma0_square);
% sigmaR_square=p*(1-p)/n0;
wa_bar=mean(ss_a(:,init:sint:final),2);
wb_bar=mean(ss_b(:,init:sint:final),2);


for i = 1:nxx
    sigmaR_square(nd1,i)=p*(1-p)/n0(nd1,i);
%     sigmaR_square1(nd1,i)=p*(1-p)/n01(i);
    sigmaR(nd1,i)=sqrt(sigmaR_square(nd1,i));
 
  ML(nd1,i)=    (sigma0_square-sigma_square(nd1,i))/(sigma0_square-sigmaR_square(nd1,i));% Lacey Mixinng index (practical values only lie in range 0.75 ?1.0)
%   ML1(nd1,i)=   (sigma0_square-sigma_square(nd1,i))/(sigma0_square-sigmaR_square1(nd1,i));% Lacey Mixinng index (practical values only lie in range 0.75 ?1.0)
  MP(nd1,i)=    sigma(nd1,i)/sigmaR(nd1,i);  % Poole,Taylor,Wall Mixinng index
  MI(nd1,i)=(sigma(nd1,i)/sigma0)^2;   % segregation index
 
%     sigma_r(i)=sqrt((fr_a_bar(i)*(1-fr_a_bar(i)))/(n0))
    RSDr(nd1,i) = sigmaR(nd1,i)/fr_a_bar(nd1,i); % standard deviation for a completely random binary mixture(RSDr)
    RSD(nd1,i)=sigma(nd1,i)/fr_a_bar(nd1,i); % relative standard deviation (RSD)
%   
end

[floor(Na(nd1,:))', floor(Nb(nd1,:))', n0(nd1,:)', sigma_square(nd1,:)', sigmaR_square(nd1,:)' ML(nd1,:)' MP(nd1,:)' MI(nd1,:)' RSD(nd1,:)' RSDr(nd1,:)']
clear n0 numtot atot btot ss ss_a ss_b ssn ss_an ss_bn fr_a fr_b
clear numb_new count_a_new count_b_new
clear jind k numb1 numb11

end
% MLmean = mean(ML);
% % ML1mean = mean(ML1);
% MPmean = mean(MP);
% MImean = mean(MI);
% RSDmean = mean(RSD);
% RSDrmean = mean(RSDr);
% 
% MLstd = std(ML);
% % ML1std = std(ML1);
% MPstd = std(MP);
% MIstd = std(MI);
% RSDstd = std(RSD);
% RSDrstd = std(RSDr);
% 
% mean_indices=[MLmean',MPmean',MImean',RSDmean',RSDrmean',MLstd',MPstd',MIstd',RSDstd',RSDrstd']
% 
% %save jiang800_6dir_1.mat nxx fr_a fr_b ss ssn ss_a ss_an ss_b ss_bn p ML RSD RSDr
% save jiang800_6dir_mean.mat nxx p ML MP MI RSD RSDr MLmean MPmean MImean RSDmean RSDrmean MLstd MPstd MIstd RSDstd RSDrstd
