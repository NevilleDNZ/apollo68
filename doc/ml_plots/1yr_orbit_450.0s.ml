# m_Adams_Bashforth_r_1year_short_10TM.lst_plot_Adams_Bashforth_450.0s_plot_stop time_+5.21774557741429e  +1 in week
m_Euler_r_1year_short_10TM=[ 1.49601e5, 1.49605e5, 1.49610e5, 1.49619e5, 1.49633e5, 1.49650e5, 1.49671e5, 1.49693e5, 1.49714e5, 1.49733e5, 1.49748e5, 1.49758e5, 1.49765e5, 1.49769e5, 1.49770e5];
m_Adams_Bashforth_r_1year_short_10TM=[ 1.49601e5, 1.49601e5, 1.49601e5, 1.49601e5, 1.49601e5, 1.49601e5, 1.49601e5, 1.49601e5, 1.49601e5, 1.49601e5, 1.49601e5, 1.49601e5, 1.49601e5, 1.49601e5, 1.49601e5];
m_Runga_Kutta_4th_order_r_1year_short_10TM=[ 1.49601e5, 1.49602e5, 1.49609e5, 1.49624e5, 1.49651e5, 1.49689e5, 1.49736e5, 1.49786e5, 1.49834e5, 1.49876e5, 1.49907e5, 1.49927e5, 1.49936e5, 1.49938e5, 1.49938e5];
m_Velocity_Verlet_r_1year_short_10TM=[ 1.49601e5, 1.49602e5, 1.49605e5, 1.49613e5, 1.49626e5, 1.49645e5, 1.49669e5, 1.49694e5, 1.49718e5, 1.49739e5, 1.49754e5, 1.49764e5, 1.49769e5, 1.49770e5, 1.49770e5];

% with moon
m_Euler_r_1year_short_with_moon=[ 1.49601e5, 1.49652e5, 1.49790e5, 1.49990e5, 1.50207e5, 1.50390e5, 1.50500e5, 1.50527e5, 1.50486e5, 1.50382e5, 1.50210e5, 1.50006e5, 1.49858e5, 1.49805e5, 1.49772e5];
m_Adams_Bashforth_r_1year_short_with_moon=[ 1.49601e5, 1.49648e5, 1.49778e5, 1.49963e5, 1.50163e5, 1.50335e5, 1.50444e5, 1.50466e5, 1.50397e5, 1.50251e5, 1.50059e5, 1.49863e5, 1.49703e5, 1.49616e5, 1.49631e5];
m_Runga_Kutta_4th_order_r_1year_short_with_moon=[ 1.49601e5, 1.49653e5, 1.49800e5, 1.50009e5, 1.50224e5, 1.50405e5, 1.50566e5, 1.50654e5, 1.50608e5, 1.50499e5, 1.50372e5, 1.50167e5, 1.50035e5, 1.49958e5, 1.49965e5];
m_Velocity_Verlet_r_1year_short_with_moon=[ 1.49601e5, 1.49649e5, 1.49785e5, 1.49983e5, 1.50200e5, 1.50385e5, 1.50498e5, 1.50528e5, 1.50489e5, 1.50387e5, 1.50216e5, 1.50012e5, 1.49862e5, 1.49806e5, 1.49772e5];

time=[ 0.00000e0, 2.36068e6, 4.72137e6, 7.08205e6, 9.44228e6, 1.18030e7, 1.41636e7, 1.65243e7, 1.88846e7, 2.12452e7, 2.36059e7, 2.59666e7, 2.83268e7, 3.06875e7, 3.15569e7];
time = time / 60 / 60 / 24 / 7;
name="m_All_r_1year_short_10TM_450.0s.gif";
plot (time,m_Euler_r_1year_short_10TM,"r",
      time,m_Adams_Bashforth_r_1year_short_10TM,"g",
      time,m_Runga_Kutta_4th_order_r_1year_short_10TM,"b",
      time,m_Velocity_Verlet_r_1year_short_10TM,"y",
      time,m_Euler_r_1year_short_with_moon,"r-@",
      time,m_Adams_Bashforth_r_1year_short_with_moon,"g-@",
      time,m_Runga_Kutta_4th_order_r_1year_short_with_moon,"b-@",
      time,m_Velocity_Verlet_r_1year_short_with_moon,"y-@"
);
title ("A graph of Earths Orbit radius for the period 1 year");
xlabel ("Mission time (weeks) with Step size: 450.0s");
ylabel ("Orbit Radius (km)");
legend("Euler-Moon","Adams_Bashforth-Moon","Runga_Kutta_4th_order-Moon","Velocity_Verlet-Moon",
       "Euler+Moon","Adams_Bashforth+Moon","Runga_Kutta_4th_order+Moon","Velocity_Verlet+Moon");
% export GDFONTPATH=/usr/share/fonts/dejavu/
print(name,"-r1200","-dgif","-FDejaVuSans");
