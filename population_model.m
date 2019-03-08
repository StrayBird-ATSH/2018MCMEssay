miu2=table2array(miu);
miu00=miu2(1,:);
miu_t=miu2(2:22,:);
k=0.488768-0.05;

x_j_i=zeros(19,22);

x_j_i(1,2:22)=table2array(age_struct)';
mig_age_struct_2=table2array(mig_age_struct);
beta_2=table2array(beta);
beta_2=beta_2(end:-1:1);
g2=table2array(g);
g2=g2(end:-1:1);




for i=1:18
    sum_fer=sum(x_j_i(i,4:10));
    fi_t=(beta_2(i))/35*k*sum_fer*5;
    x_j_i(i,1)=(1-miu00/1000)*fi_t;
    sum_population_t=sum(x_j_i(i,:));
    mig=g2(i)*sum_population_t/1000;
    for j=1:21
        if j>=14
            age_percent=(mig_age_struct_2(14)/(8));
        else 
            age_percent=mig_age_struct_2(j);
        end
           
        x_j_i(i+1,j+1)=(1-miu_t(j)/1000)*x_j_i(i,j)+age_percent*mig;
    end
end
m=sum(x_j_i,2);
y=m(1:15,:)';
x=(2010:5:2080);
save('china_beta_high.mat','y');