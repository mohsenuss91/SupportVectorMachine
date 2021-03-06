function [ W ] = gradientDescent(  max_iteration, trainAttribute, trainLabel )


%% training phase
m=size(trainAttribute,1);
alpha=rand(size(trainAttribute));
beta=rand(size(trainAttribute));
iteration=1;
while (iteration<1000)
     disp(iteration)
    for i=1:m
        temp=0;
        for j=1:m
            temp=temp+alpha(j,:).*trainLabel(j)*kernelFunction(i,j,trainAttribute); 
        end
        eta=1/kernelFunction(i,i,trainAttribute);
        beta(i,:)=alpha(i,:)+eta* (1-trainLabel(i)*temp);
        
        
        alpha(i,:)=beta(i,:).*heavisideStepFunction(beta(i,:));
        
        if(eta*kernelFunction(i,i,trainAttribute)>0&&eta* kernelFunction(i,i,trainAttribute)<2)
           break; 
        end
        
    end
    iteration=iteration+1;
   
end

secondPart=0;
for i=1:m
    for j=1:m
        secondPart=secondPart+trainLabel(i)*trainLabel(j)*alpha(i,:).*alpha(j,:)*kernelFunction(i,j,trainAttribute);
    end
end
% get the weight matrix W
W=sum(alpha)-0.5* secondPart;


%% testing phases:


%training accuracy:

end