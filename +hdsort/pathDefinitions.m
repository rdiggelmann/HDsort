function def = pathDefinitions(varargin)
    if nargin == 0
        OStype = computer;
    else
        OStype = varargin{1};
    end

    def.pdefsPath = pwd;
    def.callerPath = [];
    
    user_config = hdsort.global_user_config();
    user_name = user_config.user_name;
    
    if ~isempty(strfind(OStype, 'WIN'))
        
        def.server01 = '\\bs-filesvr01\';
        def.server02 = '\\bs-filesvr02\';
        
    elseif ~isempty(strfind(OStype, 'MACI64'))
        
        def.server01 = fullfile('/Volumes', 'hierlemann-1'); 
        def.server02 = fullfile('/Volumes', 'hierlemann');
    
    elseif ~isempty(strfind(OStype, 'GLNXA64'))
        
        def.server01 = fullfile('/net', 'bs-filesvr01', 'export', 'group', 'hierlemann');
        def.server02 = fullfile('/net', 'bs-filesvr02', 'export', 'group', 'hierlemann');
    
    else
        error('OS unknown!')
    end
    
    def.recordings = fullfile(def.server02, 'recordings');
end
