
%% Old method
% for ii1=1:Nx
%     for jj1=1:Ny 
%         for Kk1=1:Nz 
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
%%

%% New Method

Nx=60; Ny=60; Nz=30;
k2=0;j2=0;i2=0;
  
  for ii1=1:Nx
      i2 = ii1;
      if(ii1>1)
          j2 = j2 + ((-1)^(ii1));
      end
      for jj1=1:Ny
          j2 = j2 + ((-1)^(ii1+1));
          if(ii1>1)||(jj1>1)
              %k2 = k2 + ((-1)^(ii1+1))*((-1)^(jj1))
              k2 = k2 + ((-1)^(jj1));
          end
          for Kk1=1:Nz
              %k2 = k2 + ((-1)^(ii1+1))*((-1)^(jj1+1))
              k2 = k2 + ((-1)^(jj1+1));
         
              if(numb(i2,j2,k2)>0)
                  numb1=numb1+1;
                  numb_new(numb1)=numb(i2,j2,k2);
                  count_a_new(numb1)=count_a(i2,j2,k2);
                  mass_a(numb1)=count_a(i2,j2,k2)*M1;% mass of particle type A
                  count_b_new(numb1)=count_b(i2,j2,k2);
                  mass_b(numb1)=count_b(i2,j2,k2)*M2;% mass of particle type B
                  tot_mass(numb1)=mass_a(numb1)+mass_b(numb1);% TOTAL MASS
                  inew(numb1)=i2;
                  jnew(numb1)=j2;
                  knew(numb1)=k2;
              end
                  %                       [i2 j2 k2]
          end
                  %             pause
      end
  end

