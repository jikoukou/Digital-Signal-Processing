%% MEROS A (FIR FILTER WITH HAMMING WINDOW)

function FIR_hamm = FIR()
  Rf_p = 0.1; %% Syxnothta gia th zwnh diavashs
  Rf_s = 0.3; %% Syxnothta gia th zwnh apokophs
  
  %% Den pollaplasiazetai me pi epeidh auto to kanei to fir1
  
  Rf_diff = Rf_s - Rf_p; %% Domega tou zhtoumenou filtrou
  cutoff = (Rf_p + Rf_s) / 2; %% Omega idanikou katwperatou filtrou
  
  filter_length = 8*pi / (Rf_diff*pi);
  FIR_hamm = fir1(filter_length, cutoff); %% Xrhsh hamming me mhkos = filter_length
  
  figure(1); impz(FIR_hamm, 1); title('Impulse response of FIR'); %% arithmhths FIR_hamm PARONOMASTIS 1
  figure(2); stepz(FIR_hamm, 1); title('Step response of FIR');
  
  figure(3); freqz(FIR_hamm, 1, 512); title('Frequency response of FIR');
  figure(4); grpdelay(FIR_hamm, 1, 512); title('Group delay of FIR');