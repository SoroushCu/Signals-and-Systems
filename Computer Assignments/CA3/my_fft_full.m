function [amp,phase,f] = my_fft_full(y, Fs) % calculating the full FFT with proper frequency vector
	L = length(y);
	NFFT = 2^nextpow2(L);
	Y = fftshift(fft(y, NFFT))/L;
	f = (Fs/2) * linspace(-1, 1, NFFT);
	amp = abs(Y(1:NFFT));
    phase=angle(Y(1:NFFT));
end
