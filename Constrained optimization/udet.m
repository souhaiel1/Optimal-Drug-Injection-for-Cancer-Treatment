function u = udet(t,lesu)
global T
N = length(lesu);
if t == T
        u = lesu(N);
end
for i = 1:1:N
    if t >= (i-1)*T/N && t < i*T/N
        u = lesu(i);
end
end

