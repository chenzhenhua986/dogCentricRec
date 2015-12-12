% This is for computing prediction results

path = 'C:\Users\chen478\Downloads\features\';

label = [ones(14,1) ;2*ones(4,1);3*ones(8,1);4*ones(4,1);5*ones(4,1);6*ones(8,1);7*ones(5,1)
    8*ones(4,1);9*ones(7,1);10*ones(7,1)];

% s=rand(2,65)
f_list=dir(path);
s=[];
pp=[];
for k=1:length(f_list)
   file =f_list(k).name;
   if strcmp(file, '.') || strcmp(file, '..')
       continue;
   end
   s = [s csvread(strcat(path, file))];
end
factor = max([max(s) abs(min(s))]);
normalized_data = s/factor;

sum = 0;
for tt=1:30

a=[7,2,4,2,2,4,2,2,3,3];
b=[7,2,4,2,2,4,3,2,4,4];
c=a+b;
train=[];
test=[];
label_train=[];
label_test=[];

offset = 0;
for i=1:10
    p = randperm(c(i));
    for j=1:c(i)/2
        train=[train s(:,offset + p(j))];
        label_train = [label_train i];
    end
    for k=j+1:c(i)
        test=[test s(:,offset + p(k))];
        label_test = [label_test i];
    end
    offset = offset + c(i);
end


model = ovrtrain(label_train', train', '-c 100 -t 2');
[pred ac decv] = ovrpredict(label_test', test', model);
fprintf('Final Accuracy = %g%%\n', ac * 100);
sum = sum + ac;
end
pp = [pp pred]
sum / 30
