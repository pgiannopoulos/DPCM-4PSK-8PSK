function symbols = foratis(r)
% dexetai ws eisodo to dianusma r kai vriskei to sumvolo pou stal8hke
M=4;
[r_lines, r_columns] = size(r);
% upologismos ka8e pi8anou received_symbol
for i = 1: M
    s(i, 1) = cos( 2 * pi * i / M );
    s(i, 2) = sin( 2 * pi * i / M );
end
% upologismos sumvolou me th megaluterh pi8anothta na einai auto pou
% stal8hke
for j =1: r_lines
    for i = 1: M
        temp(i, 1) = norm([r(j,1), r(j,2)] - s(i,:));
    end
[min_diff, symbols(j, 1)] = min(temp);
end
% to M-osto symbolo einai sthn pragmastikothta to 0-sto symbolo
symbols = mod(symbols,M);
[m, n] = size(symbols);
display(m)
display(n)
