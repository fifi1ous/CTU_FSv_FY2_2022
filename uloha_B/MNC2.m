function [sig_q]=MNC2 (A,y)
q = A\y;
E = A*q - y;
sig_0_2 = E'*E/( length(y) - length(q) );
SIG_q = sig_0_2*inv( A'*A );
sig_q = sqrt( diag( SIG_q ) );
end
