classdef Salt < handle
    %Kind of Struct that with read / write functionality. Signifying
    %changing reactants
    
    properties
        LiCl; %Reactant
        Li2O; %Product
        CsCl; %Product
        SrCl2; %Product
        LiOH; %Unwanted something
    end
    
    methods
        function obj = Salt(address)
            obj.LiCl(1) = 0;
            obj.Li2O(1) = 0;
            obj.CsCl(1) = 0;
            obj.SrCl2(1) = 0;
            obj.LiOH(1) = 0;
            
            %%
            directory = address; %Your file path
            directory = strcat(directory, '\salt'); %makes reactant folder for reacant folder data
            mkdir(directory) %put the file path here
            
        end
    end
    
end

