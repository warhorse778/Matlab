% зареждаме набора данни
load diabetes
 
X = P_train';
Y = nominal(T_train);
%svmStruct=svmtrain(X,Y,'showplot',true,'kernel_function','rbf','rbf_sigma','method','SMO','boxconstraint');
svmStruct=svmtrain(X,Y,'showplot',true,'kernel_function','rbf','rbf_sigma',4.5);
%svmStruct=svmtrain(X,Y,'showplot',true,'kernel_function','mlp','mlp_params',[0.015 -0.015]);
C = svmclassify(svmStruct,P_test','showplot',true);

errRate = 100* sum(nominal(T_test)'~= C)/length(T_test)  

Accuracy = 100*sum(nominal(T_test)'== C)/length(T_test)

conMat = confusionmat(nominal(T_test)',C)

  
