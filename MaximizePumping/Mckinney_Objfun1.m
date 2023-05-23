function F=Mckinney_Objfun1(Q)
 tic
 format long g
%      Q=[-10,-20,-30,-40,-50,-60,-70,-80,-90,-100];
%  Q=[-7000 -7000 -7000 -5960 -4503 -5949  -6729  -4282 -4232 -6808];
 aaa= H5F.open ('Mckinney_1.h5','H5F_ACC_RDWR','H5P_DEFAULT');
 bbb=H5D.open (aaa, '/Well/07. Property');
 ccc=H5D.read(bbb,'H5T_IEEE_F64LE','H5S_ALL','H5S_ALL','H5P_DEFAULT')
 ccc(1,1)=Q(1);
 ccc(1,2)=Q(2);
 ccc(1,3)=Q(3);
 ccc(1,4)=Q(4);
 ccc(1,5)=Q(5);
 ccc(1,6)=Q(6);
 ccc(1,7)=Q(7);
 ccc(1,8)=Q(8);
 ccc(1,9)=Q(9);
 ccc(1,10)=Q(10);
 H5D.write (bbb,'H5ML_DEFAULT','H5S_ALL','H5S_ALL','H5P_DEFAULT', ccc);
 H5F.close (aaa);
 H5D.close (bbb);
 !mf2k_h5 Mckinney_1.mfs ;                                                 % Execute MODFLOW
 headfile;
 H1=-Head;                                                                 % Negative of head value
 
 for ii=1:1:10
     if H1(ii)==888
     penalty(ii)=7;
     else
     penalty(ii)=max(H1(ii),0);         %% This line have no meaning at all          
     end
 end
 pr=10000; %% penalty parameter
 penalty_sum=sum(penalty);
 F=sum(Q)+(pr*penalty_sum);
 toc
end




