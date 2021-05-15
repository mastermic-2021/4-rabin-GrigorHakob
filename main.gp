nb = 512;
nbm = 12;
mod = 1<<nbm;
mask = 2*(4^(nbm/2)-1)/(4-1);
n = read("input.txt");
chiffre(m) = [m^2%n,kronecker(m,n),m%2];
dechiffre(c) = read("dec")(c);
m = random(1<<500)<<nb+mask;
if(dechiffre(chiffre(m)) != m,error("problème d'énoncé à signaler"));


c = chiffre(m);
c[2] *=-c[2];
A = dechiffre(c);
while(( A == 0 || A ==m),m = random(1<<500)<<nb+mask;c = chiffre(m);c[2]*=-c[2];a = dechiffre(c););
p = gcd(a+m,n);
q = gcd(a-m,n);
if(p<q, print(p),print(q));
