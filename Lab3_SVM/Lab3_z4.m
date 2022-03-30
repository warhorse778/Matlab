
load diabetes

Mx=max(P_train,[],2);
P_train_norm = P_train ./ (Mx*ones(1,size(P_train,2)));
P_test_norm = P_test ./ (Mx*ones(1,size(P_test,2)));

optSVM = statset('MaxIter',100000,'Display','iter');

Tn=nominal(T_train);
%svmStruct=svmtrain(P_train_norm',Tn,'kernel_function','rbf','rbf_sigma',0.37,'autoscale',false,'method','SMO','tolkkt',0.1);
svmStruct=svmtrain(P_train_norm',Tn,'kernel_function','polynomial','polyorder',2,'autoscale',false,'options',optSVM,'method','SMO','tolkkt',0.1);

C = svmclassify(svmStruct,P_test_norm');

errRate = 100*sum(nominal(T_test)' ~= C)/length(T_test)
Accuracy = 100*sum(nominal(T_test)' == C)/length(T_test)

conMat = confusionmat(nominal(T_test)',C)

  
