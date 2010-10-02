function [field mesh] = ReadHDF5Dump(file, varargin)
%[field mesh] = ReadHDF5Dump(file, varargin)
%   
%   example:
%   [field mesh] = ReadHDF5Dump('Et.h5');
%   or
%   [field mesh] = ReadHDF5Dump('Et.h5','Interpolation',[21 1 101],'Frequency',300e6);
%
% openEMS matlab interface
% -----------------------
% author: Thorsten Liebig
%
% See also ReadHDF5Mesh ReadHDF5FieldData GetField_Interpolation

field = ReadHDF5FieldData(file);
mesh = ReadHDF5Mesh(file);

if (nargin>1)
    for n=1:2:(nargin-1)
        if (strcmp(varargin{n},'Interpolation')==1);
            [field mesh] = GetField_Interpolation(field,mesh,varargin{n+1});
        end
    end
    
    for n=1:2:(nargin-1)
        if (strcmp(varargin{n},'Frequency')==1);
            field = GetField_TD2FD(field,varargin{n+1});
        end
    end
end