
%%
%Author: Joshua Ong
%Updated: 5-15-17
%
%Summary: Simple stoich reactions
%Params:
        %     r - vector of reactants
        %     c - coefficent number of reactions and converted amount of substance
        %     n - number of times rxn is run
        %     p - existing product  
        % e.g. - SrO + 2LiCl -> SrCl2 + Li2O
        % where v = [SrO , LiCl] (units moles) & c = [1,2] (units stoich coefficient)
%Output:
function p = elementaryReactionV3(r,c,n,p)

for i = 1:r
    
    if(v < c) %if there is not enough reactant left to react
        disp('reactant ended during ith cycle');
        break
    end
    
    
    
    
end


end