function [m midx] = vMax(V, nC)
    % computes the channel wise maxima and their positions for the
    % vectorized multichannel waveforms in V
    
    [m midx] = waveforms.vMin(-V,nC);
    m = -m;