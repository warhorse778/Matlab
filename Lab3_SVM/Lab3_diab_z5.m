% зареждаме набора данни на Фишер 
load diabetes

Mx=max(P_train,[],2);
X = (P_train./(Mx*ones(1,size(P_train,2))))';
P_test_norm = (P_test./(Mx*ones(1,size(P_test,2))))';
Y = nominal(T_train);
%svmStruct=svmtrain(X,Y,'showplot',true,'kernel_function','rbf','rbf_sigma',4.5,'method','SMO');
svmStruct=svmtrain(X,Y,'showplot',true,'kernel_function','rbf','rbf_sigma',4.5);
% svmStruct=svmtrain(X,Y,'showplot',true,'kernel_function','mlp','mlp_params',[0.015 -0.015],'autoscale','false');
% svmStruct=svmtrain(X,Y,'showplot',true,'kernel_function','rbf','rbf_sigma',3.6,'autoscale','false');
C = svmclassify(svmStruct,P_test_norm,'showplot',true);

errRate = 100* sum(nominal(T_test)'~= C)/length(T_test)  

Accuracy = 100*sum(nominal(T_test)'== C)/length(T_test)

conMat = confusionmat(nominal(T_test)',C)

  
