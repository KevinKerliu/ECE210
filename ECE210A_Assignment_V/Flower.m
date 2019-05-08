classdef Flower  
    
    properties
        petalWidth;
        petalLength;
        sepalWidth;
        sepalLength;
        species;
    end
    
    methods
        function obj = Flower(pW,pL,sW,sL,sp)
            if nargin > 0
            obj.petalWidth = pW;
            obj.petalLength = pL;
            obj.sepalWidth = sW;
            obj.sepalLength = sL;
            obj.species = sp;
            end
        end
        
        function sL = getSLength(f1)
            sL = f1.sepalLength;
        end
        
        function rp = report(f1)
%           For some reason I was getting errors when using "..." to
%           make this look nice, so here it is in one line -_- 
            disp("The length and width of its sepal are "+f1.sepalLength+" cm and "+f1.sepalWidth+" cm respectively, while the length and width of its petal are "+f1.petalLength+" cm and "+f1.petalWidth+" cm respectively. It belongs to the "+f1.species+" species.");
%             f1.petalWidth,f1.petalLength,f1.sepalWidth,f1.sepalLength,f1.species);
        end    
    end
    
end

