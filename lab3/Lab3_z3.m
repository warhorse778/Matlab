% ��������� ������ ����� �� ����� 
load fisheriris

% ���������� X �� ������ ��� �� �������� ���������   
X = [meas(:,1) meas(:,2) meas(:,3) meas(:,4)];
% X = [meas(1:100,1) meas(1:100,2) meas(1:100,3) meas(1:100,4)];

Xst = [meas(1:50,1) meas(1:50,2) meas(1:50,3) meas(1:50,4)]; 
Xvc = [meas(51:100,1) meas(51:100,2) meas(51:100,3) meas(51:100,4)]; 
Xvg = [meas(101:150,1) meas(101:150,2) meas(101:150,3) meas(101:150,4)]; 

% �������� ���� �� ��������� �Setosa� �� �� �������� �������� 
% �� ���� {versicolor, virginica, setosa}
Y = nominal(ismember(species,'virginica'));
% Y = nominal(true(50,1));
Ytst = nominal(true(50,1));

% �� ������� ����� ��������� ������������ ����� ����� �� 
% �������� ����� � ������ ����� � ����������� ? ��� ? 
% ����������� ������ �stratified holdout�
%P = cvpartition(Y,'Holdout',0.25);

% ��������� ������������ �linear support vector machine� ����������� % ����������� ����� � ����������� ������� �� ������� ������������� 
svmStruct=svmtrain(X,Y,'showplot',true);

% ���������� ������������� �� �� ��������� �������� ����� �� �����
C = svmclassify(svmStruct,Xvg,'showplot',true);

% ����������� �������� �� ������������ ���� ���� �� �������� ������� 
% ��� ����� ���� ������� ������� (miss-classification rate)
errRate = sum(Ytst ~= C)/50;  
errRate

% ����������� ��������� �� ��������� �� ������������� 
% (confusion matrix)
conMat = confusionmat(Ytst,C); 
conMat
  
