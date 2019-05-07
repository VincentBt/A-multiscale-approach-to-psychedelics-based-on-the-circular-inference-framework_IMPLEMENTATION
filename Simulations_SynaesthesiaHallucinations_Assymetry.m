%%% Simulations for different values of La, Lv
%%% Synaesthesia / Hallucinations - P=0 (No prior)
%%% Asymmetry


%% PARAMETERS
Nrep = 30; % Beliefs
ws1 = 0.95; % FF weight
ws0 = 0.05;
wp1 = 0.95; % FB weight
wp0 = 0.05;
La = -3:0.5:3; % auditory input
Lv = -3:0.5:3; % visual input


%% NO LOOPS (ac = ad = 1)
ac = 1; % Loops
ad = 1;
BA=zeros(Nrep,length(La),length(Lv)); % Beliefs
BA2=zeros(Nrep,length(La),length(Lv));
BA3=zeros(Nrep,length(La),length(Lv));
BA4=zeros(Nrep,length(La),length(Lv));
BA5=zeros(Nrep,length(La),length(Lv));
BV=zeros(Nrep,length(La),length(Lv));
BV2=zeros(Nrep,length(La),length(Lv));
BV3=zeros(Nrep,length(La),length(Lv));
BV4=zeros(Nrep,length(La),length(Lv));
BV5=zeros(Nrep,length(La),length(Lv));
BV6=zeros(Nrep,length(La),length(Lv));
BV7=zeros(Nrep,length(La),length(Lv));
BB = zeros(Nrep,length(La),length(Lv));
MA5A4=zeros(Nrep,length(La),length(Lv)); % messages
MA4A5=zeros(Nrep,length(La),length(Lv));
MA4A3=zeros(Nrep,length(La),length(Lv));
MA3A4=zeros(Nrep,length(La),length(Lv));
MA3A2=zeros(Nrep,length(La),length(Lv));
MA2A3=zeros(Nrep,length(La),length(Lv));
MA2A=zeros(Nrep,length(La),length(Lv));
MAA2=zeros(Nrep,length(La),length(Lv));
MAB=zeros(Nrep,length(La),length(Lv));
MBA=zeros(Nrep,length(La),length(Lv));
MV7V6=zeros(Nrep,length(La),length(Lv));
MV6V7=zeros(Nrep,length(La),length(Lv));
MV6V5=zeros(Nrep,length(La),length(Lv));
MV5V6=zeros(Nrep,length(La),length(Lv));
MV5V4=zeros(Nrep,length(La),length(Lv));
MV4V5=zeros(Nrep,length(La),length(Lv));
MV4V3=zeros(Nrep,length(La),length(Lv));
MV3V4=zeros(Nrep,length(La),length(Lv));
MV3V2=zeros(Nrep,length(La),length(Lv));
MV2V3=zeros(Nrep,length(La),length(Lv));
MV2V=zeros(Nrep,length(La),length(Lv));
MVV2=zeros(Nrep,length(La),length(Lv));
MVB=zeros(Nrep,length(La),length(Lv));
MBV=zeros(Nrep,length(La),length(Lv)); 

for a = 1:length(La) % BP
    for v = 1:length(Lv)
        for rep = 1:Nrep-1
            BB(rep+1,a,v) = MAB(rep,a,v) + MVB(rep,a,v);
            BA(rep+1,a,v) = MA2A(rep,a,v) + MBA(rep,a,v);
            BV(rep+1,a,v) = MV2V(rep,a,v) + MBV(rep,a,v);
            BV2(rep+1,a,v) = MVV2(rep,a,v) + MV3V2(rep,a,v);
            BV3(rep+1,a,v) = MV2V3(rep,a,v) + MV4V3(rep,a,v);
            BV4(rep+1,a,v) = MV3V4(rep,a,v) + MV5V4(rep,a,v);
            BV5(rep+1,a,v) = MV4V5(rep,a,v) + MV6V5(rep,a,v);
            BV6(rep+1,a,v) = MV5V6(rep,a,v) + MV7V6(rep,a,v);
            BV7(rep+1,a,v) = MV6V7(rep,a,v) + Lv(v);
            BA2(rep+1,a,v) = MAA2(rep,a,v) + MA3A2(rep,a,v);
            BA3(rep+1,a,v) = MA2A3(rep,a,v) + MA4A3(rep,a,v);
            BA4(rep+1,a,v) = MA3A4(rep,a,v) + MA5A4(rep,a,v);
            BA5(rep+1,a,v) = MA4A5(rep,a,v) + La(a);

            MAB(rep+1,a,v) = F(BA(rep+1,a,v) - (ad * MBA(rep,a,v)),ws1,ws0);
            MBA(rep+1,a,v) = F(BB(rep+1,a,v) - (ac * MAB(rep,a,v)),wp1,wp0);
            MVB(rep+1,a,v) = F(BV(rep+1,a,v) - (ad * MBV(rep,a,v)),ws1,ws0);
            MBV(rep+1,a,v) = F(BB(rep+1,a,v) - (ac * MVB(rep,a,v)),wp1,wp0);
            MA2A(rep+1,a,v) = F(BA2(rep+1,a,v) - (ad * MAA2(rep,a,v)),ws1,ws0);
            MAA2(rep+1,a,v) = F(BA(rep+1,a,v) - (ac * MA2A(rep,a,v)),wp1,wp0);
            MA3A2(rep+1,a,v) = F(BA3(rep+1,a,v) - (ad * MA2A3(rep,a,v)),ws1,ws0);
            MA2A3(rep+1,a,v) = F(BA2(rep+1,a,v) - (ac * MA3A2(rep,a,v)),wp1,wp0);
            MA4A3(rep+1,a,v) = F(BA4(rep+1,a,v) - (ad * MA3A4(rep,a,v)),ws1,ws0);
            MA3A4(rep+1,a,v) = F(BA3(rep+1,a,v) - (ac * MA4A3(rep,a,v)),wp1,wp0);
            MA5A4(rep+1,a,v) = F(BA5(rep+1,a,v) - (ad * MA4A5(rep,a,v)),ws1,ws0);
            MA4A5(rep+1,a,v) = F(BA4(rep+1,a,v) - (ac * MA5A4(rep,a,v)),wp1,wp0);
            MV2V(rep+1,a,v) = F(BV2(rep+1,a,v) - (ad * MVV2(rep,a,v)),ws1,ws0);
            MVV2(rep+1,a,v) = F(BV(rep+1,a,v) - (ac * MV2V(rep,a,v)),wp1,wp0);
            MV3V2(rep+1,a,v) = F(BV3(rep+1,a,v) - (ad * MV2V3(rep,a,v)),ws1,ws0);
            MV2V3(rep+1,a,v) = F(BV2(rep+1,a,v) - (ac * MV3V2(rep,a,v)),wp1,wp0);
            MV4V3(rep+1,a,v) = F(BV4(rep+1,a,v) - (ad * MV3V4(rep,a,v)),ws1,ws0);
            MV3V4(rep+1,a,v) = F(BV3(rep+1,a,v) - (ac * MV4V3(rep,a,v)),wp1,wp0);
            MV5V4(rep+1,a,v) = F(BV5(rep+1,a,v) - (ad * MV4V5(rep,a,v)),ws1,ws0);
            MV4V5(rep+1,a,v) = F(BV4(rep+1,a,v) - (ac * MV5V4(rep,a,v)),wp1,wp0);
            MV6V5(rep+1,a,v) = F(BV6(rep+1,a,v) - (ad * MV5V6(rep,a,v)),ws1,ws0);
            MV5V6(rep+1,a,v) = F(BV5(rep+1,a,v) - (ac * MV6V5(rep,a,v)),wp1,wp0);
            MV7V6(rep+1,a,v) = F(BV7(rep+1,a,v) - (ad * MV6V7(rep,a,v)),ws1,ws0);
            MV6V7(rep+1,a,v) = F(BV6(rep+1,a,v) - (ac * MV7V6(rep,a,v)),wp1,wp0);
        end
    end
end        

bBi = exp(BB)./(1+exp(BB)); % Probabilities
bVi = exp(BV)./(1+exp(BV));
bAi = exp(BA)./(1+exp(BA));
bV2i = exp(BV2)./(1+exp(BV2));
bA2i = exp(BA2)./(1+exp(BA2));
bV3i = exp(BV3)./(1+exp(BV3));
bA3i = exp(BA3)./(1+exp(BA3));
bV4i = exp(BV4)./(1+exp(BV4));
bA4i = exp(BA4)./(1+exp(BA4));
bV5i = exp(BV5)./(1+exp(BV5));
bA5i = exp(BA5)./(1+exp(BA5));
bV6i = exp(BV6)./(1+exp(BV6));
bV7i = exp(BV7)./(1+exp(BV7));


%% DESC LOOPS (ac = 1, ad = 0)
ac = 1;
ad = 0;
BA=zeros(Nrep,length(La),length(Lv));
BA2=zeros(Nrep,length(La),length(Lv));
BA3=zeros(Nrep,length(La),length(Lv));
BA4=zeros(Nrep,length(La),length(Lv));
BA5=zeros(Nrep,length(La),length(Lv));
BV=zeros(Nrep,length(La),length(Lv));
BV2=zeros(Nrep,length(La),length(Lv));
BV3=zeros(Nrep,length(La),length(Lv));
BV4=zeros(Nrep,length(La),length(Lv));
BV5=zeros(Nrep,length(La),length(Lv));
BV6=zeros(Nrep,length(La),length(Lv));
BV7=zeros(Nrep,length(La),length(Lv));
BB = zeros(Nrep,length(La),length(Lv));
MA5A4=zeros(Nrep,length(La),length(Lv));
MA4A5=zeros(Nrep,length(La),length(Lv));
MA4A3=zeros(Nrep,length(La),length(Lv));
MA3A4=zeros(Nrep,length(La),length(Lv));
MA3A2=zeros(Nrep,length(La),length(Lv));
MA2A3=zeros(Nrep,length(La),length(Lv));
MA2A=zeros(Nrep,length(La),length(Lv));
MAA2=zeros(Nrep,length(La),length(Lv));
MAB=zeros(Nrep,length(La),length(Lv));
MBA=zeros(Nrep,length(La),length(Lv));
MV7V6=zeros(Nrep,length(La),length(Lv));
MV6V7=zeros(Nrep,length(La),length(Lv));
MV6V5=zeros(Nrep,length(La),length(Lv));
MV5V6=zeros(Nrep,length(La),length(Lv));
MV5V4=zeros(Nrep,length(La),length(Lv));
MV4V5=zeros(Nrep,length(La),length(Lv));
MV4V3=zeros(Nrep,length(La),length(Lv));
MV3V4=zeros(Nrep,length(La),length(Lv));
MV3V2=zeros(Nrep,length(La),length(Lv));
MV2V3=zeros(Nrep,length(La),length(Lv));
MV2V=zeros(Nrep,length(La),length(Lv));
MVV2=zeros(Nrep,length(La),length(Lv));
MVB=zeros(Nrep,length(La),length(Lv));
MBV=zeros(Nrep,length(La),length(Lv)); 

for a = 1:length(La)
    for v = 1:length(Lv)
        for rep = 1:Nrep-1
            BB(rep+1,a,v) = MAB(rep,a,v) + MVB(rep,a,v);
            BA(rep+1,a,v) = MA2A(rep,a,v) + MBA(rep,a,v);
            BV(rep+1,a,v) = MV2V(rep,a,v) + MBV(rep,a,v);
            BV2(rep+1,a,v) = MVV2(rep,a,v) + MV3V2(rep,a,v);
            BV3(rep+1,a,v) = MV2V3(rep,a,v) + MV4V3(rep,a,v);
            BV4(rep+1,a,v) = MV3V4(rep,a,v) + MV5V4(rep,a,v);
            BV5(rep+1,a,v) = MV4V5(rep,a,v) + MV6V5(rep,a,v);
            BV6(rep+1,a,v) = MV5V6(rep,a,v) + MV7V6(rep,a,v);
            BV7(rep+1,a,v) = MV6V7(rep,a,v) + Lv(v);
            BA2(rep+1,a,v) = MAA2(rep,a,v) + MA3A2(rep,a,v);
            BA3(rep+1,a,v) = MA2A3(rep,a,v) + MA4A3(rep,a,v);
            BA4(rep+1,a,v) = MA3A4(rep,a,v) + MA5A4(rep,a,v);
            BA5(rep+1,a,v) = MA4A5(rep,a,v) + La(a);

            MAB(rep+1,a,v) = F(BA(rep+1,a,v) - (ad * MBA(rep,a,v)),ws1,ws0);
            MBA(rep+1,a,v) = F(BB(rep+1,a,v) - (ac * MAB(rep,a,v)),wp1,wp0);
            MVB(rep+1,a,v) = F(BV(rep+1,a,v) - (ad * MBV(rep,a,v)),ws1,ws0);
            MBV(rep+1,a,v) = F(BB(rep+1,a,v) - (ac * MVB(rep,a,v)),wp1,wp0);
            MA2A(rep+1,a,v) = F(BA2(rep+1,a,v) - (ad * MAA2(rep,a,v)),ws1,ws0);
            MAA2(rep+1,a,v) = F(BA(rep+1,a,v) - (ac * MA2A(rep,a,v)),wp1,wp0);
            MA3A2(rep+1,a,v) = F(BA3(rep+1,a,v) - (ad * MA2A3(rep,a,v)),ws1,ws0);
            MA2A3(rep+1,a,v) = F(BA2(rep+1,a,v) - (ac * MA3A2(rep,a,v)),wp1,wp0);
            MA4A3(rep+1,a,v) = F(BA4(rep+1,a,v) - (ad * MA3A4(rep,a,v)),ws1,ws0);
            MA3A4(rep+1,a,v) = F(BA3(rep+1,a,v) - (ac * MA4A3(rep,a,v)),wp1,wp0);
            MA5A4(rep+1,a,v) = F(BA5(rep+1,a,v) - (ad * MA4A5(rep,a,v)),ws1,ws0);
            MA4A5(rep+1,a,v) = F(BA4(rep+1,a,v) - (ac * MA5A4(rep,a,v)),wp1,wp0);
            MV2V(rep+1,a,v) = F(BV2(rep+1,a,v) - (ad * MVV2(rep,a,v)),ws1,ws0);
            MVV2(rep+1,a,v) = F(BV(rep+1,a,v) - (ac * MV2V(rep,a,v)),wp1,wp0);
            MV3V2(rep+1,a,v) = F(BV3(rep+1,a,v) - (ad * MV2V3(rep,a,v)),ws1,ws0);
            MV2V3(rep+1,a,v) = F(BV2(rep+1,a,v) - (ac * MV3V2(rep,a,v)),wp1,wp0);
            MV4V3(rep+1,a,v) = F(BV4(rep+1,a,v) - (ad * MV3V4(rep,a,v)),ws1,ws0);
            MV3V4(rep+1,a,v) = F(BV3(rep+1,a,v) - (ac * MV4V3(rep,a,v)),wp1,wp0);
            MV5V4(rep+1,a,v) = F(BV5(rep+1,a,v) - (ad * MV4V5(rep,a,v)),ws1,ws0);
            MV4V5(rep+1,a,v) = F(BV4(rep+1,a,v) - (ac * MV5V4(rep,a,v)),wp1,wp0);
            MV6V5(rep+1,a,v) = F(BV6(rep+1,a,v) - (ad * MV5V6(rep,a,v)),ws1,ws0);
            MV5V6(rep+1,a,v) = F(BV5(rep+1,a,v) - (ac * MV6V5(rep,a,v)),wp1,wp0);
            MV7V6(rep+1,a,v) = F(BV7(rep+1,a,v) - (ad * MV6V7(rep,a,v)),ws1,ws0);
            MV6V7(rep+1,a,v) = F(BV6(rep+1,a,v) - (ac * MV7V6(rep,a,v)),wp1,wp0);
        end
    end
end        

bBd = exp(BB)./(1+exp(BB));
bVd = exp(BV)./(1+exp(BV));
bAd = exp(BA)./(1+exp(BA));
bV2d = exp(BV2)./(1+exp(BV2));
bA2d = exp(BA2)./(1+exp(BA2));
bV3d = exp(BV3)./(1+exp(BV3));
bA3d = exp(BA3)./(1+exp(BA3));
bV4d = exp(BV4)./(1+exp(BV4));
bA4d = exp(BA4)./(1+exp(BA4));
bV5d = exp(BV5)./(1+exp(BV5));
bA5d = exp(BA5)./(1+exp(BA5));
bV6d = exp(BV6)./(1+exp(BV6));
bV7d = exp(BV7)./(1+exp(BV7));


%% CL LOOPS (ac = 0, ad = 1)
ac = 0;
ad = 1;
BA=zeros(Nrep,length(La),length(Lv));
BA2=zeros(Nrep,length(La),length(Lv));
BA3=zeros(Nrep,length(La),length(Lv));
BA4=zeros(Nrep,length(La),length(Lv));
BA5=zeros(Nrep,length(La),length(Lv));
BV=zeros(Nrep,length(La),length(Lv));
BV2=zeros(Nrep,length(La),length(Lv));
BV3=zeros(Nrep,length(La),length(Lv));
BV4=zeros(Nrep,length(La),length(Lv));
BV5=zeros(Nrep,length(La),length(Lv));
BV6=zeros(Nrep,length(La),length(Lv));
BV7=zeros(Nrep,length(La),length(Lv));
BB = zeros(Nrep,length(La),length(Lv));
MA5A4=zeros(Nrep,length(La),length(Lv));
MA4A5=zeros(Nrep,length(La),length(Lv));
MA4A3=zeros(Nrep,length(La),length(Lv));
MA3A4=zeros(Nrep,length(La),length(Lv));
MA3A2=zeros(Nrep,length(La),length(Lv));
MA2A3=zeros(Nrep,length(La),length(Lv));
MA2A=zeros(Nrep,length(La),length(Lv));
MAA2=zeros(Nrep,length(La),length(Lv));
MAB=zeros(Nrep,length(La),length(Lv));
MBA=zeros(Nrep,length(La),length(Lv));
MV7V6=zeros(Nrep,length(La),length(Lv));
MV6V7=zeros(Nrep,length(La),length(Lv));
MV6V5=zeros(Nrep,length(La),length(Lv));
MV5V6=zeros(Nrep,length(La),length(Lv));
MV5V4=zeros(Nrep,length(La),length(Lv));
MV4V5=zeros(Nrep,length(La),length(Lv));
MV4V3=zeros(Nrep,length(La),length(Lv));
MV3V4=zeros(Nrep,length(La),length(Lv));
MV3V2=zeros(Nrep,length(La),length(Lv));
MV2V3=zeros(Nrep,length(La),length(Lv));
MV2V=zeros(Nrep,length(La),length(Lv));
MVV2=zeros(Nrep,length(La),length(Lv));
MVB=zeros(Nrep,length(La),length(Lv));
MBV=zeros(Nrep,length(La),length(Lv)); 

for a = 1:length(La)
    for v = 1:length(Lv)
        for rep = 1:Nrep-1
            BB(rep+1,a,v) = MAB(rep,a,v) + MVB(rep,a,v);
            BA(rep+1,a,v) = MA2A(rep,a,v) + MBA(rep,a,v);
            BV(rep+1,a,v) = MV2V(rep,a,v) + MBV(rep,a,v);
            BV2(rep+1,a,v) = MVV2(rep,a,v) + MV3V2(rep,a,v);
            BV3(rep+1,a,v) = MV2V3(rep,a,v) + MV4V3(rep,a,v);
            BV4(rep+1,a,v) = MV3V4(rep,a,v) + MV5V4(rep,a,v);
            BV5(rep+1,a,v) = MV4V5(rep,a,v) + MV6V5(rep,a,v);
            BV6(rep+1,a,v) = MV5V6(rep,a,v) + MV7V6(rep,a,v);
            BV7(rep+1,a,v) = MV6V7(rep,a,v) + Lv(v);
            BA2(rep+1,a,v) = MAA2(rep,a,v) + MA3A2(rep,a,v);
            BA3(rep+1,a,v) = MA2A3(rep,a,v) + MA4A3(rep,a,v);
            BA4(rep+1,a,v) = MA3A4(rep,a,v) + MA5A4(rep,a,v);
            BA5(rep+1,a,v) = MA4A5(rep,a,v) + La(a);

            MAB(rep+1,a,v) = F(BA(rep+1,a,v) - (ad * MBA(rep,a,v)),ws1,ws0);
            MBA(rep+1,a,v) = F(BB(rep+1,a,v) - (ac * MAB(rep,a,v)),wp1,wp0);
            MVB(rep+1,a,v) = F(BV(rep+1,a,v) - (ad * MBV(rep,a,v)),ws1,ws0);
            MBV(rep+1,a,v) = F(BB(rep+1,a,v) - (ac * MVB(rep,a,v)),wp1,wp0);
            MA2A(rep+1,a,v) = F(BA2(rep+1,a,v) - (ad * MAA2(rep,a,v)),ws1,ws0);
            MAA2(rep+1,a,v) = F(BA(rep+1,a,v) - (ac * MA2A(rep,a,v)),wp1,wp0);
            MA3A2(rep+1,a,v) = F(BA3(rep+1,a,v) - (ad * MA2A3(rep,a,v)),ws1,ws0);
            MA2A3(rep+1,a,v) = F(BA2(rep+1,a,v) - (ac * MA3A2(rep,a,v)),wp1,wp0);
            MA4A3(rep+1,a,v) = F(BA4(rep+1,a,v) - (ad * MA3A4(rep,a,v)),ws1,ws0);
            MA3A4(rep+1,a,v) = F(BA3(rep+1,a,v) - (ac * MA4A3(rep,a,v)),wp1,wp0);
            MA5A4(rep+1,a,v) = F(BA5(rep+1,a,v) - (ad * MA4A5(rep,a,v)),ws1,ws0);
            MA4A5(rep+1,a,v) = F(BA4(rep+1,a,v) - (ac * MA5A4(rep,a,v)),wp1,wp0);
            MV2V(rep+1,a,v) = F(BV2(rep+1,a,v) - (ad * MVV2(rep,a,v)),ws1,ws0);
            MVV2(rep+1,a,v) = F(BV(rep+1,a,v) - (ac * MV2V(rep,a,v)),wp1,wp0);
            MV3V2(rep+1,a,v) = F(BV3(rep+1,a,v) - (ad * MV2V3(rep,a,v)),ws1,ws0);
            MV2V3(rep+1,a,v) = F(BV2(rep+1,a,v) - (ac * MV3V2(rep,a,v)),wp1,wp0);
            MV4V3(rep+1,a,v) = F(BV4(rep+1,a,v) - (ad * MV3V4(rep,a,v)),ws1,ws0);
            MV3V4(rep+1,a,v) = F(BV3(rep+1,a,v) - (ac * MV4V3(rep,a,v)),wp1,wp0);
            MV5V4(rep+1,a,v) = F(BV5(rep+1,a,v) - (ad * MV4V5(rep,a,v)),ws1,ws0);
            MV4V5(rep+1,a,v) = F(BV4(rep+1,a,v) - (ac * MV5V4(rep,a,v)),wp1,wp0);
            MV6V5(rep+1,a,v) = F(BV6(rep+1,a,v) - (ad * MV5V6(rep,a,v)),ws1,ws0);
            MV5V6(rep+1,a,v) = F(BV5(rep+1,a,v) - (ac * MV6V5(rep,a,v)),wp1,wp0);
            MV7V6(rep+1,a,v) = F(BV7(rep+1,a,v) - (ad * MV6V7(rep,a,v)),ws1,ws0);
            MV6V7(rep+1,a,v) = F(BV6(rep+1,a,v) - (ac * MV7V6(rep,a,v)),wp1,wp0);
        end
    end
end        

bBc = exp(BB)./(1+exp(BB));
bVc = exp(BV)./(1+exp(BV));
bAc = exp(BA)./(1+exp(BA));
bV2c = exp(BV2)./(1+exp(BV2));
bA2c = exp(BA2)./(1+exp(BA2));
bV3c = exp(BV3)./(1+exp(BV3));
bA3c = exp(BA3)./(1+exp(BA3));
bV4c = exp(BV4)./(1+exp(BV4));
bA4c = exp(BA4)./(1+exp(BA4));
bV5c = exp(BV5)./(1+exp(BV5));
bA5c = exp(BA5)./(1+exp(BA5));
bV6c = exp(BV6)./(1+exp(BV6));
bV7c = exp(BV7)./(1+exp(BV7));


%% FIGURES

figure(1) % No Loops
subplot(1,2,1)
surf(Lv,La,squeeze(bVi(end,:,:)))
view(2)
xlabel('Lv')
ylabel('La')
title('Bv')
subplot(1,2,2)
surf(Lv,La,squeeze(bA3i(end,:,:)))
view(2)
xlabel('Lv')
ylabel('La')
title('Ba')
colorbar
suptitle('No Loops')

figure(2) % Descending Loops
subplot(1,2,1)
surf(Lv,La,squeeze(bVd(end,:,:)))
view(2)
xlabel('Lv')
ylabel('La')
title('Bv')
subplot(1,2,2)
surf(Lv,La,squeeze(bA3d(end,:,:)))
view(2)
xlabel('Lv')
ylabel('La')
title('Ba')
colorbar
suptitle('Desc Loops')

figure(3) % Climbing Loops
subplot(1,2,1)
surf(Lv,La,squeeze(bVc(end,:,:)))
view(2)
xlabel('Lv')
ylabel('La')
title('Bv')
subplot(1,2,2)
surf(Lv,La,squeeze(bA3c(end,:,:)))
view(2)
xlabel('Lv')
ylabel('La')
title('Ba')
colorbar
suptitle('Cl Loops')