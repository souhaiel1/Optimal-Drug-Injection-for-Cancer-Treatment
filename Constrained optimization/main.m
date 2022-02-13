clear all
global gamma alpha lambda delta beta T rho mu P0 Q0
gamma = 1.46; alpha = 5.63; lambda = 0.16; delta = 0; beta = 0.48;
T = 30; rho = 0.35; mu = 0.001; P0 = 0.5; Q0 = 0.5; x0 = [0.5 0.5 0];


%%
lesu=[0.5 ;0.8 ;0.3 ;1.9 ;0.54];

u = udet(T, lesu)

%% Question 3 : Testing our my_ode() function 
% 
[tt,xx]=ode45(@my_ode,[0 T],[P0 Q0 0],[],lesu);
figure(1)
plot(tt,xx(:,1:2));
title('Question 3 : myode test (plotting P(t) and Q(t))') 


%% unconstrined solution
[tt,xx]=ode45(@my_ode,[0 T],[P0 Q0 u],[],lesu)
figure(2)
plot(tt,xx(:,1:2))
plot(xx(:,1));
hold on
plot(xx(:,2));
xlabel('Time (s)')
ylabel('Cell numbers')
title('Number of cells evolution (unconstrained)')
hold on,
plot(xx(:,1)+xx(:,2));
legend('P(t)','Q(t)','P(t)+Q(t)')
hold off
%%
% lesu0=[rand();rand();rand();rand();rand()];


%%%%%%%%%%%%%%%%%%  Constrained optimization %%%%%%%%%%%%%%%%%%  


% initializatin for N =2
lesu0=[0;0];
lb = zeros(1,length(lesu0)).'; 
ub = ones(1,length(lesu0)).';
options=optimset('display','iter','MaxFunEvals',2000);
uopt=fmincon(@cost,lesu0,[],[],[],[],lb,ub,@constraints,options);

[tt,xx]=ode45(@my_ode,[0 T],[P0 Q0 0],[],uopt);
figure(3)
sgtitle('experiments with 0 initial guess')
subplot(2,3,1)
plot(tt,xx(:,1:2))
plot(tt,xx(:,1));
hold on
plot(tt,xx(:,2));
xlabel('Time')
ylabel('Cell numbers')
title('N=2: Evolution of the number of cells')
hold on,
plot(tt,xx(:,1)+xx(:,2));
legend('P(t)','Q(t)','P(t)+Q(t)')
hold off
subplot(2,3,4)
plot(uopt);
xlabel('')
ylabel('control u')
title('N=2: optimal control sequence')

% initializatin for N =5
lesu0=[0;0;0;0;0];
lb = zeros(1,length(lesu0)).'; 
ub = ones(1,length(lesu0)).';
options=optimset('display','iter','MaxFunEvals',2000);
uopt=fmincon(@cost,lesu0,[],[],[],[],lb,ub,@constraints,options);

[tt,xx]=ode45(@my_ode,[0 T],[P0 Q0 0],[],uopt);
subplot(2,3,2)
plot(tt,xx(:,1:2))
plot(tt,xx(:,1));
hold on
plot(tt,xx(:,2));
xlabel('Time')
ylabel('Cell numbers')
title(' N=5: Evolution of the number of cells')
hold on,
plot(tt,xx(:,1)+xx(:,2));
legend('P(t)','Q(t)','P(t)+Q(t)')
hold off
subplot(2,3,5)
plot(uopt);
xlabel('')
ylabel('control u')
title('N=5: optimal control sequence')

% initializatin for N =10
lesu0=[0;0;0;0;0;0;0;0;0;0];
lb = zeros(1,length(lesu0)).'; 
ub = ones(1,length(lesu0)).';
options=optimset('display','iter','MaxFunEvals',2000);
uopt=fmincon(@cost,lesu0,[],[],[],[],lb,ub,@constraints,options);

[tt,xx]=ode45(@my_ode,[0 T],[P0 Q0 0],[],uopt);
subplot(2,3,3)
plot(tt,xx(:,1:2))
plot(tt,xx(:,1));
hold on
plot(tt,xx(:,2));
xlabel('Time')
ylabel('Cell numbers')
title(' N=10: Evolution of the number of cells')
hold on,
plot(tt,xx(:,1)+xx(:,2));
legend('P(t)','Q(t)','P(t)+Q(t)')
hold off
subplot(2,3,6)
plot(uopt);
xlabel('')
ylabel('control u')
title('N=10: optimal control sequence')

% random initialization of lesu0 for N=10
%lesu0=[rand();rand();rand();rand();rand();rand();rand();rand();rand();rand()];


%%%%%%%%%%%%%%%%%%  Constrained optimization %%%%%%%%%%%%%%%%%%  
% random initializatin for N =2
lesu0=[rand();rand()];
lb = zeros(1,length(lesu0)).'; 
ub = ones(1,length(lesu0)).';
options=optimset('display','iter','MaxFunEvals',2000);
uopt=fmincon(@cost,lesu0,[],[],[],[],lb,ub,@constraints,options);

[tt,xx]=ode45(@my_ode,[0 T],[P0 Q0 0],[],uopt);
figure(4)
sgtitle ('experiments with random initial guess')
subplot(2,3,1)
plot(tt,xx(:,1:2))
plot(tt,xx(:,1));
hold on
plot(tt,xx(:,2));
xlabel('Time')
ylabel('Cell numbers')
title('N=2: Evolution of the number of cells')
hold on,
plot(tt,xx(:,1)+xx(:,2));
legend('P(t)','Q(t)','P(t)+Q(t)')
hold off
subplot(2,3,4)
plot(uopt);
xlabel('')
ylabel('control u')
title('N=2: optimal control sequence')

% random initializatin for N =5
lesu0=[rand();rand();rand();rand();rand()];
lb = zeros(1,length(lesu0)).'; 
ub = ones(1,length(lesu0)).';
options=optimset('display','iter','MaxFunEvals',2000);
uopt=fmincon(@cost,lesu0,[],[],[],[],lb,ub,@constraints,options);

[tt,xx]=ode45(@my_ode,[0 T],[P0 Q0 0],[],uopt);
subplot(2,3,2)
plot(tt,xx(:,1:2))
plot(tt,xx(:,1));
hold on
plot(tt,xx(:,2));
xlabel('Time')
ylabel('Cell numbers')
title(' N=5: Evolution of the number of cells')
hold on,
plot(tt,xx(:,1)+xx(:,2));
legend('P(t)','Q(t)','P(t)+Q(t)')
hold off
subplot(2,3,5)
plot(uopt);
xlabel('')
ylabel('control u')
title('N=5: optimal control sequence')

% random initializatin for N =10
lesu0=[0;0;0;0;0;0;0;0;0;0];
lb = zeros(1,length(lesu0)).'; 
ub = ones(1,length(lesu0)).';
options=optimset('display','iter','MaxFunEvals',2000);
uopt=fmincon(@cost,lesu0,[],[],[],[],lb,ub,@constraints,options);

[tt,xx]=ode45(@my_ode,[0 T],[P0 Q0 0],[],uopt);
subplot(2,3,3)
plot(tt,xx(:,1:2))
plot(tt,xx(:,1));
hold on
plot(tt,xx(:,2));
xlabel('Time')
ylabel('Cell numbers')
title(' N=10: Evolution of the number of cells')
hold on,
plot(tt,xx(:,1)+xx(:,2));
legend('P(t)','Q(t)','P(t)+Q(t)')
hold off
subplot(2,3,6)
plot(uopt);
xlabel('')
ylabel('control u')
title('N=10: optimal control sequence')


%%%%%%%%%%%%%%%%%%  N=10 and mu = 0.01  %%%%%%%%%%%%%%%%%% 
figure(5)
sgtitle ('experiments with different values of mu')
mu = 0.01 ;
lesu0=[0;0;0;0;0;0;0;0;0;0];
lb = zeros(1,length(lesu0)).'; 
ub = ones(1,length(lesu0)).';
options=optimset('display','iter','MaxFunEvals',2000);
uopt=fmincon(@cost,lesu0,[],[],[],[],lb,ub,@constraints,options);

[tt,xx]=ode45(@my_ode,[0 T],[P0 Q0 0],[],uopt);
subplot(2,2,1)
plot(tt,xx(:,1:2))
plot(tt,xx(:,1));
hold on
plot(tt,xx(:,2));
xlabel('Time')
ylabel('Cell numbers')
title(' mu=0.01: Evolution of the number of cells')
hold on,
plot(tt,xx(:,1)+xx(:,2));
legend('P(t)','Q(t)','P(t)+Q(t)')
hold off
subplot(2,2,3)
plot(uopt);
xlabel('')
ylabel('control u')
title('mu=0.01: optimal control sequence')

%%%%%%%%%%%%%%%%%%  N=10 and mu = 0.1  %%%%%%%%%%%%%%%%%% 
mu = 0.1 ;
lesu0=[0;0;0;0;0;0;0;0;0;0];
lb = zeros(1,length(lesu0)).'; 
ub = ones(1,length(lesu0)).';
options=optimset('display','iter','MaxFunEvals',2000);
uopt=fmincon(@cost,lesu0,[],[],[],[],lb,ub,@constraints,options);

[tt,xx]=ode45(@my_ode,[0 T],[P0 Q0 0],[],uopt);
subplot(2,2,2)
plot(tt,xx(:,1:2))
plot(tt,xx(:,1));
hold on
plot(tt,xx(:,2));
xlabel('Time')
ylabel('Cell numbers')
title(' mu=0.1: Evolution of the number of cells')
hold on,
plot(tt,xx(:,1)+xx(:,2));
legend('P(t)','Q(t)','P(t)+Q(t)')
hold off
subplot(2,2,4)
plot(uopt);
xlabel('')
ylabel('control u')
title('mu=0.1: optimal control sequence')


