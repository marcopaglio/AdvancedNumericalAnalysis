% Si esegua uno studio (tramite l'Help in linea) delle functions offerte
% dal Matlab per il calcolo approssimato di un integrale definito.

% OBIETTIVO: panoramica sulle funzioni native del Matlab

help integral;
% integral  Numerically evaluate integral.
%     Q = integral(FUN,A,B) approximates the integral of function FUN from A
%     to B using global adaptive quadrature and default error tolerances.
%  
%     FUN must be a function handle. A and B can be -Inf or Inf. If both are
%     finite, they can be complex. If at least one is complex, integral
%     approximates the path integral from A to B over a straight line path.
%  
%     For scalar-valued problems the function Y = FUN(X) must accept a vector
%     argument X and return a vector result Y, the integrand function
%     evaluated at each element of X. For array-valued problems (see the
%     'ArrayValued' option below) FUN must accept a scalar and return an
%     array of values.

help trapz;
% trapz  Trapezoidal numerical integration.
%     Z = trapz(Y) computes an approximation of the integral of Y via
%     the trapezoidal method (with unit spacing).  To compute the integral
%     for spacing different from one, multiply Z by the spacing increment.
%  
%     For vectors, trapz(Y) is the integral of Y. For matrices, trapz(Y)
%     is a row vector with the integral over each column. For N-D
%     arrays, trapz(Y) works across the first non-singleton dimension.
%  
%     Z = trapz(X,Y) computes the integral of Y with respect to X using the
%     trapezoidal method. X can be a scalar or a vector with the same length
%     as the first non-singleton dimension in Y. trapz operates along this
%     dimension. If X is scalar, then trapz(X,Y) is equivalent to X*trapz(Y).
%  
%     Z = trapz(X,Y,DIM) or trapz(Y,DIM) integrates across dimension DIM
%     of Y. The length of X must be the same as size(Y,DIM)).

help cumtrapz;
% cumtrapz Cumulative trapezoidal numerical integration.
%     Z = cumtrapz(Y) computes an approximation of the cumulative
%     integral of Y via the trapezoidal method (with unit spacing).  To
%     compute the integral for spacing different from one, multiply Z by
%     the spacing increment.

help polyint;
% polyint Integrate polynomial analytically.
%     polyint(P,K) returns a polynomial representing the integral
%     of polynomial P, using a scalar constant of integration K.
%  
%     polyint(P) assumes a constant of integration K=0.

help quadgk;
% quadgk  Numerically evaluate integral, adaptive Gauss-Kronrod quadrature.
%     Q = quadgk(FUN,A,B) attempts to approximate the integral of
%     scalar-valued function FUN from A to B using high order global adaptive
%     quadrature and default error tolerances. The function Y=FUN(X) should
%     accept a vector argument X and return a vector result Y, the integrand
%     evaluated at each element of X. FUN must be a function handle. A and B
%     can be -Inf or Inf. If both are finite, they can be complex. If at
%     least one is complex, the integral is approximated over a straight line
%     path from A to B in the complex plane.

help quad;
%  quad   Numerically evaluate integral, adaptive Simpson quadrature.
%     Q = quad(FUN,A,B) tries to approximate the integral of scalar-valued
%     function FUN from A to B to within an error of 1.e-6 using recursive
%     adaptive Simpson quadrature. FUN is a function handle. The function
%     Y=FUN(X) should accept a vector argument X and return a vector result
%     Y, the integrand evaluated at each element of X.
%  
%     Q = quad(FUN,A,B,TOL) uses an absolute error tolerance of TOL
%     instead of the default, which is 1.e-6.  Larger values of TOL
%     result in fewer function evaluations and faster computation,
%     but less accurate results.  The quad function in MATLAB 5.3 used
%     a less reliable algorithm and a default tolerance of 1.e-3.