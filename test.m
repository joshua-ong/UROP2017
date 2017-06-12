%% 
%
%
% Summary for version 2
clear
rr = Reaction('C:\Users\JHO\Desktop\simulations\briefcase');
% save('C:\Users\Joshua\Desktop\UofU\urop\simpsonSimulation\gui2\dogs\test.mat', 'r');
ss = Salt('C:\Users\JHO\Desktop\simulations\briefcase');
pp = Product('C:\Users\JHO\Desktop\simulations\briefcase');
rere = Reactant('C:\Users\JHO\Desktop\simulations\briefcase');
rere.UO2 = randi([1 100],1,100);
rr.rxn1 = randi([0 10],1,100);
rr.rxn3 = randi([0 10],1,100);
% p = elementaryReaction(r,ri,s,p);
save('C:\Users\JHO\Desktop\simulations\briefcase\test.mat');
% k = load('test.mat','p');

%%
%what does this do?
Iterations = {1};
for i = 1:100
    Iterations{1,i} = num2str(i);
end
Reactant = randi([1 3],1,100);
Reactant = Reactant';
Salt = randi([0 3],1,100);
Salt = Salt';
Product = randi([0 3],1,100);
Product = Product';
T = table(Reactant,Salt,Product,'RowNames',Iterations)

% filename = ' C:\Users\JHO\Desktop\excels.xlsx';
filename = 'patient_data.xlsx';
writetable(T,filename,'Sheet',1,'Range','B3')
A = {'iterations'}
xlswrite(filename,A,'C1:C1')

%%
%Author: Joshua Ong
%Updated: 5-15-17
%
%Summary: Dummy dated generated for version 3


