%% Different Approach For cat Swarm Optimization
%% MAIN PROGRAM (ALMOST FINAL)

clc
clear all
close all
format long g
N=40;    %% POPULATION SIZE::::----->                             
D=10;            
itmax=40;                             
c=2.05;
wmax=0.9;
wmin=0.4;
w=linspace(wmax,wmin,itmax); %% Linear variation of w 
%% Bounds of Variable::

a(1:N,1)=-7000;                                             %% Lower bound for x1
b(1:N,1)=0;                                          %% Upper Bound for x1

a(1:N,2)=-7000;                                  
b(1:N,2)=0;    

a(1:N,3)=-7000;                                  
b(1:N,3)=0;

a(1:N,4)=-7000;                                  
b(1:N,4)=0;

a(1:N,5)=-7000;                                  
b(1:N,5)=0;

a(1:N,6)=-7000;                                  
b(1:N,6)=0;

a(1:N,7)=-7000;                                  
b(1:N,7)=0;

a(1:N,8)=-7000;                                  
b(1:N,8)=0;

a(1:N,9)=-7000;                                  
b(1:N,9)=0;

a(1:N,10)=-7000;                                  
b(1:N,10)=0;
m=a;
n=b;
d=(b-a);
q=(n-m)/200;
%% Bounds of variable
%% Random Initialization of position and Velocity
check=rand(N,D);
x=a+d.*rand(N,D); %% random Initialization of Position 
v=q.*rand(N,D);

vmin=-500;
vmax=500;
xmin=[-7000 -7000 -7000 -7000 -7000  -7000 -7000 -7000 -7000 -7000];
xmax=[0  0  0  0  0  0  0  0  0  0];

 %%%%%%%%


for pp=1:1:N
pop=x(pp,:);    
F(pp) = Mckinney_Objfun1(pop);
end

[F_g_best,kk]=min(F);
g_best=x(kk,:);                                         

Cop=5;
SRD=0.30;
for it=1:1:itmax    
F_L_C_Vect=zeros(1,N);
Fti=zeros(1,N);
Fitness_Function=zeros(1,N);
x_track=zeros(N,10);
x_seek=zeros(N,10);

for ii=1:1:N  %% Catk
    r_n1=rand;
    if r_n1<=0.1   %mixture ratio
        % SEEKING MODE
          pop=x(ii,:);         
          xkc=repmat(pop,Cop,1);
          for jj=1:1:Cop
               for jjj=1:1:D;
                   cdc_val=randi([1, 10]);
                   if cdc_val>=3
                      cdc(jjj)=1;
                   else
                     cdc(jjj)=0; 
                   end
               end  
              rnd=rand;
          if rnd>0.5
%           Pk(jj,:)=(1+SRD*rand)*xkc(jj,:); 
         Pk(jj,:)=xkc(jj,:)+SRD*rand*xkc(jj,:).*cdc; 
         
             
         Pk(jj,1)=min(Pk(jj,1),xmax(1,1));         
         Pk(jj,1)=max(Pk(jj,1),xmin(1,1));
         Pk(jj,2)=min(Pk(jj,2),xmax(1,2));
         Pk(jj,2)=max(Pk(jj,2),xmin(1,2));
   
         Pk(jj,3)=min(Pk(jj,3),xmax(1,3));
         Pk(jj,3)=max(Pk(jj,3),xmin(1,3));
         Pk(jj,4)=min(Pk(jj,4),xmax(1,4));
         Pk(jj,4)=max(Pk(jj,4),xmin(1,4));
   
         Pk(jj,5)=min(Pk(jj,5),xmax(1,5));
         Pk(jj,5)=max(Pk(jj,5),xmin(1,5));
         Pk(jj,6)=min(Pk(jj,6),xmax(1,6));
         Pk(jj,6)=max(Pk(jj,6),xmin(1,6));
   
         Pk(jj,7)=min(Pk(jj,7),xmax(1,7));
         Pk(jj,7)=max(Pk(jj,7),xmin(1,7));
         Pk(jj,8)=min(Pk(jj,8),xmax(1,8));
         Pk(jj,8)=max(Pk(jj,8),xmin(1,8));
   
         Pk(jj,9)=min(Pk(jj,9),xmax(1,9));
         Pk(jj,9)=max(Pk(jj,9),xmin(1,9));
         Pk(jj,10)=min(Pk(jj,10),xmax(1,10));
         Pk(jj,10)=max(Pk(jj,10),xmin(1,10));
   
         F(jj) = Mckinney_Objfun1(Pk(jj,:));
         else
%        Pk(jj,:)=(1-SRD*rand)*xkc(jj,:);
         Pk(jj,:)=xkc(jj,:)-SRD*rand*xkc(jj,:).*cdc;
          
         Pk(jj,1)=min(Pk(jj,1),xmax(1,1));         
         Pk(jj,1)=max(Pk(jj,1),xmin(1,1));
         Pk(jj,2)=min(Pk(jj,2),xmax(1,2));
         Pk(jj,2)=max(Pk(jj,2),xmin(1,2));
   
         Pk(jj,3)=min(Pk(jj,3),xmax(1,3));
         Pk(jj,3)=max(Pk(jj,3),xmin(1,3));
         Pk(jj,4)=min(Pk(jj,4),xmax(1,4));
         Pk(jj,4)=max(Pk(jj,4),xmin(1,4));
   
         Pk(jj,5)=min(Pk(jj,5),xmax(1,5));
         Pk(jj,5)=max(Pk(jj,5),xmin(1,5));
         Pk(jj,6)=min(Pk(jj,6),xmax(1,6));
         Pk(jj,6)=max(Pk(jj,6),xmin(1,6));
   
         Pk(jj,7)=min(Pk(jj,7),xmax(1,7));
         Pk(jj,7)=max(Pk(jj,7),xmin(1,7));
         Pk(jj,8)=min(Pk(jj,8),xmax(1,8));
         Pk(jj,8)=max(Pk(jj,8),xmin(1,8));
   
         Pk(jj,9)=min(Pk(jj,9),xmax(1,9));
         Pk(jj,9)=max(Pk(jj,9),xmin(1,9));
         Pk(jj,10)=min(Pk(jj,10),xmax(1,10));
         Pk(jj,10)=max(Pk(jj,10),xmin(1,10));
        
          F(jj) = Mckinney_Objfun1(Pk(jj,:));
          end
          end
          Pk;
          Fcat=F;
          F_Max=max(F);
          F_Min=min(F);
          brk_pt=1;
          for mm=1:1:Cop          
          Prob(mm)=abs(Fcat(mm)-F_Max)/(F_Max-F_Min);
          end
          Prob;
          [max_prob,nn]=max(Prob);
          F_C=Fcat(nn);                                  
          x_c=Pk(nn,:);                                 
          F_L_C_Vect(ii)=F_C;
          x_seek(ii,:)=x_c; 
          brk_pt=1;           
    else
%%           START TRACKING MODE::::::
     xti=x(ii,:);   
     vti=w(it)*(v(ii,:))+(c*rand*(g_best-xti));
     
   vti(1,1)=min(vti(1,1),vmax);
   vti(1,1)=max(vti(1,1),vmin);
   vti(1,2)=min(vti(1,2),vmax);
   vti(1,2)=max(vti(1,2),vmin);
   
   vti(1,3)=min(vti(1,3),vmax);
   vti(1,3)=max(vti(1,3),vmin);
   vti(1,4)=min(vti(1,4),vmax);
   vti(1,4)=max(vti(1,4),vmin);
   
   vti(1,5)=min(vti(1,5),vmax);
   vti(1,5)=max(vti(1,5),vmin);
   vti(1,6)=min(vti(1,6),vmax);
   vti(1,6)=max(vti(1,6),vmin);
   
   vti(1,7)=min(vti(1,7),vmax);
   vti(1,7)=max(vti(1,7),vmin);
   vti(1,8)=min(vti(1,8),vmax);
   vti(1,8)=max(vti(1,8),vmin);
   
   vti(1,9)=min(vti(1,9),vmax);
   vti(1,9)=max(vti(1,9),vmin);
   vti(1,10)=min(vti(1,10),vmax);
   vti(1,10)=max(vti(1,10),vmin);
   
   v(ii,:)=vti;     
   xti=xti+vti;
     
   xti(1,1)=min(xti(1,1),xmax(1,1));
   xti(1,1)=max(xti(1,1),xmin(1,1));
   xti(1,2)=min(xti(1,2),xmax(1,2));
   xti(1,2)=max(xti(1,2),xmin(1,2));
   
   xti(1,3)=min(xti(1,3),xmax(1,3));
   xti(1,3)=max(xti(1,3),xmin(1,3));
   xti(1,4)=min(xti(1,4),xmax(1,4));
   xti(1,4)=max(xti(1,4),xmin(1,4));
   
   xti(1,5)=min(xti(1,5),xmax(1,5));
   xti(1,5)=max(xti(1,5),xmin(1,5));
   xti(1,6)=min(xti(1,6),xmax(1,6));
   xti(1,6)=max(xti(1,6),xmin(1,6));
   
   xti(1,7)=min(xti(1,7),xmax(1,7));
   xti(1,7)=max(xti(1,7),xmin(1,7));
   xti(1,8)=min(xti(1,8),xmax(1,8));
   xti(1,8)=max(xti(1,8),xmin(1,8));
   
   xti(1,9)=min(xti(1,9),xmax(1,9));
   xti(1,9)=max(xti(1,9),xmin(1,9));
   xti(1,10)=min(xti(1,10),xmax(1,10));
   xti(1,10)=max(xti(1,10),xmin(1,10));
     
     Fti(ii)= Mckinney_Objfun1(xti);
     x_track(ii,:)=xti;
     
     Break_Point=100;
     end
end
  
   
     F_L_C_Vect;
     Fti;
     break_Point=1;
     Fitness_Function= F_L_C_Vect+Fti;
     X_F=x_seek+x_track;
     
     x=X_F;

     
     
     [minF,ii]=min(Fitness_Function);
     if minF <= F_g_best
     F_g_best=minF; 
     g_best=X_F(ii,:);   %% Imp
     end
     F_g_best_k(it)=F_g_best;
end

  display('Output using cat Swarm Optimization');
  [minF,ii]=min(Fitness_Function) 
  sol=x(ii,:)
  itk=1:1:itmax;
plot(itk,-F_g_best_k)
grid on
xlabel('No of Generation ');
ylabel('Total Pumping rate');

Mat=[itk',-F_g_best_k'];
xlswrite('Max_Pump_CSO1.xls',Mat);
display('Program Completed'); 
   
  
  
