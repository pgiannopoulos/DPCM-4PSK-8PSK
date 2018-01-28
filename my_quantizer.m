function [yq] = my_quantizer(yerror,N,min_value,max_value) 
% -----------------METAVLHTES EISODOU------------------
% yerror: dianusma sfalmatwn eisodou
% N: arithmos twn bit pou 8a xrhsimopoih8oun
% min_value: minimum apodekth timh tou shmatos eisodou
% max_value: maximum apodekth timh tou shmatos eisodou
% -----------------METAVLHTES E3ODOU-------------------
% yq: dianusma tou shmatos e3odou
% (emmesh e3odos)centers: kentra perioxwn kvantishs (den epistrefetai amesa sthn e3odo)
% -----------------------------------------------------

% arithmos twn bit pou 8a xrhsimopoih8oun
v = N;
% epipeda kvantopoihshs
quant_levels = 2^v;
% Arxikopoihsh tou yq
yq = zeros(length(yerror),1);
% vhma kvantopoihshs ?->quant_step
quant_step = (abs(min_value)+max_value)/quant_levels;
% upologismos twn kentrwn
centers = zeros(quant_levels,1); % Initialization.
for i=1:quant_levels
    centers(i) = max_value-(2*(i-1)+1)*(quant_step/2);
end
% upologismos tou shmatos e3odou (kvantopoihsh)
q_max_value = 1; q_min_value = quant_levels;
for i=1:length(yerror)
    % An to y(i) einai megalutero h iso tou max_value.
    if (yerror(i) >= max_value), yq(i) = q_max_value;
    % An to y(i) einai mikrotero tou min_value.
    elseif (yerror(i) < min_value), yq(i) = q_min_value;
    else % Gia ka8e allh periptwsh endiamesa
        for k=1:quant_levels
            if (yerror(i) >= (centers(k)-(quant_step/2)) && ...
                yerror(i) < (centers(k)+(quant_step/2)))
                yq(i) = k;
            end
        end
    end
    %antikatastash sto shma e3odou gia na anaparasta8oun ta deigmata me tis
    %antistoixes times twn kentrwn
    yq(i)=centers(yq(i));
end