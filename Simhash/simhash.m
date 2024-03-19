clear all;
close all;
Nperm = 1;
Nkernel = 1;
Nprojection = 64;%r--Number of partial Walsh transformations
Ngroup = 8;%q--Number of bins
save_path = 'Result.mat';
Nraw = 128;%k--Dimension of the partial Walsh matrix
filepath = 'G:\GC\walsh-simhash\preout\ArcFace\preout-feret\'; 

for jj=1:Nperm
    G_vecs{jj} = getGvec(Nraw*Nprojection,Nkernel);
end

%multiple partial walsh matrices
W  = generate_walsh(512);
permatrix=zeros(512,Nraw,Nprojection);

weight = rand(1,Ngroup);

for k =1:Nprojection
    perm = randperm (512,Nraw);
    
    for kk =1:Nraw
        permatrix(:,kk,k) = W(:,perm(kk)); 
    end
end

for i = 1:Nprojection
    par_walsh(:,:,i) = permatrix(:,:,i);
end 

time_simhash=0;

for ii=0:153
    data_path = dir(strcat(filepath,num2str(ii),'\*.mat'));
    len = length(data_path)-1;
    for j = 0:len          
        readfile = strcat('G:\GC\walsh-simhash\preout\ArcFace\preout-feret\',num2str(ii),'\',num2str(ii),'_',num2str(j), '.mat');
        if exist(readfile,'file')==0
           continue;
        else
               A = load(readfile); 
               A = A.preOut;
               tic
               template = [];
               for counter = 1:Nprojection
                   B = A * par_walsh(:,:,counter);
                   template = [template,B];
               end
               perm = G_vecs{1,1};
               C = template(:,perm(1,1:Nraw*Nprojection));
               num_bin = length(C)/Ngroup;
               C2 = reshape(C, Ngroup,num_bin); 
               
               vec = [];
               for a = 1:Ngroup
                   vector =  C2(a,:) * weight(a);
                   vec = [vec;vector];
               end
               
               trans_vector = sum(vec,1);
               
               code = (sign(trans_vector)+1)/2;
               
            
               savefile = strcat(pwd, '\BINCODE\', num2str(ii), '_',num2str(j),'.mat');
               save(savefile,'code');
               toc;
               time_simhash =[time_simhash, toc];
    
         end           
        
     end
end
[EER,gen,imp,time_match] = matching_simhash(save_path);
time_simhash=mean(time_simhash);
time_match = mean(time_match);
