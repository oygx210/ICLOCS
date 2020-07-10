function [ data ] = setFunctionTypes( problem, data )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if isfield(problem,'FcnTypes') 
    if (strcmp(problem.FcnTypes.StageCost,'Constant')) || (strcmp(problem.FcnTypes.StageCost,'None'))
        data.FD.FcnTypes.Ltype=0;
    elseif (strcmp(problem.FcnTypes.StageCost,'Linear'))
        data.FD.FcnTypes.Ltype=2;
    elseif (strcmp(problem.FcnTypes.StageCost,'Quadratic'))
        data.FD.FcnTypes.Ltype=3;
    else
        data.FD.FcnTypes.Ltype=1;
    end
    
    if (strcmp(problem.FcnTypes.TerminalCost,'Constant')) || (strcmp(problem.FcnTypes.TerminalCost,'None'))
        data.FD.FcnTypes.Etype=0;
    elseif (strcmp(problem.FcnTypes.TerminalCost,'Linear'))
        data.FD.FcnTypes.Etype=2;
    elseif (strcmp(problem.FcnTypes.TerminalCost,'Quadratic'))
        data.FD.FcnTypes.Etype=3;
    else
        data.FD.FcnTypes.Etype=1;
    end
    
    if (strcmp(problem.FcnTypes.TerminalConst,'Constant')) || (strcmp(problem.FcnTypes.TerminalConst,'None'))
        data.FD.FcnTypes.Btype=0;
    elseif (strcmp(problem.FcnTypes.TerminalConst,'Linear'))
        data.FD.FcnTypes.Btype=2;
    elseif (strcmp(problem.FcnTypes.TerminalConst,'Quadratic'))
        data.FD.FcnTypes.Btype=3;
    else
        data.FD.FcnTypes.Btype=1;
    end

    if (strcmp(problem.FcnTypes.Dynamics,'Constant')) || (strcmp(problem.FcnTypes.Dynamics,'None'))
        data.FD.FcnTypes.Ftype=0;
    elseif (strcmp(problem.FcnTypes.Dynamics,'Linear'))
        data.FD.FcnTypes.Ftype=2;
    elseif (strcmp(problem.FcnTypes.Dynamics,'Quadratic'))
        data.FD.FcnTypes.Ftype=3;
    else
        data.FD.FcnTypes.Ftype=1;
    end

    if (strcmp(problem.FcnTypes.PathConstraint,'Constant')) || (strcmp(problem.FcnTypes.PathConstraint,'None'))
        data.FD.FcnTypes.Gtype=0;
    elseif (strcmp(problem.FcnTypes.PathConstraint,'Linear'))
        data.FD.FcnTypes.Gtype=2;
    elseif (strcmp(problem.FcnTypes.PathConstraint,'Quadratic'))
        data.FD.FcnTypes.Gtype=3;
    else
        data.FD.FcnTypes.Gtype=1;
    end
else
    data.FD.FcnTypes.Ltype=1;
    data.FD.FcnTypes.Etype=1;
    data.FD.FcnTypes.Btype=1;
    data.FD.FcnTypes.Ftype=1;
    data.FD.FcnTypes.Gtype=1;
end

% problem.FcnTypes.Dynamics='Nonlinear';
% problem.FcnTypes.PathConstraint='None';
% problem.FcnTypes.StageCost='Constant';
% problem.FcnTypes.TerminalCost='Constant';
% problem.FcnTypes.TerminalConst='None';
end

