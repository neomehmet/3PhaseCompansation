clear all
diary devre_Soru_1_cevaplar.txt 
Line_Empedans = 5 + 1.885j 
Load_A_Empedans = 19 + j*377*77*10.^-3 
Empedans = Line_Empedans + Load_A_Empedans 
Va = 110  % volt
Ia_Complex = Va / Empedans  % amper
Ia_phase_degree = atand( imag(Ia_Complex)/ real(Ia_Complex))
Ia_Genlik = abs(Ia_Complex)
VAN_Complex = Va - (Ia_Complex * Line_Empedans)  %volt
VAN_phase_degree = atand ( (imag(VAN_Complex)) / real(VAN_Complex) )
VAN_genlik  = abs(VAN_Complex) 
Iaconj = conj(Ia_Complex) 

KomplexP_A = VAN_Complex *Iaconj  % VA birim
AktiveP_A = real(KomplexP_A)  % WATT birim
ReaktiveP_A = imag(KomplexP_A)  % VAR birim
ApperentP_A = sqrt((ReaktiveP_A.^2) + AktiveP_A.^2)  % VA
%Power_Factor_A = AktiveP_A/ApperentP_A 
%phasedifferenceVoltageAndCurrent = acosd(Power_Factor_A) % degree

% 2. kisim
Compansation_Empedans = -1j*(VAN_genlik.^2  / ReaktiveP_A )% Xc Vkare/reaktif P
New_Load_A_Empedans = (Load_A_Empedans * Compansation_Empedans ) / ( Load_A_Empedans + Compansation_Empedans )
New_Empedans = Line_Empedans + New_Load_A_Empedans 
New_Ia_Complex = Va / New_Empedans
New_Ia_phase_degree = atand(imag(New_Ia_Complex)/real(New_Ia_Complex))
New_Ia_genlik = abs(New_Ia_Complex)
New_VAN_Complex = New_Ia_Complex*New_Load_A_Empedans
New_VAN_phase_degree = atand(imag(New_VAN_Complex)/real(New_VAN_Complex))
New_VAN_Genlik = abs(New_VAN_Complex) 
newIaconj = conj(New_Ia_Complex)
New_KomplexP_A = New_VAN_Complex*newIaconj
New_AktiveP_A = real(New_KomplexP_A)  % WATT birim
New_ReaktiveP_A = imag(New_KomplexP_A)  % VAR birim
New_ApperentP_A = sqrt((New_ReaktiveP_A.^2) + New_AktiveP_A.^2) % VA




diary off