% зареждаме набора данни на Фишер 
load fisheriris

% дефинираме X да ползва два от четирите описатела   
X = [meas(:,1) meas(:,2) meas(:,3) meas(:,4)]; 

% Избираме един от класовете „Setosa” за да създадем детектор 
% за него {versicolor, virginica, setosa}
Y = nominal(ismember(species,'setosa')); 

% По случаен начин разделяме оригиналният набор данни на 
% обучаващ набор и тестов набор в съотношение ? към ? 
% използвайки метода „stratified holdout”
P = cvpartition(Y,'Holdout',0.25);

% Създаваме класификатор “linear support vector machine” използвайки % обучаващите данни и съответните етикети за класова принадлежност 
svmStruct=svmtrain(X(P.training,:),Y(P.training),'showplot',true,'kernel_function','rbf','method','SMO');

% Използваме класификатора за да обработим тестовия набор от данни
C = svmclassify(svmStruct,X(P.test,:),'showplot',true);

% Изчисляваме грешката от класификация като броя на грешните решения 
% към общия брой тестови вектори (miss-classification rate)
errRate = 100*sum(Y(P.test)~= C)/P.TestSize
Accuracy = 100*sum(Y(P.test)== C)/P.TestSize

% Изчисляваме матрицата на решенията на класификатора 
% (confusion matrix)
conMat = confusionmat(Y(P.test),C); 
conMat
  
