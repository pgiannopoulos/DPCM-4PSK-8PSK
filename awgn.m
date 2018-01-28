function received_signal = awgn(s_m, SNR)
% pairnei ws eisodous to s_m shma pou 8a metado8ei kai to SNR kai pros8etei
% ton 8oruvo
M=4;
E_s = 1; 
E_b = E_s / log2(M);
% apo ton tupo: 10 * log_10(E_b / N_0) = SNR  8a vroume to N_0
N_0 = E_b / (10^(SNR/10));
% dhmiourgoume gaussianh katanomh me mhdenikh mesh timh opws anaferetai ara
% h tupikh ths apoklish 8a einai
sigma = sqrt(N_0 / 2);
% dhmiourgia tou AWGN stis idies diastaseis me to s_m wste na ginei h
% pros8hkh 8oruvou se ka8e deigma
[temp1, temp2] = size(s_m);
noise = sigma * randn(temp1,temp2);
% pros8hkh tou 8oruvou sto shma
received_signal = s_m + noise;