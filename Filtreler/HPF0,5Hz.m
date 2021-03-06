function Hd = HPF0,5Hz
%HPF0,5HZ Returns a discrete-time filter object.

%
% MATLAB Code
% Generated by MATLAB(R) 8.0 and the Signal Processing Toolbox 6.18.
%
% Generated on: 17-Jan-2015 23:16:10
%

% Equiripple Highpass filter designed using the FIRPM function.

% All frequency values are in Hz.
Fs = 5000;  % Sampling Frequency

Fstop = 0.5;             % Stopband Frequency
Fpass = 500;             % Passband Frequency
Dstop = 0.0001;          % Stopband Attenuation
Dpass = 0.057501127785;  % Passband Ripple
dens  = 20;              % Density Factor

% Calculate the order from the parameters using FIRPMORD.
[N, Fo, Ao, W] = firpmord([Fstop, Fpass]/(Fs/2), [0 1], [Dstop, Dpass]);

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, Fo, Ao, W, {dens});
Hd = dfilt.dffir(b);

% [EOF]
