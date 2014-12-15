> df<-read.csv("newdf.csv")
> v<-1:1962
> v<-v*10
> df<-df[v,]
> library(caret)
Loading required package: lattice
Loading required package: ggplot2
Warning message:
package ‘caret’ was built under R version 3.1.2 
> library(randomForest)
randomForest 4.6-10
Type rfNews() to see new features/changes/bug fixes.
Warning message:
package ‘randomForest’ was built under R version 3.1.2 
> fit2<-train(classe~.,data=df,method="rf",prox=TRUE)
> fit2
Random Forest 

1962 samples
  52 predictor
   5 classes: 'A', 'B', 'C', 'D', 'E' 

No pre-processing
Resampling: Bootstrapped (25 reps) 

Summary of sample sizes: 1962, 1962, 1962, 1962, 1962, 1962, ... 

Resampling results across tuning parameters:

  mtry  Accuracy   Kappa      Accuracy SD  Kappa SD  
   2    0.8971085  0.8694824  0.01287822   0.01626379
  27    0.9035452  0.8777439  0.01533330   0.01928130
  52    0.8941882  0.8659096  0.01558011   0.01954898

Accuracy was used to select the optimal model using  the largest value.
The final value used for the model was mtry = 27. 
> testing<-read.csv("pml-testing.csv")
> fit2<-predict(fit2,testing)
> fit2
 [1] B A A A A E D B A A B C B A E E A B B B
Levels: A B C D E
> 