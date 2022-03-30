load zad1
Tc=vec2ind(T);
X=[X' sqrt(X(1,:).^2 + X(2,:).^2)']';
plotpv(X,T)

Xtest=[3.5, 4.2, 0.5; 5, 3.5, 0.1; 0, 0 ,0;]';
%Xtest = [2.4, 2.1, 2.4; 2.7, 2.4, 2.5];



net = newp(X,T);
net.trainParam.epochs = 200;
net = train(net,X,T);

a = sim(net,Xtest)

plotpv(Xtest,a);
point = findobj(gca,'type','line');
set(point,'Color','red');

hold on;
plotpv(X,T);
plotpc(net.IW{1},net.b{1});
hold off;

      

     