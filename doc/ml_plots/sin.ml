x = -10:0.1:10;
plot (x, sin (x)*10+1000);
title ("sin(x) for x = -10:0.1:10");
xlabel ("x");
ylabel ("sin (x)");
text (pi, 0.7, "arbitrary text");
legend ("Sin (x)");
% export GDFONTPATH=/usr/share/fonts/dejavu/
print("sin_x.gif","-dgif","-FDejaVuSans");
