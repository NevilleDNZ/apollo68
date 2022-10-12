% m_Adams_Bashforth_r_1year_ss=1hr_short_no_moon.lst:plot:no_moon:Adams_Bashforth:3600.0s:plot:stop time:+5.21774557741429e  +1 in week
m_Euler_r_1year_ss_1hr_short_no_moon=[ 1.49601e5, 1.49629e5, 1.49673e5, 1.49745e5, 1.49851e5, 1.49990e5, 1.50154e5, 1.50329e5, 1.50498e5, 1.50648e5, 1.50767e5, 1.50851e5, 1.50904e5, 1.50935e5, 1.50944e5];
m_Adams_Bashforth_r_1year_ss_1hr_short_no_moon=[ 0.00000e0, 2.36155e6, 4.72310e6, 7.08465e6, 9.44260e6, 1.18041e7, 1.41657e7, 1.65272e7, 1.88852e7, 2.12467e7, 2.36083e7, 2.59698e7, 2.83278e7, 3.06893e7, 3.15569e7];
m_Runga_Kutta_4th_order_r_1year_ss_1hr_short_no_moon=[ 1.49601e5, 1.49609e5, 1.49658e5, 1.49783e5, 1.49999e5, 1.50304e5, 1.50673e5, 1.51071e5, 1.51455e5, 1.51786e5, 1.52036e5, 1.52196e5, 1.52272e5, 1.52288e5, 1.52286e5];
m_Velocity_Verlet_r_1year_ss_1hr_short_no_moon=[ 1.49601e5, 1.49605e5, 1.49630e5, 1.49692e5, 1.49800e5, 1.49953e5, 1.50138e5, 1.50337e5, 1.50530e5, 1.50696e5, 1.50821e5, 1.50901e5, 1.50938e5, 1.50947e5, 1.50946e5];
m_Adams_Bashforth_r_1year_ss_1hr_short_no_moon=[ 1.49601e5, 1.49602e5, 1.49602e5, 1.49602e5, 1.49602e5, 1.49602e5, 1.49602e5, 1.49602e5, 1.49602e5, 1.49602e5, 1.49602e5, 1.49602e5, 1.49602e5, 1.49602e5, 1.49602e5];
m_Euler_r_1year_ss_1hr_short_with_moon=[ 1.49601e5, 1.49680e5, 1.49875e5, 1.50111e5, 1.50402e5, 1.50731e5, 1.50969e5, 1.51190e5, 1.51273e5, 1.51281e5, 1.51237e5, 1.51087e5, 1.51024e5, 1.50959e5, 1.50938e5];
m_Adams_Bashforth_r_1year_ss_1hr_short_with_moon=[ 1.49601e5, 1.49648e5, 1.49778e5, 1.49963e5, 1.50163e5, 1.50336e5, 1.50444e5, 1.50466e5, 1.50397e5, 1.50251e5, 1.50059e5, 1.49862e5, 1.49703e5, 1.49615e5, 1.49631e5];
m_Runga_Kutta_4th_order_r_1year_ss_1hr_short_with_moon=[ 1.49601e5, 1.49616e5, 1.49565e5, 1.49516e5, 1.49525e5, 1.49633e5, 1.49859e5, 1.50199e5, 1.50621e5, 1.51078e5, 1.51512e5, 1.51878e5, 1.52140e5, 1.52284e5, 1.52307e5];
m_Velocity_Verlet_r_1year_ss_1hr_short_with_moon=[ 1.49601e5, 1.49655e5, 1.49832e5, 1.50058e5, 1.50352e5, 1.50694e5, 1.50952e5, 1.51198e5, 1.51305e5, 1.51328e5, 1.51292e5, 1.51137e5, 1.51059e5, 1.50972e5, 1.50942e5];

time = [ 0.00000e0, 2.36155e6, 4.72310e6, 7.08465e6, 9.44260e6, 1.18041e7, 1.41657e7, 1.65272e7, 1.88852e7, 2.12467e7, 2.36083e7, 2.59698e7, 2.83278e7, 3.06893e7, 3.15569e7];
time = time / 60 / 60 / 24 / 7;
name="m_All_r_1year_short_10TM_1hr.gif";
set(0, 'DefaultAxesLineStyleOrder','-|-.|--|:');
% "-" Solid line. [default] "--" Dashed line.  ":" Dotted line.  "-." A dash-dot line. 
plot (
  time,m_Euler_r_1year_ss_1hr_short_no_moon,"r",
  time,m_Adams_Bashforth_r_1year_ss_1hr_short_no_moon,"g",
  time,m_Runga_Kutta_4th_order_r_1year_ss_1hr_short_no_moon,"b",
  time,m_Velocity_Verlet_r_1year_ss_1hr_short_no_moon,"y",
  time,m_Euler_r_1year_ss_1hr_short_with_moon,"r-@",
  time,m_Adams_Bashforth_r_1year_ss_1hr_short_with_moon,"g-@",
  time,m_Runga_Kutta_4th_order_r_1year_ss_1hr_short_with_moon,"b-@",
  time,m_Velocity_Verlet_r_1year_ss_1hr_short_with_moon,"y-@"
);
title ("A graph of Earths Orbit radius for the period 1 year");
xlabel ("Mission time (weeks) with Step size: 1hr");
ylabel ("Orbit Radius (km)");
legend("Euler-Moon","Adams_Bashforth-Moon","Runga_Kutta_4th_order-Moon","Velocity_Verlet-Moon",
       "Euler+Moon","Adams_Bashforth+Moon","Runga_Kutta_4th_order+Moon","Velocity_Verlet+Moon");
% export GDFONTPATH=/usr/share/fonts/dejavu/
print(name,"-r600","-dgif","-FDejaVuSans");
