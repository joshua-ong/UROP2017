%% 
%
%
% Summary for version 3
clear
rr = Reaction('C:\Users\JHO\Desktop\simulations\briefcase');
ss = Salt('C:\Users\JHO\Desktop\simulations\briefcase');
pp = Product('C:\Users\JHO\Desktop\simulations\briefcase');
rere = Reactant('C:\Users\JHO\Desktop\simulations\briefcase');
rere.UO2 = randi([2 4],1,100)/100;
rere.PuO2 = randi([3 5],1,100)/100;
rere.La2O3 = randi([3 5],1,100)/100;
ss.LiOH = randi([2 6],1,100);
%rr.rxn1 = randi([0 10],1,100);
%rr.rxn3 = randi([0 10],1,100);

save('C:\Users\JHO\Desktop\simulations\briefcase\test.mat');
% k = load('test.mat','p');

