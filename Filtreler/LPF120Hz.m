function Hd = LPF120Hz
%LPF120HZ Returns a discrete-time filter object.

%
% MATLAB Code
% Generated by MATLAB(R) 8.0 and the Signal Processing Toolbox 6.18.
%
% Generated on: 17-Jan-2015 23:08:32
%

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 5000;  % Sampling Frequency

Fpass = 120;             % Passband Frequency
Fstop = 240;             % Stopband Frequency
Dpass = 0.057501127785;  % Passband Ripple
Dstop = 0.0001;          % Stopband Attenuation
dens  = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fpass, Fstop]/(Fs/2), [1 0], [Dpass, Dstop]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
