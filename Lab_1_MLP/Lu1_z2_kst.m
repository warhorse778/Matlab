load zad1

%X=[X' sqrt(X(1,:).^2+X(2,:).^2)']';
%X=Xz;
Tc=vec2ind(T);
%Tc(18)=3;
X=X(:,1:19);
Tc=Tc(1:19);
T = ind2vec(Tc);

plotpv(X,T)
Xtest = [2.4, 2.1; 2.4 2.7; 2.4, 2.5]';
%Xtest=[3.5 4.2; 0.5 4.1; 5 3.5; 2.9 1.6; 1 1.6]';
%Xtest = [2.4; 2.5];
net = newp(X,T);
%plotpv(X,T);
%plotpc(net.IW{1},net.b{1});

%net.adaptParam.passes = 30;
%net = adapt(net,X,T);
%Y = net(Xtest)
net.trainParam.epochs = 200;
net = train(net,X,T);
Y = net(Xtest)
%plotpc(net.IW{1},net.b{1});
a = sim(net,Xtest)

plotpv(Xtest,a);
point = findobj(gca,'type','line');
set(point,'Color','red');

hold on;
plotpv(X,T);
plotpc(net.IW{1},net.b{1});
hold off;

      

     