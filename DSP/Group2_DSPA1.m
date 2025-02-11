clc; clear; close all;

N = 20; % Length of the signal
n = 0:N-1; % Time index
l = 5; % Shift amount

% Define Real Even Signal
x_even = 1j*sin(2*pi*n/N);  %cos(2*pi*n/N) even sequence,remove imag for real 
                             % randn(1,N); random sequence
%Time shifts
x_shifted= circshift(x_even,l);
subplot(3,2,1);
stem(n,imag(x_even),'b','filled');
title('Original Signal')
xlabel('Index')
subplot(3,2,2);
stem(n,imag(x_shifted),'r','filled');
title('Time shifted signal')
xlabel('Index')

%DFT Magnitude
xedft = fft(x_even);
xesdft = fft(x_shifted);
subplot(3,2,3);
stem(n,abs(xedft),'b','filled');
title('Magnitude Spectrum of X_{even}[k]')
xlabel('Index');

subplot(3,2,4);
stem(n,abs(xesdft),'r','filled');
title('Magnitude Spectrum of X_{Timeshifted}[k]');
xlabel('Index');

%DFT Angle 
subplot(3,2,5);
stem(n,angle(xedft),'b','filled');
title('Phase Spectrum of X_{even}[k]')
xlabel('Index');
subplot(3,2,6);
stem(n,angle(xesdft),'r','filled');
title('Phase Spectrum of X_{Timeshifted}[k]');
xlabel('Index');


%complex conjugate 
figure;
xe_conj = conj(x_even);
xecdft = fft(xe_conj);
subplot(3,2,1);
stem(n,imag(x_even),'b','filled');
title('Original Signal');
subplot(3,2,2);
stem(n,imag(xe_conj),'r','filled');
title('Conjugate Signal');

%DFT magnitude 
subplot(3,2,3);
stem(n,abs(xedft),'b','filled');
title('Magnitude Spectrum of X_{even}[k]');
xlabel('Index')
subplot(3,2,4);
stem(n,abs(xecdft),'r','filled');
title('Magnitude Spectrum of X_{Conjugate}[k]')
xlabel('Index')

%DFT Angle 
subplot(3,2,5);
stem(n,angle(xedft),'b','filled');
title('Phase Spectrum of X_{even}[k]')
xlabel('Index');

subplot(3,2,6);
stem(n,angle(xecdft),'r','filled');
title('Phase Spectrum of X_{Conjugate}[k]')
ylabel('Index')

figure;

%Time reversal.

x_reverse = fliplr(x_even);
xrdft = fft(x_reverse);
subplot(3,2,1);
stem(n,imag(x_even),'b','filled');
title('Original Signal');
subplot(3,2,2);
stem(n,imag(x_reverse),'r','filled');
title('Reversed Signal');

%DFT magntiude
subplot(3,2,3);
stem(n,abs(xedft),'b','filled');
title('Magnitude Spectrum of X_{even}[k]');
xlabel('Index')
subplot(3,2,4);
stem(n,abs(xrdft),'r','filled');
title('Magnitude Spectrum of X_{TimeReversal}[k]')
xlabel('Index')

%DFT Phase
subplot(3,2,5);
stem(n,angle(xedft),'b','filled');
title('Phase Spectrum of X_{even}[k]')
xlabel('Index');

subplot(3,2,6);
stem(n,angle(xrdft),'r','filled');
title('Phase Spectrum of X_{TimeReversal}[k]')
ylabel('Index')

%Frequency shift 
x_shifted = x_even .* exp(-1j * 2 * pi * l * n / N);
xfsdft = fft(x_shifted);

% Plot original and shifted time-domain signals
figure;
subplot(3,2,1);
stem(n, imag(x_even), 'b','filled');
title('Original Even Signal x[n]');
grid on;

subplot(3,2,2);
stem(n,(x_shifted),'r','filled');
title('Frequency Shifted Signal x_{shifted}[n]');
grid on;

%DFT magnitude
subplot(3,2,3);
stem(n,abs(xedft),'b','filled');
title('Magnitude Spectrum of X_{even}[k]');
grid on;

subplot(3,2,4);
stem(0:N-1, abs(xfsdft), 'r','filled');
title('Magnitude Spectrum of X_{shifted}[k]');
xlabel('k'); ylabel('|X_{shifted}[k]|'); grid on;

% Phase DFT
subplot(3,2,5);
stem(0:N-1, angle(xedft),'b','filled');
title('Phase Spectrum of X_{even}[k]');
grid on;

subplot(3,2,6);
stem(0:N-1, angle(xfsdft), 'r','filled');
title('Phase Spectrum of X_{shifted}[k]');
grid on;
