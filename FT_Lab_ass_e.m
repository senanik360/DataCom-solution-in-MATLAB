clc;
mn=[];
for n=ss:ss:length(Rec)
t=bp/100:bp/100:bp;
y=cos(2*pi*f*t); % carrier signal
mm=y.*Rec((n-(ss-1)):n);
t5=bp/100:bp/100:bp;
z=trapz(t5,mm) ; % intregation
zz=round((1*z/bp));
if(zz<=(a1+a2)/2)
a=0;
a1=0;
elseif(zz>(a1+a2)/2 && zz<=(a2+a3)/2)%logic level
a=0;
a1=1;
elseif(zz>(a2+a3)/2 && zz<= (a3+a4)/2)%logic level
a=1;
a1=0;
else
a=1;
a1=1;
end
mn=[mn a a1];
end
disp(' Recover the bit sequence from the Received Noisy Signal :');
disp(mn);