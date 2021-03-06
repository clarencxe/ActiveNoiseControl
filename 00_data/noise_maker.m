%
%	³·g{KEX«zCgmCY ¶¬\[XR[h
% ----------------------------------------
%	ì¬ÒF Yzî
%	ì¬úF 2019.9.25
%

clear;
close all;


%% ÝèÏ (CÓÉÝè)
%-------------------------------------
% wavÌÝè
Time_length		= 5.0;				%	wavÌ·³(b)
Sampling_freq	= 16000;			%	TvOüg

% ³·gmCYÌÝè
Sin_freq		= 700*(1:10);		%	³·gÌüg(zñ)
Sin_phase		= 2*pi*rand(1,10);	%	³·gÌÊ(zñ)
Sin_amp			= 0.8.^(1:10);		%	³·gÌU(zñ)

% KEX«zCgmCYÌÝè
White_amp		= 0.5;				%	KEX«zCgmCYÌU
%-------------------------------------

%% mCY¶¬
Sample			= round(Time_length * Sampling_freq);	%	Tv

% ¡³·gmCY
Sinusoids		= zeros(Sample,1);
for i=1:Sample
	Sinusoids(i) = sum(Sin_amp .* sin( 2*pi * i * Sin_freq./Sampling_freq + Sin_phase ));	% ¡³·gmCY
end

% zCgmCY
White			= White_amp * randn(Sample,1);

% «µí¹½mCY
Noise			= White + Sinusoids;

% mCYÌUÌ³K»
Normalized_Pow	= 0.3;				% ³K»p[^
Noise			= Normalized_Pow * Noise./ max(abs(Noise));


% wavÖÌ«oµ
audiowrite('artificial_harmonic.wav',Noise,Sampling_freq);


