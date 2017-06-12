classdef Product
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        re;
        U;
        Pu;
        La;
        O2;
    end
    
    methods
         function obj = Product(address)
            obj.U(1) = 0;
            obj.O2(1) = 0;
            obj.La(1) = 0;
            obj.Pu(1) = 0;  
            
            
            %%
            directory = address; %Your file path
            directory = strcat(directory, '\product'); %makes reactant folder for reacant folder data
            mkdir(directory) %put the file path here
            
            r = Reactant(directory);
        end
    end
    
end

