#!/usr/bin/octave

function inside = rand_inside_hyper_circle(dim)
  sum_sq = 0;
  for d = 1:dim
    sum_sq += (2*rand(1)-1)^2;
  end
  inside = (sum_sq <= 1);
end % get_hyper_circle_size

function volume = get_hyper_circle_volume_estimate(dim, samples)
  inside = 0;
  hypercube_volume = 2 ^ dim;
  for sample = 1:samples
    if rand_inside_hyper_circle(dim)
      inside += 1;
    end
  end
  ratio = inside/samples;
  volume = hypercube_volume * ratio;
end

function volume = get_hyper_circle_volume(dim)
  r = 1;
  cn = pi**(dim/2)/gamma(dim/2+1);
  volume = cn*r^dim;
end

lwb_dim=2; upb_dim=9; % no point doing dim=1;
lwb_scale_samples=1; upb_scale_samples=6;

scale=10**(1);

log_error_list=zeros(upb_dim, upb_scale_samples);
est_error_list=zeros(upb_dim, upb_scale_samples);

for i = lwb_scale_samples:upb_scale_samples
  x(i)=log(scale**i);
end

for scale_samples = lwb_scale_samples:upb_scale_samples;

  for dim = lwb_dim:upb_dim
    samples = round(scale ^ scale_samples);
    printf("dimension=%d; ", dim);
    printf("samples=%d; ", samples);
    printf("actual=%f; ", actual=get_hyper_circle_volume(dim));
    printf("estimate=%f; ", estimate=get_hyper_circle_volume_estimate(dim,samples));
    printf("error=%.4f; ", error=abs(actual-estimate));
    printf("log error=%.2f; ", log_error=log(abs(actual-estimate)));
    printf("error*samples^(1/n)=%.1f; ", est_error=abs(actual-estimate)*(samples**(1/dim)));
    printf("\n");
    log_error_list(dim, scale_samples)=log_error;
    est_error_list(dim, scale_samples)=est_error;
  end % for
end % for

log_error_list = log_error_list(lwb_dim:upb_dim,:);
est_error_list = est_error_list(lwb_dim:upb_dim,:);
plot(x,transpose(log_error_list));
title ("Monte Carlo Integration Accuracy vs Number of Samples");
xlabel ("Log10 Number of Samples");
ylabel ("Decimal places accuracy achieved");
% text (pi, 0.7, "arbitrary text");
legend ("Circle","Sphere","4-Ball","5-Ball","6-Ball","7-Ball","8-Ball","9-Ball");
% export GDFONTPATH=/usr/share/fonts/dejavu/
print("hyper_circle_error_vs_samples.gif","-dgif","-FDejaVuSans");
