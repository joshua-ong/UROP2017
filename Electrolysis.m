%%
%Author: Joshua Ong
%Updated: 6-9-17
%
%Summary: Reaction that takes into account reduction potential and then
%implements the stoich stuff.
%Params:
        %     iterations = tells batch cycle
        %     re = reactants
        %     r = rxn  
        %     s = salts  
        %     p = products
%todo calculate total moles of oxide and metal
function [r,s,p] = Electrolysis(iterations,r,re,s,p)

foo = r.T / r.dT; %step size.
foo = round(foo);
%faraday = 96485; %constant

%set every matrices nex allocated size
% s.LiOH(foo+1,iterations) = 0;
% s.Li2O(foo+1,iterations) = 0;
p.U(foo+1,foo+1) = 0;
p.La(foo+1,foo+1) = 0;
p.Pu(foo+1,foo+1) = 0;
p.O2(foo+1,foo+1) = 0;
re.UO2(foo+1,foo+1) = 0;
re.La2O3(foo+1,foo+1) = 0;
re.PuO2(foo+1,foo+1) = 0;
r.N(foo+1,foo+1) = 0;


count = 1; %for indexing object arrays

%%
%Calculate total mass before there is anything reduced
TMass = re.UO2(1,iterations) + re.PuO2(1,iterations) + re.La2O3(1,iterations);


for i = linspace(0,r.T,foo)
    
    %%
    Cj = [re.PuO2(count,iterations)/TMass, re.UO2(count,iterations)/TMass, re.La2O3(count,iterations)/TMass]; %so I don't have to transfer more variables into the Butler Volmer Equation
    [ansI,r.N(count,iterations)] = Butler_Volmer (3,r,re,s,Cj);
    %%
    %stoich mass changes

    % goes to=>
    deltaMole = (ansI * r.dT) / 96485;
    
    %2LiOH -> Li2O + H20
    %deltaMole = deltaMole * 2; %bc of relationship: 1 mol e- / 2 moles LiOH
    %[s.LiOH((count+1),iterations),s.Li2O((count+1),iterations)] = elementaryReactionV3(s.LiOH(count,iterations),[2],1,s.Li2O(count,iterations), [1], (2*deltaMole), trigger);
    
    %rxn3 = 0; %UO2 -> U + O2
    [re.UO2((count+1),iterations),p.U((count+1),iterations)] = elementaryReactionV3(re.UO2(count,iterations),[1],p.U(count,iterations), [1], (deltaMole(2)/4));
    %rxn4 = 0; %PuO2 -> Pu + O2
    [re.PuO2((count+1),iterations),p.Pu((count+1),iterations)] = elementaryReactionV3(re.PuO2(count,iterations),[1],p.Pu(count,iterations), [1], (deltaMole(1)/4));
    %rxn5 = 0; %La2O3 -> 2La + 1.5O2    
    [re.La2O3((count+1),iterations),p.La((count+1),iterations)] = elementaryReactionV3(re.La2O3(count,iterations),[1],p.La(count,iterations), [2], (deltaMole(3)/6));
    
    count = count + 1;
end

end