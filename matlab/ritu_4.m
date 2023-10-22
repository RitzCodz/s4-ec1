%--------Question 4-------


d=[1 0 1 1 0]; % Data sequence
b=2*d-1; % Convert unipolar to bipolar
T=1; % Bit duration
Eb=T/2; % This will result in unit amplitude waveforms
fc=3/T; % Carrier frequency
t=linspace(0,5,1000); % discrete time sequence between 0 and 5*T (1000 samples)
N=length(t); % Number of samples
Nsb=N/length(d); % Number of samples per bit
dd=repmat(d',1,Nsb); % replicate each bit Nsb times
bb=repmat(b',1,Nsb); dw=dd'; % Transpose the rows and columns
dw=dw(:)'; 
% Convert dw to a column vector (colum by column) and convert to a row vector
bw=bb';
bw=bw(:)'; % Data sequence samples
w=sqrt(2*Eb/T)*cos(2*pi*fc*t); % carrier waveform
bpsk_w=bw.*w; % modulated waveform
% plotting commands follow
subplot(4,1,1);
plot(t,dw); axis([0 5 -1.5 1.5])
subplot(4,1,2);
plot(t,bw); axis([0 5 -1.5 1.5])
subplot(4,1,3);
plot(t,w); axis([0 5 -1.5 1.5])
subplot(4,1,4);
plot(t,bpsk_w,'.'); axis([0 5 -1.5 1.5])
title('BPSK Modulation (random) ');
xlabel('time')
N  = 10^3; % number of symbols
am = 2*(rand(1,N)>0.5)-1 + j*(2*(rand(1,N)>0.5)-1); % generating random binary sequence
fs = 10; % sampling frequency in Hz

% defining the sinc filter
sincNum = sin(pi*[-fs:1/fs:fs]); % numerator of the sinc function
sincDen = (pi*[-fs:1/fs:fs]); % denominator of the sinc function
sincDenZero = find(abs(sincDen) < 10^-10);
sincOp = sincNum./sincDen;
sincOp(sincDenZero) = 1; % sin(pix/(pix) =1 for x =0

% raised cosine filter
alpha = 0.5;
cosNum = cos(alpha*pi*[-fs:1/fs:fs]);
cosDen = (1-(2*alpha*[-fs:1/fs:fs]).^2);
cosDenZero = find(abs(cosDen)<10^-10);
cosOp = cosNum./cosDen;
cosOp(cosDenZero) = pi/4;

gt_alpha5 = sincOp.*cosOp;

alpha = 1;
cosNum = cos(alpha*pi*[-fs:1/fs:fs]);
cosDen = (1-(2*alpha*[-fs:1/fs:fs]).^2);
cosDenZero = find(abs(cosDen)<10^-10);
cosOp = cosNum./cosDen;
cosOp(cosDenZero) = pi/4;
gt_alpha1 = sincOp.*cosOp;

% upsampling the transmit sequence 
amUpSampled = [am;zeros(fs-1,length(am))];
amU = amUpSampled(:).';

% filtered sequence
st_alpha5 = conv(amU,gt_alpha5);
st_alpha1 = conv(amU,gt_alpha1);

% taking only the first 10000 samples 
st_alpha5 = st_alpha5([1:10000]);
st_alpha1 = st_alpha1([1:10000]);

st_alpha5_reshape = reshape(st_alpha5,fs*2,N*fs/20).';
st_alpha1_reshape = reshape(st_alpha1,fs*2,N*fs/20).';

close all
figure;
plot([0:1/fs:1.99],real(st_alpha5_reshape).','b');   
title('eye diagram with alpha=0.5');
xlabel('time')
ylabel('amplitude') 
axis([0 2 -1.5 1.5])
grid on

figure;
plot([0:1/fs:1.99],real(st_alpha1_reshape).','b');  
title('eye diagram with alpha=1') 
xlabel('time')
ylabel('amplitude') 
axis([0 2 -1.5 1.5 ])
grid on
N  = 10^3; % number of symbols
am = 2*(rand(1,N)>0.5)-1 + j*(2*(rand(1,N)>0.5)-1); % generating random binary sequence
fs = 10; % sampling frequency in Hz

% defining the sinc filter
sincNum = sin(pi*[-fs:1/fs:fs]); % numerator of the sinc function
sincDen = (pi*[-fs:1/fs:fs]); % denominator of the sinc function
sincDenZero = find(abs(sincDen) < 10^-10);
sincOp = sincNum./sincDen;
sincOp(sincDenZero) = 1; % sin(pix/(pix) =1 for x =0

% raised cosine filter
alpha = 0.5;
cosNum = cos(alpha*pi*[-fs:1/fs:fs]);
cosDen = (1-(2*alpha*[-fs:1/fs:fs]).^2);
cosDenZero = find(abs(cosDen)<10^-10);
cosOp = cosNum./cosDen;
cosOp(cosDenZero) = pi/4;

gt_alpha5 = sincOp.*cosOp;

alpha = 1;
cosNum = cos(alpha*pi*[-fs:1/fs:fs]);
cosDen = (1-(2*alpha*[-fs:1/fs:fs]).^2);
cosDenZero = find(abs(cosDen)<10^-10);
cosOp = cosNum./cosDen;
cosOp(cosDenZero) = pi/4;
gt_alpha1 = sincOp.*cosOp;

% upsampling the transmit sequence 
amUpSampled = [am;zeros(fs-1,length(am))];
amU = amUpSampled(:).';

% filtered sequence
st_alpha5 = conv(amU,gt_alpha5);
st_alpha1 = conv(amU,gt_alpha1);

% taking only the first 10000 samples 
st_alpha5 = st_alpha5([1:10000]);
st_alpha1 = st_alpha1([1:10000]);

st_alpha5_reshape = reshape(st_alpha5,fs*2,N*fs/20).';
st_alpha1_reshape = reshape(st_alpha1,fs*2,N*fs/20).';

close all
figure;
plot([0:1/fs:1.99],real(st_alpha5_reshape).','b');   
title('rQ4-Eye Diagram with alpha=0.5');
xlabel('time')
ylabel('amplitude') 
axis([0 2 -1.5 1.5])
grid on

figure;
plot([0:1/fs:1.99],real(st_alpha1_reshape).','b');  
title('rQ4-Eye Diagram with alpha=1') 
xlabel('time')
ylabel('amplitude') 
axis([0 2 -1.5 1.5 ])
grid on