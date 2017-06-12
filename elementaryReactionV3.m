
%%
%Author: Joshua Ong
%Updated: 5-15-17
%
%Summary: Simple stoich reactions
%Params:
        %     r - vector of reactants
        %     cr - coefficent number of reactions and converted amount of reactant
        %     n - number of times rxn is run
        %     p - existing product  
        %     pr - coefficent number of reactions and converted amount of product
        %     k - number of moles reduced/ oxidized
        %     trigger - triggered
        % e.g. - SrO + 2LiCl -> SrCl2 + Li2O
        % where v = [SrO , LiCl] (units moles) & c = [1,2] (units stoich coefficient)
%Output:
function [r,p] = elementaryReactionV3(r,cr,p, cp, k)

%for i = 1:n
    
    if(~all(r >= (cr*k))) %if there is not enough reactant left to react
        disp('reactant ended during ');
        disp(i);
        disp('th cycle');
        return
    end    
    
    r = r - (cr * k);
    p = p + (cp * k);
    
    
%end


end