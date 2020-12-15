% Utilizzando l'Help in linea, effettuare una ricerca per verificare come
% sia possibile risolvere un sistema lineare (con matrice non singolare e
% quadrata) con Matlab (suggerimento: inv, " n "). Verificare quindi le
% possibilita' offerte nel caso in cui la matrice sia simmetrica e definita
% positiva (suggerimento: chol);

help inv;
% inv(X) is the inverse of the square matrix X.
%     A warning message is printed if X is badly scaled or
%     nearly singular.

help slash;
% Matrix division.
%   \   Backslash or left division.
%       A\B is the matrix division of A into B, which is roughly the
%       same as INV(A)*B , except it is computed in a different way.
%       If A is an N-by-N matrix and B is a column vector with N
%       components, or a matrix with several such columns, then
%       X = A\B is the solution to the equation A*X = B. A warning
%       message is printed if A is badly scaled or nearly 
%       singular.  A\EYE(SIZE(A)) produces the inverse of A.
%  
%       If A is an M-by-N matrix with M < or > N and B is a column
%       vector with M components, or a matrix with several such columns,
%       then X = A\B is the solution in the least squares sense to the
%       under- or overdetermined system of equations A*X = B. The
%       effective rank, K, of A is determined from the QR decomposition
%       with pivoting. A solution X is computed which has at most K
%       nonzero components per column. If K < N this will usually not
%       be the same solution as PINV(A)*B.  A\EYE(SIZE(A)) produces a
%       generalized inverse of A.
%  
%   /   Slash or right division.
%       B/A is the matrix division of A into B, which is roughly the
%       same as B*INV(A) , except it is computed in a different way.
%       More precisely, B/A = (A'\B')'. See \.
%  
%   ./  Array right division.
%       B./A denotes element-by-element division.  A and B
%       must have the same dimensions unless one is a scalar.
%       A scalar can be divided with anything.
%  
%   .\  Array left division.
%       A.\B. denotes element-by-element division.  A and B
%       must have the same dimensions unless one is a scalar.
%       A scalar can be divided with anything.

help norm;
% norm(X,2) returns the 2-norm of X.
% norm(X) is the same as norm(X,2).
% norm(X,1) returns the 1-norm of X.
% norm(X,Inf) returns the infinity norm of X.
% norm(X,'fro') returns the Frobenius norm of X.
% 
% In addition, for vectors...
% norm(V,P) returns the p-norm of V defined as SUM(ABS(V).^P)^(1/P).
% norm(V,Inf) returns the largest element of ABS(V).
% norm(V,-Inf) returns the smallest element of ABS(V).
% 
% By convention, NaN is returned if X or V contains NaNs.

help lsqnonneg;
% Linear least squares with nonnegativity constraints.
%     X = lsqnonneg(C,d) returns the vector X that minimizes NORM(d-C*X)
%     subject to X >= 0. C and d must be real.
%  
%     X = lsqnonneg(C,d,OPTIONS) minimizes with the default optimization
%     parameters replaced by values in the structure OPTIONS, an argument
%     created with the OPTIMSET function.  See OPTIMSET for details. Used
%     options are Display and TolX. (A default tolerance TolX of 
%     10*MAX(SIZE(C))*NORM(C,1)*EPS is used.) 
%     
%     X = lsqnonneg(PROBLEM) finds the minimum for PROBLEM. PROBLEM is a
%     structure with the matrix 'C' in PROBLEM.C, the vector 'd' in
%     PROBLEM.d, the options structure in PROBLEM.options, and solver name
%     'lsqnonneg' in PROBLEM.solver. 
%  
%     [X,RESNORM] = lsqnonneg(...) also returns the value of the squared 2-norm of 
%     the residual: norm(d-C*X)^2.
%  
%     [X,RESNORM,RESIDUAL] = lsqnonneg(...) also returns the value of the  
%     residual: d-C*X.
%     
%     [X,RESNORM,RESIDUAL,EXITFLAG] = lsqnonneg(...) returns an EXITFLAG that
%     describes the exit condition. Possible values of EXITFLAG and the
%     corresponding exit conditions are
%  
%      1  lsqnonneg converged with a solution X.
%      0  Iteration count was exceeded. Increasing the tolerance
%         (OPTIONS.TolX) may lead to a solution.
%    
%     [X,RESNORM,RESIDUAL,EXITFLAG,OUTPUT] = lsqnonneg(...) returns a structure
%     OUTPUT with the number of steps taken in OUTPUT.iterations, the type of 
%     algorithm used in OUTPUT.algorithm, and the exit message in OUTPUT.message.
%  
%     [X,RESNORM,RESIDUAL,EXITFLAG,OUTPUT,LAMBDA] = lsqnonneg(...) returns 
%     the dual vector LAMBDA  where LAMBDA(i) <= 0 when X(i) is (approximately) 0 
%     and LAMBDA(i) is (approximately) 0 when X(i) > 0.

help chol;
% Cholesky factorization.
%     chol(A) uses only the diagonal and upper triangle of A.
%     The lower triangle is assumed to be the (complex conjugate)
%     transpose of the upper triangle.  If A is positive definite, then
%     R = chol(A) produces an upper triangular R so that R'*R = A.
%     If A is not positive definite, an error message is printed.
%  
%     L = chol(A,'lower') uses only the diagonal and the lower triangle
%     of A to produce a lower triangular L so that L*L' = A.  If
%     A is not positive definite, an error message is printed.  When
%     A is sparse, this syntax of chol is typically faster.
%  
%     [R,p] = chol(A), with two output arguments, never produces an
%     error message.  If A is positive definite, then p is 0 and R
%     is the same as above.   But if A is not positive definite, then
%     p is a positive integer.
%     When A is full, R is an upper triangular matrix of order q = p-1
%     so that R'*R = A(1:q,1:q).
%     When A is sparse, R is an upper triangular matrix of size q-by-n
%     so that the L-shaped region of the first q rows and first q
%     columns of R'*R agree with those of A.
%  
%     [L,p] = chol(A,'lower'), functions as described above, only a lower
%     triangular matrix L is produced.  That is, when A is full, L is a
%     lower triangular matrix of order q = p-1 so that L*L' = A(1:q,1:q).
%     When A is sparse, L is a lower triangular matrix of size n-by-q
%     so that the L-shaped region of the first q rows and first q columns
%     of L*L' agree with those of A.

help lu;
% [L,U] = lu(A) stores an upper triangular matrix in U and a
%     "psychologically lower triangular matrix" (i.e. a product of lower
%     triangular and permutation matrices) in L, so that A = L*U. A can be
%     rectangular.
%  
%     [L,U,P] = lu(A) returns unit lower triangular matrix L, upper
%     triangular matrix U, and permutation matrix P so that P*A = L*U.
%  
%     [L,U,p] = lu(A,'vector') returns the permutation information as a
%     vector instead of a matrix.  That is, p is a row vector such that
%     A(p,:) = L*U.  Similarly, [L,U,P] = lu(A,'matrix') returns a
%     permutation matrix P.  This is the default behavior.

help qr;
% Orthogonal-triangular decomposition.
%     [Q,R] = qr(A), where A is m-by-n, produces an m-by-n upper triangular
%     matrix R and an m-by-m unitary matrix Q so that A = Q*R.
%  
%     [Q,R] = qr(A,0) produces the "economy size" decomposition.
%     If m>n, only the first n columns of Q and the first n rows of R are
%     computed. If m<=n, this is the same as [Q,R] = qr(A).
%  
%     If A is full:
%  
%     [Q,R,E] = qr(A) produces unitary Q, upper triangular R and a
%     permutation matrix E so that A*E = Q*R. The column permutation E is
%     chosen so that ABS(DIAG(R)) is decreasing.
%  
%     [Q,R,e] = qr(A,'vector') returns the permutation information as a
%     vector instead of a matrix.  That is, e is a row vector such that 
%     A(:,e) = Q*R. Similarly, [Q,R,E] = qr(A,'matrix') returns a permutation 
%     matrix E. This is the default behavior.
%  
%     [Q,R,E] = qr(A,0) produces an "economy size" decomposition in which E
%     is a permutation vector, so that A(:,E) = Q*R.
%  
%     X = qr(A) and X = qr(A,0) return the output of LAPACK's *GEQRF routine.
%     TRIU(X) is the upper triangular factor R.
%  
%     If A is sparse:
%  
%     R = qr(A) computes a "Q-less qr decomposition" and returns the upper
%     triangular factor R. Note that R = CHOL(A'*A). Since Q is often nearly
%     full, this is preferred to [Q,R] = qr(A).
%  
%     R = qr(A,0) produces "economy size" R. If m>n, R has only n rows. If
%     m<=n, this is the same as R = qr(A).
%  
%     [Q,R,E] = qr(A) produces unitary Q, upper triangular R and a
%     permutation matrix E so that A*E = Q*R. The column permutation E is
%     chosen to reduce fill-in in R.
%  
%     [Q,R,e] = qr(A,'vector') returns the permutation information as a
%     vector instead of a matrix.  That is, e is a row vector such that 
%     A(:,e) = Q*R. Similarly, [Q,R,E] = qr(A,'matrix') returns a permutation 
%     matrix E. This is the default behavior.
%  
%     [Q,R,E] = qr(A,0) produces an "economy size" decomposition in which E
%     is a permutation vector, so that A(:,E) = Q*R.
%  
%     [C,R] = qr(A,B), where B has as many rows as A, returns C = Q'*B.
%     The least-squares solution to A*X = B is X = R\C.
%  
%     [C,R,E] = qr(A,B), also returns a fill-reducing ordering.
%     The least-squares solution to A*X = B is X = E*(R\C).
%  
%     [C,R,e] = qr(A,B,'vector') returns the permutation information as a
%     vector instead of a matrix.  That is, the least-squares solution to 
%     A*X = B is X(e,:) = R\C. Similarly, [C,R,E] = qr(A,B,'matrix') returns 
%     a permutation matrix E. This is the default behavior.
%  
%     [C,R] = qr(A,B,0) produces "economy size" results. If m>n, C and R have
%     only n rows. If m<=n, this is the same as [C,R] = qr(A,B).
%  
%     [C,R,E] = qr(A,B,0) additionally produces a fill-reducing permutation
%     vector E.  In this case, the least-squares solution to A*X = B is
%     X(E,:) = R\C.
%  
%     Example: The least squares approximate solution to A*x = b can be found
%     with the Q-less qr decomposition and one step of iterative refinement:
%  
%           if issparse(A), R = qr(A); else R = triu(qr(A)); end
%           x = R\(R'\(A'*b));
%           r = b - A*x;
%           e = R\(R'\(A'*r));
%           x = x + e;

help orth;
% orth   Orthogonalization.
%     Q = orth(A) is an orthonormal basis for the range of A.
%     That is, Q'*Q = I, the columns of Q span the same space as 
%     the columns of A, and the number of columns of Q is the 
%     rank of A.
%  
%     Class support for input A:
%        float: double, single

help qrdelete;
% Delete a column or row from QR factorization.
%     [Q1,R1] = qrdelete(Q,R,J) returns the QR factorization of the matrix A1,
%     where A1 is A with the column A(:,J) removed and [Q,R] = QR(A) is the QR
%     factorization of A. Matrices Q and R can also be generated by 
%     the "economy size" QR factorization [Q,R] = QR(A,0). 
%  
%     qrdelete(Q,R,J,'col') is the same as qrdelete(Q,R,J).
%  
%     [Q1,R1] = qrdelete(Q,R,J,'row') returns the QR factorization of the matrix
%     A1, where A1 is A with the row A(J,:) removed and [Q,R] = QR(A) is the QR
%     factorization of A.

help qrinsert;
% Insert a column or row into QR factorization.
%     [Q1,R1] = qrinsert(Q,R,J,X) returns the QR factorization of the matrix A1,
%     where A1 is A=Q*R with an extra column, X, inserted before A(:,J). If A has
%     N columns and J = N+1, then X is inserted after the last column of A.
%  
%     qrinsert(Q,R,J,X,'col') is the same as qrinsert(Q,R,J,X).
%  
%     [Q1,R1] = qrinsert(Q,R,J,X,'row') returns the QR factorization of the matrix
%     A1, where A1 is A=Q*R with an extra row, X, inserted before A(J,:).

help qrupdate;
% Rank 1 update to QR factorization.
%     If [Q,R] = QR(A) is the original QR factorization of A, then
%     [Q1,R1] = qrupdate(Q,R,U,V) returns the QR factorization of A + U*V',
%     where U and V are column vectors of appropriate lengths.
%  
%     qrupdate works only for full matrices.