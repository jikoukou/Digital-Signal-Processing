%%Synthetiko fonien

function plotting = fonien()
  
  pn = inline('0.9999^k');
  
  for i = 1:1:100
    plotting(1, i) = pn(i - 1);
  endfor
  
  figure(1);
  xplot = [0:80:7999];
  stem(xplot, plotting);
  
  
  dft = fft(plotting, 8000);
  xlin = linspace(0, pi, 8000); 
  
  %% DFT apotelei deigmatolipsia DTFT omega = (2pi / N)*k 0 <= k <= N - 1
  
  figure(2);
  plot(xlin, abs(dft), 'b-');
  ylabel('|P(e\^(jù)|');
  xlabel('ù');
  
  figure(3);
  paranomastis(1, 1) = 1;
  paranomastis(2:80, 1) = 0;
  paranomastis(81, 1) = -0.9999;
  zplane(1, paranomastis);
