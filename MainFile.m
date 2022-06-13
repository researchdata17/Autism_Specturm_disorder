%{
fid = fopen('Autism-Adult-Data.arff') ;
S = textscan(fid,'%s','delimiter','\n') ;
data_process = S{1,1};
data_s = {};
data_s =data_process(26:length(data_process));
fclose(fid) ;
str = [];
Processed_dataSet = [];
for i = 1:length(data_s)
   f = strsplit(data_s{i,1},',');
   for j=1:length(f)
       str = [str,f(j)];
   end
   Processed_dataSet = [Processed_dataSet; str];
   str = [];
end
%}

%data_process = S{1,1};
%data_s = {};
%data_s =data_process(26:length(data_process));

%fclose(fid) ;
labels = [];
labels(1:33) = 1;
labels(34:55)= 2;
k_mer         = 10;
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Davies-Bouldin index %%%%%%%%%%%%%%%%%%%%%%%%%
filename = 'dataset.csv';
M = csvread(filename);
%data_process = S{1,1};
%data_s = {};
%data_s =data_process(26:length(data_process));

%fclose(fid) ;
%1 to 55
db = [];
ci = [];
gap = [];
sih = [];
db_table  = [];
ci_table  = [];
di_table = [];
sih_table = [];
[data,labelchange] = current_dataset(M,labels,1,55)
for i=2:10
 U = kmedoids(data, i);
 dbi = evalclusters(data,U,'DaviesBouldin');
 c = evalclusters(data,U,'CalinskiHarabasz')
 s = evalclusters(data,U,'Silhouette')
 distM=squareform(pdist(data)); 
 di=DI(i,distM,U)
 db_table  = [ db_table dbi.CriterionValues];
 ci_table  = [ci_table  c.CriterionValues];
 sih_table = [sih_table s.CriterionValues]; 
 di_table  = [di_table  di];
end
% for i=1:5
%  di=DI(i,distM,U)
%  di_table  = [di_table  di.CriterionValues];
% end
db_table  = [];
ci_table  = [];
di_table = [];
sih_table = [];
%56 to 78
[data,labelchange] = current_dataset(M,labels,56,78)
for i=2:10
 U = kmedoids(data, i);
 dbi = evalclusters(data,U,'DaviesBouldin');
 c = evalclusters(data,U,'CalinskiHarabasz')
 s = evalclusters(data,U,'Silhouette')
 distM=squareform(pdist(data)); 
 di=DI(i,distM,U)
 db_table  = [ db_table dbi.CriterionValues];
 ci_table  = [ci_table  c.CriterionValues];
 sih_table = [sih_table s.CriterionValues]; 
  di_table  = [di_table  di];
end

db_table  = [];
ci_table  = [];
di_table = [];
sih_table = [];

%79 to 98
[data,labelchange] = current_dataset(M,labels,79,98)

for i=1:10
 U = kmedoids(data, i);
 dbi = evalclusters(data,U,'DaviesBouldin');
 c = evalclusters(data,U,'CalinskiHarabasz')
 s = evalclusters(data,U,'Silhouette')
 distM=squareform(pdist(data)); 
 di=DI(i,distM,U)
 db_table  = [ db_table dbi.CriterionValues];
 ci_table  = [ci_table  c.CriterionValues];
 sih_table = [sih_table s.CriterionValues]; 
  di_table  = [di_table  di];
end

db_table  = [];
ci_table  = [];
di_table = [];
sih_table = [];
%99 to 109
[data,labelchange] = current_dataset(M,labels,99,109)
for i=1:4
 U = kmedoids(data, i);
 dbi = evalclusters(data,U,'DaviesBouldin');
 c = evalclusters(data,U,'CalinskiHarabasz')
 s = evalclusters(data,U,'Silhouette')
 distM=squareform(pdist(data)); 
 di=DI(i,distM,U)
 db_table  = [ db_table dbi.CriterionValues];
 ci_table  = [ci_table  c.CriterionValues];
 sih_table = [sih_table s.CriterionValues]; 
 di_table  = [di_table  di];
end

db_table  = [];
ci_table  = [];
di_table = [];
sih_table = [];
%110 to 115
[data,labelchange] = current_dataset(M,labels,110,115)
for i=1:5
 U = kmedoids(data, i);
 dbi = evalclusters(data,U,'DaviesBouldin');
 c = evalclusters(data,U,'CalinskiHarabasz')
 s = evalclusters(data,U,'Silhouette')
 distM=squareform(pdist(data)); 
 di=DI(i,distM,U)
 db_table  = [ db_table dbi.CriterionValues];
 ci_table  = [ci_table  c.CriterionValues];
 sih_table = [sih_table s.CriterionValues]; 
 di_table  = [di_table  di];
end
di_table;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%% Calinski-Harabasz index %%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%


%{
Filepath          = 'Autism-Adult-Data.arff';
fid               = fopen(Filepath);
C                 = textscan(fid, '%s');
Processed_dataSet = [];
str = '';
%Processed_dataSet = [Processed_dataSet; C];
f = strsplit(C{1}{1},',');
%Processed_dataSet = [Processed_dataSet; length(C{1})];
%Processed_dataSet = [Processed_dataSet; length(f)];
for i = 1:length(C{1})
   f = strsplit(C{1}{i},',');
   for j=1:length(f)
       str = strcat(str,f(j));
       if length(f) ~= j
        str = strcat(str,',');
       end
   end
   Processed_dataSet = [Processed_dataSet; str];
   str = '';
end
disp(Processed_dataSet(26,1));
%}
