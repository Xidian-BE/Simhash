function [EER,gen,imp,time_match] = matching_minmax(scorepath)
gen = [];
time_match =[];
for i = 0:153
    combination = nchoosek(0:11, 2);
    [a1,a2] = size(combination);
    for j = 1:a1
        file1 = combination(j,:);
        maxoutfile1 = strcat(pwd, '\BINCODE\', num2str(i), '_',num2str(file1(1)),'.mat');
        if exist(maxoutfile1,'file')==0
           continue;
        else
           load(maxoutfile1);
           template1 = code; 
        end
        maxoutfile2 = strcat(pwd, '\BINCODE\', num2str(i), '_',num2str(file1(2)),'.mat');
        if exist(maxoutfile2,'file')==0
           continue;
        else
           load(maxoutfile2);
           template2 = code; 
        end
        tic
        C2=abs(template1 - template2);
        CC=find(C2==0);
        totalnumbs=size(CC(),2);
        similiraty= totalnumbs/(length(template1)+length(template2)-totalnumbs);%Jaccard similarity
        toc
        time_match=[time_match,toc];
        gen = [gen; similiraty];
    end
end
 filegen = strcat(pwd, '\Gscore\','Gs-feret','.mat');
        save(filegen,'gen');
     
imp = [];
combination = nchoosek(0:153, 2);
[b1,b2] = size(combination);
for i = 1:b1
    files = combination(i,:);
    maxoutfile1 = strcat(pwd, '\BINCODE\', num2str(files(1)), '_1.mat');
    if exist(maxoutfile1,'file')==0
       continue;
    else
       load(maxoutfile1);
       template1 = code; 
    end
    maxoutfile2 = strcat(pwd, '\BINCODE\', num2str(files(2)), '_1.mat');
    if exist(maxoutfile2,'file')==0
       continue;
    else
       load(maxoutfile2);
       template2 = code; 
    end
    
    C2=abs(template1 - template2);
    CC=find(C2==0);
    totalnumbs=size(CC(),2);
    similiraty = totalnumbs/(length(template1)+length(template2)-totalnumbs);
    imp = [imp; similiraty];
end
fileimp = strcat(pwd, '\Iscore\','Is-feret','.mat');
        save(fileimp,'imp');
Impostor_score = imp;
Genuine_score = gen;
Genuine_score = sort(Genuine_score, 'descend');
Impostor_score = sort(Impostor_score, 'descend');
save(scorepath, 'Genuine_score', 'Impostor_score');
[EER, mTSR, mFAR, mFRR, mGAR] = computeperformance(gen, imp, 0.001);



 




 
 
 
 
