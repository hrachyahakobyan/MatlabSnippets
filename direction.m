function [ direction ] = direction( func, x0 )
%DIRECTION Summary of this function goes here
%   Detailed explanation goes here
direction = -1.*grad(func,x0);

end

