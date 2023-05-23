format long g
fin=fopen('Mckinney_1.hed','r');
data=fread(fin,'float32');
ccc=length(data);
m=data(12:4511);
l=length(m);

   a=m';
   for i=1:100 ;
       for j=1:45 ;
           b(i,j)=a(j+(i-1)*45);
       end
       end
  H_C=b;                                                            % Computed Head for the whole domain
  Hw1=H_C(16,13);                                                   % Head value at the well location          
  Hw2=H_C(16,23);
  Hw3=H_C(16,33);
  Hw4=H_C(50,13);
  Hw5=H_C(50,23);
  Hw6=H_C(50,33);
  Hw7=H_C(65,13);
  Hw8=H_C(65,20);
  Hw9=H_C(65,26);
  Hw10=H_C(65,33);
  Head=[Hw1,Hw2,Hw3,Hw4,Hw5,Hw6,Hw7,Hw8,Hw9,Hw10];    
  break_point=1;
  fclose(fin);
  fclose('all');


% fin=fopen('Mckinney_1.hed','r');
% data=fread(fin,'float32');
% ccc=length(data);
% m=data(1623:3222);
%   l=length(m);
%    a=m';
%    for i=1:40 ;
%        for j=1:40 ;
%            b(i,j)=a((j-1)+1+(i-1)*40);
%        end
%        end
%     h22=b;
% %    a1=h22(22,8)
% %    a2=h22(26,21)
% %    a3=h22(23,32)
% fclose(fin);
% fclose('all');