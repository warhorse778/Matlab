load diabetes

X = P_train;
T = ind2vec(T_train);
Xtest = P_test;

net = newp(X,T);
net.trainParam.epochs = 300;
net = train(net,X,T);
a = sim(net,Xtest);

[vv,winClass]=max(a);

Accuracy=100*length(find(winClass==T_test))/length(winClass);
Accuracy
      

     