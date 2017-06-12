function [partialCurrents, N ] = Butler_Volmer( len,r,re,s,Cj)
%[re.PO2Props,re.UO2Props,re.La2O3Props],[re.UO2(1,iterations), re.PuO2(1,iterations), re.La2O3(1,iterations)],TMass);
%Author: Joshua H Ong
%Updated: 6-8-17
%
%Summary: Determining Partial Currents
    %Param:
        %len - number of included species
        %     re = reactants
        %     r = rxn  
        %     s = salts  
        %     Cj = moles O % Total
 %Declare Some parameters
 %Universal Constants
 F = 96485;
 f = F / (8.3214 * 823);
 e = 2.7; %182818284590452353602874713527
 %Apparatus Parameters
 A = 1000; %(cm^2) 
 alpha = .5;
 IL = 100;
 %Elemental/Specie Constants
 %Recalculated      
  Kj = 1:len;
  Ej = 1:len;
  
syms species E foo total
total = 0;
species(1,len) = foo;

%DumBy variable
for i = 1:len
    species(1,i) = foo;
    Kj(i) = re.ReTable(i).Kj; %PO2Props.Kj,UO2Props.Kj,La2O3Props.Kj;
    Ej(i) = re.ReTable(i).Ej; %PO2Props.Ej,UO2Props.Ej,La2O3Props.Ej; 
end

%making mini equations
for i = 1:len
    species(1,i) = vpasolve(species(1,i) == F * A * Kj(i) * Cj(i) * e^(-1 * alpha * f * (E-Ej(i))),foo);
end
    
%solve for overpotential by combining all equations
for i = 1:len
    total = total + species(1,i) ;
end

N = vpasolve(total == IL, E)

%solve for partial currents    
partialCurrents = 1:len;
% E = ans;
for i = 1:len
    partialCurrents(1,i) = subs(species(1,i),E,N);
end  


end

