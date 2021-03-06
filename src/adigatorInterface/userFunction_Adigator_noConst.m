function [ const ] = userFunction_Adigator_noConst( X_in,U,p,t,data)
%userFunction_Adigator_noConst - Adigator template for user defined function (dynamics constraints) with direct collocation method (h-type)
%
% Syntax:  [ const ] = userFunction_Adigator_noConst( X_in,U,p,t,data)
%
% Copyright (C) 2019 Yuanbo Nie, Omar Faqir, and Eric Kerrigan. All Rights Reserved.
% The contribution of Paola Falugi, Eric Kerrigan and Eugene van Wyk for the work on ICLOCS Version 1 (2010) is kindly acknowledged.
% This code is published under the MIT License.
% Department of Aeronautics and Department of Electrical and Electronic Engineering,
% Imperial College London London  England, UK 
% ICLOCS (Imperial College London Optimal Control) Version 2.5 
% 1 Aug 2019
% iclocs@imperial.ac.uk


%------------- BEGIN CODE --------------

f=data.data.InternalDynamics;


vdat=data.data;


X=X_in;
x0=X_in(1,:)';
nt=data.sizes{1};
n=data.sizes{3};
M=data.sizes{7};
ns=data.sizes{9};

t0=t(1);
tf=t(end);
delta_t=tf-t0;
T=[0;data.tau_inc]*delta_t/ns+t0;
P=repmat(p,M,1);

dynF=f(X,U,P,T,vdat);
X_vect=reshape(X',n*M,1);
const=[(x0-data.x0t)*data.cx0;data.map.A*X_vect+data.map.B*reshape(delta_t*dynF',M*n,1)];


end



