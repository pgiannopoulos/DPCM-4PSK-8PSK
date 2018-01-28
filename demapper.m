function received_bits = demapper(symbols, gray)
% metatroph twn received sumbols se bits
M=4;
% an xrhsimopoih8hke kwdikas gray sto metadidomeno shma
if gray == 1
    symbols = gray2bin(symbols, 'psk', M);
end
received_bits = dec2bin(symbols);
% m: ari8mos grammwn sto mhtrwo twn received bits 
% n: ari8mos sthlwn sto mhtrwo twn received bits 
[m, n] = size(received_bits);
% metasxhmatismos tou mhtrwou me ta received bits se dianusma
received_bits = reshape(received_bits', m*n, 1);
% metatroph apo character se double gia na mporesei na ginei h sugkrish me
% thn eisodo h opoia einai double (30(hex) = 48(dec))
received_bits = double(received_bits) - 48;
% logw tou oti log2(8) dinei 3 k oi diaireseis stouw kwdikes mou kratoun to
% floor ths pra3hs, afairw ta 2 extra stoixeia pou exoun prokupsei gia
% exoume idies diastaseis telikou mhtrwou kai arxikou wste na ginei h
% metrhsh BER me sugkrish arxikou k telikoy mhtrwou
if M==8
    received_bits = received_bits(1:end-2);
end
