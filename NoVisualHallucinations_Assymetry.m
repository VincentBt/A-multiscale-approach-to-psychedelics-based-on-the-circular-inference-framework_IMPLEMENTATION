%%% Hallucinations
%%% Asymmetry
%%% No visual hallucinations

%%% L:Letter / Audition 
%%% C: Colour / Vision 


%% PARAMETERS
Nrep = 30; % nb of repetitions for BP
ws1 = 0.95; % FF weight
ws0 = 0.05;
wp1 = 0.95; % FB weight
wp0 = 0.05;
Ll = -0.3; % auditory input
Lc = 0.4; % visual input
MSL = Ll;
MSC = Lc;


%% BP - No Loops
ac = 1; % Loops
ad = 1;
BL=zeros(Nrep,1); % Beliefs
BL2=zeros(Nrep,1);
BL3=zeros(Nrep,1);
BL4=zeros(Nrep,1);
BL5=zeros(Nrep,1);
BC=zeros(Nrep,1);
BC2=zeros(Nrep,1);
BC3=zeros(Nrep,1);
BC4=zeros(Nrep,1);
BC5=zeros(Nrep,1);
BC6=zeros(Nrep,1);
BC7=zeros(Nrep,1);
BB = zeros(Nrep,1);
ML5L4=zeros(Nrep,1); % Messages
ML4L5=zeros(Nrep,1);
ML4L3=zeros(Nrep,1);
ML3L4=zeros(Nrep,1);
ML3L2=zeros(Nrep,1);
ML2L3=zeros(Nrep,1);
ML2L=zeros(Nrep,1);
MLL2=zeros(Nrep,1);
MLB=zeros(Nrep,1);
MBL=zeros(Nrep,1);
MC7C6=zeros(Nrep,1);
MC6C7=zeros(Nrep,1);
MC6C5=zeros(Nrep,1);
MC5C6=zeros(Nrep,1);
MC5C4=zeros(Nrep,1);
MC4C5=zeros(Nrep,1);
MC4C3=zeros(Nrep,1);
MC3C4=zeros(Nrep,1);
MC3C2=zeros(Nrep,1);
MC2C3=zeros(Nrep,1);
MC2C=zeros(Nrep,1);
MCC2=zeros(Nrep,1);
MCB=zeros(Nrep,1);
MBC=zeros(Nrep,1); 

for rep = 1:Nrep-1
    BB(rep+1) = MLB(rep) + MCB(rep);
    BL(rep+1) = ML2L(rep) + MBL(rep);
    BC(rep+1) = MC2C(rep) + MBC(rep);
    BC2(rep+1) = MCC2(rep) + MC3C2(rep);
    BC3(rep+1) = MC2C3(rep) + MC4C3(rep);
    BC4(rep+1) = MC3C4(rep) + MC5C4(rep);
    BC5(rep+1) = MC4C5(rep) + MC6C5(rep);
    BC6(rep+1) = MC5C6(rep) + MC7C6(rep);
    BC7(rep+1) = MC6C7(rep) + MSC;
    BL2(rep+1) = MLL2(rep) + ML3L2(rep);
    BL3(rep+1) = ML2L3(rep) + ML4L3(rep);
    BL4(rep+1) = ML3L4(rep) + ML5L4(rep);
    BL5(rep+1) = ML4L5(rep) + MSL;

    MLB(rep+1) = F(BL(rep+1) - (ad * MBL(rep)),ws1,ws0);
    MBL(rep+1) = F(BB(rep+1) - (ac * MLB(rep)),wp1,wp0);
    MCB(rep+1) = F(BC(rep+1) - (ad * MBC(rep)),ws1,ws0);
    MBC(rep+1) = F(BB(rep+1) - (ac * MCB(rep)),wp1,wp0);
    ML2L(rep+1) = F(BL2(rep+1) - (ad * MLL2(rep)),ws1,ws0);
    MLL2(rep+1) = F(BL(rep+1) - (ac * ML2L(rep)),wp1,wp0);
    ML3L2(rep+1) = F(BL3(rep+1) - (ad * ML2L3(rep)),ws1,ws0);
    ML2L3(rep+1) = F(BL2(rep+1) - (ac * ML3L2(rep)),wp1,wp0);
    ML4L3(rep+1) = F(BL4(rep+1) - (ad * ML3L4(rep)),ws1,ws0);
    ML3L4(rep+1) = F(BL3(rep+1) - (ac * ML4L3(rep)),wp1,wp0);
    ML5L4(rep+1) = F(BL5(rep+1) - (ad * ML4L5(rep)),ws1,ws0);
    ML4L5(rep+1) = F(BL4(rep+1) - (ac * ML5L4(rep)),wp1,wp0);
    MC2C(rep+1) = F(BC2(rep+1) - (ad * MCC2(rep)),ws1,ws0);
    MCC2(rep+1) = F(BC(rep+1) - (ac * MC2C(rep)),wp1,wp0);
    MC3C2(rep+1) = F(BC3(rep+1) - (ad * MC2C3(rep)),ws1,ws0);
    MC2C3(rep+1) = F(BC2(rep+1) - (ac * MC3C2(rep)),wp1,wp0);
    MC4C3(rep+1) = F(BC4(rep+1) - (ad * MC3C4(rep)),ws1,ws0);
    MC3C4(rep+1) = F(BC3(rep+1) - (ac * MC4C3(rep)),wp1,wp0);
    MC5C4(rep+1) = F(BC5(rep+1) - (ad * MC4C5(rep)),ws1,ws0);
    MC4C5(rep+1) = F(BC4(rep+1) - (ac * MC5C4(rep)),wp1,wp0);
    MC6C5(rep+1) = F(BC6(rep+1) - (ad * MC5C6(rep)),ws1,ws0);
    MC5C6(rep+1) = F(BC5(rep+1) - (ac * MC6C5(rep)),wp1,wp0);
    MC7C6(rep+1) = F(BC7(rep+1) - (ad * MC6C7(rep)),ws1,ws0);
    MC6C7(rep+1) = F(BC6(rep+1) - (ac * MC7C6(rep)),wp1,wp0);
end

bBi = exp(BB)./(1+exp(BB)); % Probabilities
bCi = exp(BC)./(1+exp(BC));
bLi = exp(BL)./(1+exp(BL));
bC2i = exp(BC2)./(1+exp(BC2));
bL2i = exp(BL2)./(1+exp(BL2));
bC3i = exp(BC3)./(1+exp(BC3));
bL3i = exp(BL3)./(1+exp(BL3));
bC4i = exp(BC4)./(1+exp(BC4));
bL4i = exp(BL4)./(1+exp(BL4));
bC5i = exp(BC5)./(1+exp(BC5));
bL5i = exp(BL5)./(1+exp(BL5));
bC6i = exp(BC6)./(1+exp(BC6));
bC7i = exp(BC7)./(1+exp(BC7));


%% BP - Descending Loops
ac = 1;
ad = 0;
BL=zeros(Nrep,1);
BL2=zeros(Nrep,1);
BL3=zeros(Nrep,1);
BL4=zeros(Nrep,1);
BL5=zeros(Nrep,1);
BC=zeros(Nrep,1);
BC2=zeros(Nrep,1);
BC3=zeros(Nrep,1);
BC4=zeros(Nrep,1);
BC5=zeros(Nrep,1);
BC6=zeros(Nrep,1);
BC7=zeros(Nrep,1);
BB = zeros(Nrep,1);
ML5L4=zeros(Nrep,1);
ML4L5=zeros(Nrep,1);
ML4L3=zeros(Nrep,1);
ML3L4=zeros(Nrep,1);
ML3L2=zeros(Nrep,1);
ML2L3=zeros(Nrep,1);
ML2L=zeros(Nrep,1);
MLL2=zeros(Nrep,1);
MLB=zeros(Nrep,1);
MBL=zeros(Nrep,1);
MC7C6=zeros(Nrep,1);
MC6C7=zeros(Nrep,1);
MC6C5=zeros(Nrep,1);
MC5C6=zeros(Nrep,1);
MC5C4=zeros(Nrep,1);
MC4C5=zeros(Nrep,1);
MC4C3=zeros(Nrep,1);
MC3C4=zeros(Nrep,1);
MC3C2=zeros(Nrep,1);
MC2C3=zeros(Nrep,1);
MC2C=zeros(Nrep,1);
MCC2=zeros(Nrep,1);
MCB=zeros(Nrep,1);
MBC=zeros(Nrep,1); 

for rep = 1:Nrep-1
    BB(rep+1) = MLB(rep) + MCB(rep);
    BL(rep+1) = ML2L(rep) + MBL(rep);
    BC(rep+1) = MC2C(rep) + MBC(rep);
    BC2(rep+1) = MCC2(rep) + MC3C2(rep);
    BC3(rep+1) = MC2C3(rep) + MC4C3(rep);
    BC4(rep+1) = MC3C4(rep) + MC5C4(rep);
    BC5(rep+1) = MC4C5(rep) + MC6C5(rep);
    BC6(rep+1) = MC5C6(rep) + MC7C6(rep);
    BC7(rep+1) = MC6C7(rep) + MSC;
    BL2(rep+1) = MLL2(rep) + ML3L2(rep);
    BL3(rep+1) = ML2L3(rep) + ML4L3(rep);
    BL4(rep+1) = ML3L4(rep) + ML5L4(rep);
    BL5(rep+1) = ML4L5(rep) + MSL;

    MLB(rep+1) = F(BL(rep+1) - (ad * MBL(rep)),ws1,ws0);
    MBL(rep+1) = F(BB(rep+1) - (ac * MLB(rep)),wp1,wp0);
    MCB(rep+1) = F(BC(rep+1) - (ad * MBC(rep)),ws1,ws0);
    MBC(rep+1) = F(BB(rep+1) - (ac * MCB(rep)),wp1,wp0);
    ML2L(rep+1) = F(BL2(rep+1) - (ad * MLL2(rep)),ws1,ws0);
    MLL2(rep+1) = F(BL(rep+1) - (ac * ML2L(rep)),wp1,wp0);
    ML3L2(rep+1) = F(BL3(rep+1) - (ad * ML2L3(rep)),ws1,ws0);
    ML2L3(rep+1) = F(BL2(rep+1) - (ac * ML3L2(rep)),wp1,wp0);
    ML4L3(rep+1) = F(BL4(rep+1) - (ad * ML3L4(rep)),ws1,ws0);
    ML3L4(rep+1) = F(BL3(rep+1) - (ac * ML4L3(rep)),wp1,wp0);
    ML5L4(rep+1) = F(BL5(rep+1) - (ad * ML4L5(rep)),ws1,ws0);
    ML4L5(rep+1) = F(BL4(rep+1) - (ac * ML5L4(rep)),wp1,wp0);
    MC2C(rep+1) = F(BC2(rep+1) - (ad * MCC2(rep)),ws1,ws0);
    MCC2(rep+1) = F(BC(rep+1) - (ac * MC2C(rep)),wp1,wp0);
    MC3C2(rep+1) = F(BC3(rep+1) - (ad * MC2C3(rep)),ws1,ws0);
    MC2C3(rep+1) = F(BC2(rep+1) - (ac * MC3C2(rep)),wp1,wp0);
    MC4C3(rep+1) = F(BC4(rep+1) - (ad * MC3C4(rep)),ws1,ws0);
    MC3C4(rep+1) = F(BC3(rep+1) - (ac * MC4C3(rep)),wp1,wp0);
    MC5C4(rep+1) = F(BC5(rep+1) - (ad * MC4C5(rep)),ws1,ws0);
    MC4C5(rep+1) = F(BC4(rep+1) - (ac * MC5C4(rep)),wp1,wp0);
    MC6C5(rep+1) = F(BC6(rep+1) - (ad * MC5C6(rep)),ws1,ws0);
    MC5C6(rep+1) = F(BC5(rep+1) - (ac * MC6C5(rep)),wp1,wp0);
    MC7C6(rep+1) = F(BC7(rep+1) - (ad * MC6C7(rep)),ws1,ws0);
    MC6C7(rep+1) = F(BC6(rep+1) - (ac * MC7C6(rep)),wp1,wp0);
end

bBd = exp(BB)./(1+exp(BB));
bCd = exp(BC)./(1+exp(BC));
bLd = exp(BL)./(1+exp(BL));
bC2d = exp(BC2)./(1+exp(BC2));
bL2d = exp(BL2)./(1+exp(BL2));
bC3d = exp(BC3)./(1+exp(BC3));
bL3d = exp(BL3)./(1+exp(BL3));
bC4d = exp(BC4)./(1+exp(BC4));
bL4d = exp(BL4)./(1+exp(BL4));
bC5d = exp(BC5)./(1+exp(BC5));
bL5d = exp(BL5)./(1+exp(BL5));
bC6d = exp(BC6)./(1+exp(BC6));
bC7d = exp(BC7)./(1+exp(BC7));


%% BP - Climbing Loops
ac = 0;
ad = 1;
BL=zeros(Nrep,1);
BL2=zeros(Nrep,1);
BL3=zeros(Nrep,1);
BL4=zeros(Nrep,1);
BL5=zeros(Nrep,1);
BC=zeros(Nrep,1);
BC2=zeros(Nrep,1);
BC3=zeros(Nrep,1);
BC4=zeros(Nrep,1);
BC5=zeros(Nrep,1);
BC6=zeros(Nrep,1);
BC7=zeros(Nrep,1);
BB = zeros(Nrep,1);
ML5L4=zeros(Nrep,1);
ML4L5=zeros(Nrep,1);
ML4L3=zeros(Nrep,1);
ML3L4=zeros(Nrep,1);
ML3L2=zeros(Nrep,1);
ML2L3=zeros(Nrep,1);
ML2L=zeros(Nrep,1);
MLL2=zeros(Nrep,1);
MLB=zeros(Nrep,1);
MBL=zeros(Nrep,1);
MC7C6=zeros(Nrep,1);
MC6C7=zeros(Nrep,1);
MC6C5=zeros(Nrep,1);
MC5C6=zeros(Nrep,1);
MC5C4=zeros(Nrep,1);
MC4C5=zeros(Nrep,1);
MC4C3=zeros(Nrep,1);
MC3C4=zeros(Nrep,1);
MC3C2=zeros(Nrep,1);
MC2C3=zeros(Nrep,1);
MC2C=zeros(Nrep,1);
MCC2=zeros(Nrep,1);
MCB=zeros(Nrep,1);
MBC=zeros(Nrep,1); 

for rep = 1:Nrep-1
    BB(rep+1) = MLB(rep) + MCB(rep);
    BL(rep+1) = ML2L(rep) + MBL(rep);
    BC(rep+1) = MC2C(rep) + MBC(rep);
    BC2(rep+1) = MCC2(rep) + MC3C2(rep);
    BC3(rep+1) = MC2C3(rep) + MC4C3(rep);
    BC4(rep+1) = MC3C4(rep) + MC5C4(rep);
    BC5(rep+1) = MC4C5(rep) + MC6C5(rep);
    BC6(rep+1) = MC5C6(rep) + MC7C6(rep);
    BC7(rep+1) = MC6C7(rep) + MSC;
    BL2(rep+1) = MLL2(rep) + ML3L2(rep);
    BL3(rep+1) = ML2L3(rep) + ML4L3(rep);
    BL4(rep+1) = ML3L4(rep) + ML5L4(rep);
    BL5(rep+1) = ML4L5(rep) + MSL;

    MLB(rep+1) = F(BL(rep+1) - (ad * MBL(rep)),ws1,ws0);
    MBL(rep+1) = F(BB(rep+1) - (ac * MLB(rep)),wp1,wp0);
    MCB(rep+1) = F(BC(rep+1) - (ad * MBC(rep)),ws1,ws0);
    MBC(rep+1) = F(BB(rep+1) - (ac * MCB(rep)),wp1,wp0);
    ML2L(rep+1) = F(BL2(rep+1) - (ad * MLL2(rep)),ws1,ws0);
    MLL2(rep+1) = F(BL(rep+1) - (ac * ML2L(rep)),wp1,wp0);
    ML3L2(rep+1) = F(BL3(rep+1) - (ad * ML2L3(rep)),ws1,ws0);
    ML2L3(rep+1) = F(BL2(rep+1) - (ac * ML3L2(rep)),wp1,wp0);
    ML4L3(rep+1) = F(BL4(rep+1) - (ad * ML3L4(rep)),ws1,ws0);
    ML3L4(rep+1) = F(BL3(rep+1) - (ac * ML4L3(rep)),wp1,wp0);
    ML5L4(rep+1) = F(BL5(rep+1) - (ad * ML4L5(rep)),ws1,ws0);
    ML4L5(rep+1) = F(BL4(rep+1) - (ac * ML5L4(rep)),wp1,wp0);
    MC2C(rep+1) = F(BC2(rep+1) - (ad * MCC2(rep)),ws1,ws0);
    MCC2(rep+1) = F(BC(rep+1) - (ac * MC2C(rep)),wp1,wp0);
    MC3C2(rep+1) = F(BC3(rep+1) - (ad * MC2C3(rep)),ws1,ws0);
    MC2C3(rep+1) = F(BC2(rep+1) - (ac * MC3C2(rep)),wp1,wp0);
    MC4C3(rep+1) = F(BC4(rep+1) - (ad * MC3C4(rep)),ws1,ws0);
    MC3C4(rep+1) = F(BC3(rep+1) - (ac * MC4C3(rep)),wp1,wp0);
    MC5C4(rep+1) = F(BC5(rep+1) - (ad * MC4C5(rep)),ws1,ws0);
    MC4C5(rep+1) = F(BC4(rep+1) - (ac * MC5C4(rep)),wp1,wp0);
    MC6C5(rep+1) = F(BC6(rep+1) - (ad * MC5C6(rep)),ws1,ws0);
    MC5C6(rep+1) = F(BC5(rep+1) - (ac * MC6C5(rep)),wp1,wp0);
    MC7C6(rep+1) = F(BC7(rep+1) - (ad * MC6C7(rep)),ws1,ws0);
    MC6C7(rep+1) = F(BC6(rep+1) - (ac * MC7C6(rep)),wp1,wp0);
end

bBc = exp(BB)./(1+exp(BB));
bCc = exp(BC)./(1+exp(BC));
bLc= exp(BL)./(1+exp(BL));
bC2c = exp(BC2)./(1+exp(BC2));
bL2c = exp(BL2)./(1+exp(BL2));
bC3c = exp(BC3)./(1+exp(BC3));
bL3c = exp(BL3)./(1+exp(BL3));
bC4c = exp(BC4)./(1+exp(BC4));
bL4c = exp(BL4)./(1+exp(BL4));
bC5c = exp(BC5)./(1+exp(BC5));
bL5c = exp(BL5)./(1+exp(BL5));
bC6c = exp(BC6)./(1+exp(BC6));
bC7c = exp(BC7)./(1+exp(BC7));


%% FIGURES
figure(1) % Descending loops
subplot(1,2,1)
bar([1,2],[bCi(end),bCd(end)],'LineWidth',3)
hold on
plot([0,3],[0.5,0.5],'k--','LineWidth',2)
hold off
ylim([0 1])
xlim([0,3])
subplot(1,2,2)
bar([1,2],[bL3i(end),bL3d(end)],'LineWidth',3)
hold on
plot([0,3],[0.5,0.5],'k--','LineWidth',2)
hold off
ylim([0 1])
xlim([0,3])

figure(2) % Climbing loops
subplot(1,2,1)
bar([1,2],[bCi(end),bCc(end)],'LineWidth',3)
hold on
plot([0,3],[0.5,0.5],'k--','LineWidth',2)
hold off
ylim([0 1])
xlim([0,3])
subplot(1,2,2)
bar([1,2],[bL3i(end),bL3c(end)],'LineWidth',3)
hold on
plot([0,3],[0.5,0.5],'k--','LineWidth',2)
hold off
ylim([0 1])
xlim([0,3])