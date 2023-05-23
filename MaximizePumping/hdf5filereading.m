clc
clear all
close all
a=hdf5info('Mckinney_1.h5');
b=a.GroupHierarchy;
c=b.Groups(9);
d=c.Datasets(8);
data=hdf5read('Mckinney_1.h5','/Well/07. Property')

% data=hdf5read('Mckinney_1.h5','/Recharge/07. Property')

break_point=1;