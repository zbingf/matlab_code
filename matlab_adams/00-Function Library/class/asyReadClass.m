classdef asyReadClass < handle
    
    properties
        textClassHandle
        asyId
    end
    
    methods
        function obj = asyReadClass(fileAdr)
           obj.textClassHandle = textClass(fileAdr);
           obj.asyId = obj.textClassHandle.textId;
           
        end
    end
    
end

