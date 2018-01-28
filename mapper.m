function symbols = mapper(duadikh_akolou8ia, gray)
%
% pairnei ws eisodo mia duadikh akolou8ia k th metatrepei se sumvola
% to orisma gray to orizoume 1 an 8eloume kwdikopoihsh gray h 0 an de
% 8eloume
M=4;
% the length of input
size_of_duadikh_akolou8ia = length(duadikh_akolou8ia);
% omadopoioume ta bits se omades twn log2(M)
% osa perissepsoun omadopoiountai se ena sumvolo sto telos
temp = mod(size_of_duadikh_akolou8ia, log2(M));
% h akolou8ia pou diaireitai akrivws me log2(M)
nea_duadikh_akolou8ia = duadikh_akolou8ia(1 : (size_of_duadikh_akolou8ia - temp));
% omadopoihsh ths neas akolou8ias
omadopoihmenh_akolou8ia = reshape(nea_duadikh_akolou8ia, log2(M), (size_of_duadikh_akolou8ia - temp) / log2(M));
% metasxhmatismos ka8e sthlhs tou mhtrwou omadopoihmenh_akolou8ia
%h opoia sthlh 8a exei log2(M) bits, se ena dekadiko symvolo kai dhmiourgia
%array me ta sumvola auta
for i = 1: (size_of_duadikh_akolou8ia - temp) / log2(M)
    symbols(i) = bin2dec(num2str(omadopoihmenh_akolou8ia(:, i)'));
end
% metasxhmatismos kai twn bit pou perisepsan sthn arxh
if temp ~= 0
    symbols(i + 1) = bin2dec(num2str(duadikh_akolou8ia(size_of_duadikh_akolou8ia - temp + 1 :size_of_duadikh_akolou8ia, 1)'));
end
% an exei epilogh true (1) h kwdikopoihsh gray kanoume metatroph toy array
% mas se gray
if gray == 1
    symbols = bin2gray(symbols,'psk', M);
end