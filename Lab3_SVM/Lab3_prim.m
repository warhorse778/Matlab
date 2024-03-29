% ��������� ������ ����� �� ����� 
load fisheriris

% ���������� X �� ������ ��� �� �������� ���������   
X = [meas(:,1), meas(:,4)]; 

% �������� ���� �� ��������� �Setosa� �� �� �������� �������� 
% �� ���� {versicolor, virginica, setosa}
Y = nominal(ismember(species,'virginica')); 

% �� ������� ����� ��������� ������������ ����� ����� �� 
% �������� ����� � ������ ����� � ����������� ? ��� ? 
% ����������� ������ �stratified holdout�
P = cvpartition(Y,'Holdout',0.25);

% ��������� ������������ �linear support vector machine� ����������� 
% ����������� ����� � ����������� ������� �� ������� ������������� 
svmStruct=svmtrain(X(P.training,:),Y(P.training),'showplot',true,'kernel_function','rbf','rbf_sigma',0.5);

% ���������� ������������� �� �� ��������� �������� ����� �� �����
C = svmclassify(svmStruct,X(P.test,:),'showplot',true);

% ����������� �������� �� ������������ ���� ���� �� �������� ������� 
% ��� ����� ���� ������� ������� (miss-classification rate)
errRate = 100* sum(Y(P.test)~= C)/P.TestSize  
Accuracy = 100* sum(Y(P.test)== C)/P.TestSize  

% ����������� ��������� �� ��������� �� ������������� 
% (confusion matrix)
conMat = confusionmat(Y(P.test),C); 
conMat
