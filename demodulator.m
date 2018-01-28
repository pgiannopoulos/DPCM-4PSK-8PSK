function r = demodulator(received_signal)
% pairnei ws orisma to received_signal kai epistrefei ta stoixeia
% (r1,..) ka8e metadidomenou shmatos

% periodos tou sumvolou
T_symbol = 40;
% suxnothta tou sumvolou
f_symbol = 1 / T_symbol;
% periodos tou deigmatos
T_sample = 1;
% periodos ferousas
T_c = 4;
% suxnothta ferousas
f_c = 1 / T_c;
% Energeia sumvolou
E_s = 1;
% or8ogwnios palmos
g = sqrt(2 * E_s / T_symbol);
% apodiamorfwsh
for t = 1: T_symbol
    y1(t, 1) = g * cos(2 * pi * f_c * t);
    y2(t, 1) = g * sin(2 * pi * f_c * t);
end
% upologismos twn 2 stoixeiwn
r = [received_signal * y1, received_signal * y2];
