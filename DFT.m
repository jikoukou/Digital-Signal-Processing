%% Latiniko onoma: Dimitrios (9 grammata)
%% Latiniko epitheto: Koukougiannis (13)

function fouriert = DFT()
  %% Orismos parametrwn
  
  L = 64; %% allazei
  A1 = 1; A2 = 0.5; 
  l1 = 9; l2 = 13;
  
  A = [l1 l2]; %% Pinakas gia ton arithmo twn grammatwn
  frq1 = pi*mod((10/7.5) * (max(A) / (l1 + l2)), 1);
  frq2 = mod(frq1 + (pi / 4), pi);
  N = L; %% allazei
  
  for i = 1:1:100
  signalA = inline('A1*cos(frq1*n) + A2*cos(frq2*n)'); %% x[n]
  xconf = linspace(0, L - 1, L);
  signalB = signalA(A1, A2, frq1, frq2, xconf).*hamming(L)'; %% Parathiromeno shma L stoixeia


  %% .* Shmainei oti pollaplasiazoume stoixeio me stoixeio(x[1]*x[1] x[2]*x[2] etc])
  fouriert = fft(signalB, N);
  xlin = linspace(0, pi, N);
  figure(i);
  plot(xlin,20*log10(abs(fouriert)), 'b-');hold on; stem(xlin, 20*log10(abs(fouriert)));
  xlabel('Radian frequency'); ylabel('20log10(|X[k]|)'); 
  title(['DFT with length N = ', num2str(N), ' and window length L = ', num2str(L)]);
  
  center = (frq1 + frq2) / 2;
  frq1 = (frq1 + center) / 2;
  frq2 = (frq2 + center) / 2;
  
  disp('Iterations: '); disp(i);
  pause(3);
  end