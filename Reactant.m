classdef Reactant < handle
    %Author: Joshua H Ong
    %Updated: 6-8-17
    %
    %Summary:
    %Kind of Struct that with read / write functionality. Signifying
    %changing reactants
    % Also Holds Element Specific Values in Structs
    
    properties
        PuO2;
        
        ReTable = [struct('id','PuO2','Kj',1e-6,'n',4,'Ej',-1.94);
                struct('id','UO2','Kj',1e-6,'n',4,'Ej',-1.9);
                struct('id','La2O3','Kj',1e-6,'n',6,'Ej',-2.14)]
        UO2;
        La2O3;
        Cs2O;
        SrO;
        
    end
    
    methods (Access = public)
        function obj = Reactant(address)
            obj.PuO2(1) = 0;
            obj.UO2(1) = 0;
            obj.La2O3(1) = 0;
            obj.Cs2O(1) = 0;
            obj.SrO(1) = 0;   
            
            %%
            directory = address; %Your file path
            directory = strcat(directory, '\reactant'); %makes reactant folder for reacant folder data
            mkdir(directory) %put the file path here
            
        end
%         function obj = Reactant2(address)
% %             directory = address; %Your file path
% %             mkdir(directory) %put the file path here
% %             fileManagementWriteRedFuelFin(directory, '\1'); %Outputing Results
%         end

        function bar = getUO2(foo)
            bar = foo.UO2;        
        end
    end
    
end

