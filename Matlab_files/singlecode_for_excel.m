D=dir
abcd= length(D)
for bbbb=3:1:29
bbbb
currD = D(bbbb).name
cd(currD)
fList = dir(currD)
        cd postfiles
            dir
            z=length(dir)
            
            %#################Loading 1st .mat file and saving into Excel sheet######

            load ('800samplesdir1revised.mat','table') % direction 1
            cd ../..
            pwd
            xlswrite('allinone.xlsx',table,bbbb-2,'B4')


            %#################Loading 2nd .mat file and saving into Excel sheet######

            currD = D(bbbb).name
            cd(currD)
            fList = dir(currD)
            cd postfiles
            pwd
            load ('800samplesdir2revised.mat','table') % direction 2
            cd ../..
            pwd
            xlswrite('allinone.xlsx',table,bbbb-2,'M4')


            %#################Loading 3rd .mat file and saving into Excel sheet######

            currD = D(bbbb).name
            cd(currD)
            fList = dir(currD)
            cd postfiles
            pwd
load ('800samplesdir3revised.mat','table') % direction 3
cd ../..
pwd
xlswrite('allinone.xlsx',table,bbbb-2,'X4')

%#################Loading 4th .mat file and saving into Excel sheet######

currD = D(bbbb).name
cd(currD)
fList = dir(currD)
        cd postfiles
pwd
load ('800samplesdir4revised.mat','table') % direction 4
cd ../..
pwd
xlswrite('allinone.xlsx',table,bbbb-2,'AI4')

%#################Loading 5th .mat file and saving into Excel sheet######

currD = D(bbbb).name
cd(currD)
fList = dir(currD)
        cd postfiles
pwd
load ('800samplesdir5revised.mat','table') % direction 5
cd ../..
pwd
xlswrite('allinone.xlsx',table,bbbb-2,'AT4')

%#################Loading 6th .mat file and saving into Excel sheet######

currD = D(bbbb).name
cd(currD)
fList = dir(currD)
        cd postfiles
pwd
load ('800samplesdir6revised.mat','table') % direction 6
cd ../..
pwd
xlswrite('allinone.xlsx',table,bbbb-2,'BE4')

     
end


%D=dir
%abcd= length(D)
%for bbbb=3:1:5
%bbbb
% currD = D(bbbb).name
% cd(currD)
% fList = dir(currD)
%         cd postfiles
%             z=length(dir)
%             filename=[num2str(),'fill' num2str(i) 'rpm']
%             load('fill')
%             files=dir('*.particles')
%             Tfile=length(files)
%             if Tfile == 157
%                 kk1=6
%             else
%                 kk1=12
%             end
%         cd ..
%     cd ..
% end
