function s_m = modulator(symbols)
% pairnei ws orisma ta sumvola pou 8elouem na steiloume kai ta kwdikopoiei
% ws e3odo pairnoume to diamorfwmeno shma

M=4;
% mhkos dianusmatos me ta sumvola
size_of_symbols = length(symbols);
% periodos symbolou
T_symbol = 40;
% suxnothta sumvolou
f_symbol = 1 / T_symbol;
% periodos deigmatos
T_sample = 1;
% periodos ferousas
T_c = 4;
% suxnothta ferousas
f_c = 1 / T_c;
% Energia ka8e sumvolou
E_s = 1;
% or8ogwnios palmos
g = sqrt(2 * E_s / T_symbol);
% arxikopoihsh mhtrwou twn sumvolwn pou 8a steiloume
s_m = zeros(size_of_symbols, T_symbol / T_sample);
% upologismos tou apostalomenou shmatos
for i = 1: size_of_symbols
    for t = 1: T_symbol/T_sample
        s_m(i, t) = g * cos( 2*pi*f_c*t - 2*pi*symbols(i)/M );
    end
end

end