% зареждаме набора данни на Фишер 
load fisheriris

% дефинираме X да ползва два от четирите описатела   
X = [meas(:,1) meas(:,2) meas(:,3) meas(:,4)];
% X = [meas(1:100,1) meas(1:100,2) meas(1:100,3) meas(1:100,4)];

Xst = [meas(1:50,1) meas(1:50,2) meas(1:50,3) meas(1:50,4)]; 
Xvc = [meas(51:100,1) meas(51:100,2) meas(51:100,3) meas(51:100,4)]; 
Xvg = [meas(101:150,1) meas(101:150,2) meas(101:150,3) meas(101:150,4)]; 

% Избираме един от класовете „Setosa” за да създадем детектор 
% за него {versicolor, virginica, setosa}
Y = nominal(ismember(species,'virginica'));
% Y = nominal(true(50,1));
Ytst = nominal(true(50,1));

% По случаен начин разделяме оригиналният набор данни на 
% обучаващ набор и тестов набор в съотношение ? към ? 
% използвайки метода „stratified holdout”
%P = cvpartition(Y,'Holdout',0.25);

% Създаваме класификатор “linear support vector machine” използвайки % обучаващите данни и съответните етикети за класова принадлежност 
svmStruct=svmtrain(X,Y,'showplot',true);

% Използваме класификатора за да обработим тестовия набор от данни
C = svmclassify(svmStruct,Xvg,'showplot',true);

% Изчисляваме грешката от класификация като броя на грешните решения 
% към общия брой тестови вектори (miss-classification rate)
errRate = sum(Ytst ~= C)/50;  
errRate

% Изчисляваме матрицата на решенията на класификатора 
% (confusion matrix)
conMat = confusionmat(Ytst,C); 
conMat
  
