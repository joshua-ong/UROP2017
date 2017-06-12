classdef Reaction < handle
    %SUMMARY: This is the superclassing object that every other component extends.
    %Tells whether to take into account certain properties and to read &
    %write files ~ default constructor.
    %
    %AUTHOR: Joshua Ong
    %UPDATED: 5-15-17
    
    properties
        batchCycle = 1; %number of batches run on same "reactor"
        directory = '';
%         rxn1 = 0; %Cs20 + 2LiCl  -> 2CsCl + Li2O
%         rxn2 = 2; %SrO + 2LiCl -> SrCl2 + Li2O
%         rxn3 = 0; %UO2 -> U + O2
%         rxn4 = 0; %PuO2 -> Pu + O2
%         rxn5 = 0; %La2O3 -> 2La + 1.5O2
        %for specific reaction
        %electrolysis basic
        I = 100; %amps
        T = 3600; %seconds = 10 hours
        dT = 36; %delta time, but actually small pieces of time
        %Butler_Volmer Addition
        N = zeros(10,10); %overpotential in volts
        area = 1000; % (cm^2)
        
        
        
        
    end
    
    methods     
    %%
    %call default constructors making empty data types    
        function obj = Reaction(address)
            obj.directory = address;
            directory = address; %Your file path
            mkdir(directory); %put the file path here
            fileManagementWriteRedFuelFin(directory, '\1'); %Outputing Results
        end
        function foo = batchCycleIterate(foo)
            foo.batchCycle = foo.batchCycle + 1;
        end
%         function product = elementaryRxn(obj,reactant,lol) %why do I need a dummy input argument I don't use?
%             for i = 0:obj.rxn3(obj.batchCycle)
% %                 reactant.UO2(obj.batchCycle) = reactant.getUO2(reactant) - 1;
%                 reactant.UO2;
%             end    
%                 product = reactant.UO2(obj.batchCycle);
%         end
        
        
        function bar = getBatchCycle(foo)
            bar = foo.batchCycle;        
        end
        function bar = getDirectory(foo)
            bar = foo.directory;        
        end
        
%         function obj = Reaction(address, var)
%             address = var;
%             read(address);
%         end    
    end
    
end

