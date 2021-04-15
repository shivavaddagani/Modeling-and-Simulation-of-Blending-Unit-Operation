%%
% Fill level=30%; r1=6mm,r2=3mm; speed:12rpm; simulation time=161sec; time
% step=1e-5;No of particles=51373; alternate
%%
clc
clear all;
close all;


% num= [200:200:800];
% 
% for i=200:200:800
%     
% d= dir('C:\Users\Dr K Yamuna rani\Desktop\AVK\post\*.chute')
% end
% out = [];
% 
% % for n=200:200:800
%     fid = fopen(d(num).name,'rt');
%     Intro = textscan(f,'%s',9,'Delimiter','\n');
% 
%     C= textscan(f,'%d %d %f %f %f %f %f %f %f %f %f %f %f %f %f');
%     fclose(f)
% % end


% for n=1:numel(d)
%     filepath=['C:\Users\Dr K Yamuna rani\Desktop\AVK\post\'];      
%     filena=['dump' num2str(n) '.chute'];    
% [filepath filena]
% end
out=[];
nx = 187;       %   number of files for reading
ny = 30851;      %   maximum number of lines in a file (among all files)#total prticles
x(1:nx,1:ny)=zeros(nx,ny);
y(1:nx,1:ny)=zeros(nx,ny);
z(1:nx,1:ny)=zeros(nx,ny);
r1 = 0.6;  %cm
r2 = 0.3; %cm
for i=100000:100000:nx*100000   %   Frequency as included in the dump file titles
    n=i/100000;
   % filepath=['C:\Users\Dr K Yamuna rani\Desktop\AVK\post\'];      
    filename=['dump' num2str(i) '.particles'];  %   File name generation for eg, dump10000.particles,   dump20000.particles, etc
%[filepath filename]

f= fopen(filename,'r');

Intro = textscan(f,'%s',3,'Delimiter','\n');
no = fscanf(f,'%d\n',[1,1]);
Intro = textscan(f,'%s',5,'Delimiter','\n');

% C= textscan(f,'%d %d %f %f %f %f %f %f %f %f %f %f %f %f %f')

%C= textscan(f,'%d %d %f %f %f %*[^\n]');
%for j=1:no,
%[A,count]=fscanf(f,'%d %d %f %f %f %f %f %f %f %f %f %f %f %f %f %f %*[^\n]',[16,no])
[A,count]=fscanf(f,'%d %d %f %f %f %f %f %f %f %f %f %f %f %f %f',[15,no]);
A=A';
%pause
nn1(n) = no; % dumping frequency
for j=1:no,
a=A(j,1);
id(n,j)=a;
type(n,a)=A(j,2);
x(n,a)=A(j,3);
y(n,a)=A(j,4);
z(n,a)=A(j,5);
% vx(n,a)=A(j,9);
% vy(n,a)=A(j,10);
% vz(n,a)=A(j,11);
rad(n,a)=A(j,15);
end
%out = [out; C]
%pause
fclose(f);
i; 

end
nomax = max(max(id))
% xmax=max(max(x))
% xmin=min(min(x))
% ymax=max(max(y))
% ymin=min(min(y))
% zmax=max(max(z))
% zmin=min(min(z))
xmax=22.5;
xmin=-22.5;
ymax=22.5;
ymin=-22.5;
zmax=51.3;
zmin=0;


