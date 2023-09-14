%%MEROS A (IIR FILTER WITH BUTTERWORTH)

function [b, a] = IIR()
  Max_ripple_pass = 1; % (dB)
  passband_frq = 0.1; % *pi
  
  Max_ripple_stop = 40; % dB
  stopband_frq = 0.3; % *pi
  
  
  [order, cutoff] = buttord(passband_frq, stopband_frq, Max_ripple_pass, Max_ripple_stop);
  
  %% b arithmhths kai a paronomastis
  
  [b, a] = butter(order, cutoff); %% Bilinear logw tou algorithmou tou
  
  figure(1); impz(b, a); title('Impulse response of IIR');
  figure(2); stepz(b, a, 512); title('Step response of IIR');
  
  figure(3); freqz(b,a, 512); title('Frequency response of IIR');
  figure(4); grpdelay(b, a, 512); title('Group delay of IIR');
  
  figure(5); zplane(b, a); title('Poles and zeros of IIR');