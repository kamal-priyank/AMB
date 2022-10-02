# Multiple Linear Regression model to predict wage

#### This project aims to predict wage based on independent variables established from the dataset by applying a multiple linear regression model. We concluded on the model with five predictors as our final model. A significant regression equation was found with F = 3655,p< 2.2e-16, with an R2 of 0.3974
#### Log(Wage) = 1.910 + 0.040*education + 0.007*experience + 0.105*ethnicity + 0.072*smsa – 0.457*parttime

## Data pre-processing

#### The dataset contains 4 categorical variables. The three explanatory variables(ethnicity, smsa and parttime) are predictors with two levels. 
#### We therefore classified these as dummy variables and assigned them the values 0 and 1 as following:

   #### Xi = ( 1, unit i is Asian 0, unit i is not Asian)
   #### Xi = (1, unit is Yes (residence in SMSA 0, unit is No (residence outside SMSA)
   #### Xi = (1, unit is Yes (works parttime 0, unit is No (works full time)
   
#### This was done in RStudio using the “ifelse” function.
#### The categorical value region is a predictor with more than two levels. We therefore decided to convert the values of the variable into numerical depictions to fit our Linear Regression Model. We did this in RStudio using the encoding method. 
#### This resulted in thefollowing assigned values: Northeast : 1, Midwest : 0, South : 2, West : 3

#### Lastly, the values of wage were converted into its log value (using log function) toobtain a more normally distributed data, as shown below.

<p align="center">
<img width="393" alt="Screenshot 2022-10-02 at 14 27 10" src="https://user-images.githubusercontent.com/66077662/193456589-42d89df1-c70e-402b-bcd1-ce1e68be381e.png">
</p>
<h5 align="center">Distribution of Wages</h5>

## Correlation & Multicollinearity
#### Linearity assumption for the model was tested by plotting the independent variables against the response variable. Before choosing our final model, we also checked for multicollinearity to avoid a situation where two or more predictors are highly correlated.

#### This was done using the vif() function, and we got the following result, We can see from the outcome of VIF that we do not have any cases of extreme multicollinearity, rather, it shows a low number for all the predictors. Hence, we do not remove any variables and move on to the next part of determining a linear regression model.
<p align="center">
<img width="586" alt="Screenshot 2022-10-02 at 14 39 38" src="https://user-images.githubusercontent.com/66077662/193457411-9f245039-7d51-424f-8329-394b74869c0b.png">
</p>
<h5 align="center"> multi-collinearity matrix</h5>

## Deciding on important variables & Model fit

#### To obtain our final model, we fitted the model using least squares, by using the lm() function.We started with the null model and kept adding variables until we reached the best fit. With forward and backward steps, we reached a model with all variables to have the best R square value.

#### However, we decided to eliminate the predictor region from our model as the p-value of this variable was > 5%. Moreover, removing the variable did not affect the R square value.

#### We interpret this as region not being significant in explaining the dependent variable, wage. Moreover, the t-value was -1.779 which provides more reason to drop it. The p-value of all the other predictors was <2e-16, hence, we keep these.

#### ANOVA method used to compare a model with no dummy variables to see if we can go with a simpler model.
<p align="center">
<img width="586" alt="Screenshot 2022-10-02 at 14 39 16" src="https://user-images.githubusercontent.com/66077662/193457507-b64460da-c3d9-49ec-9b24-d09067f8397e.png">

</p>
<h5 align="center"> ANOVA Result</h5>

#### We can see a great reduction in the RSS in the final model where we include the dummy variables compared to the model without. Moreover, we wanted to see if the RSS would be affected by removing region.
<p align="center">
<img width="586" alt="Screenshot 2022-10-02 at 14 39 07" src="https://user-images.githubusercontent.com/66077662/193457525-76f57367-5854-4f91-bbac-9deb40b8b70a.png">

</p>
<h5 align="center"> ANOVA with Additional Dependent Variables</h5>

#### Although, there is a very minute reduction in the RSS in the regression model without region, we mainly base our decision to remove this variable based on it not having a significance in explaining an effect on wage.The above section explains the steps taken from preparing the dataset to choosing variables for how we concluded on our regression model for wage.

## Model summary & Interpretation

### Interpreting the model

#### Log(Wage) = 1.910 + 0.040*education + 0.007*experience + 0.105*ethnicity +0.072*smsa – 0.457*parttime

#### We can see that our linear regression equation shows parttime as a significant negativepredictor. Education, ethnicity and smsa are positive significant predictors. Although, experience is also a positive predictor, its significance can be seen to be lower in comparison to the other variables.
<p align="center">
<img width="486" alt="Screenshot 2022-10-02 at 14 38 07" src="https://user-images.githubusercontent.com/66077662/193457550-d6d151e4-b310-4ab1-899a-2896d1bc48c6.png">

</p>
<h5 align="center"> Summary Table for Log(wage)</h5>

## Hypothesis test

#### When performing the multiple linear regression, we were interested in knowing whether at least one of the predictors education, experience, ethnicity, smsa, and parttime were useful in predicting wage. Moreover, it is also interesting to see if all predictors help in explaining Y, or only a subset.

#### To answer this, we can look at the results from our hypothesis test.
#### H0: There is no relationship between wage and the independent variables.
#### HA: There is a relationship between wage and the independent variables.
#### Since the p-value for all the independent variables in our chosen model is < 0.05 for H0, we reject the null hypothesis, meaning that there is a relationship between the dependentand independent variables.
#### The p-value for our F-statistic value is also lower than 5%, indicating a significance for the parameters in our model.

## Confidence & Prediction Interval

 #### x <- data.frame(education=13, experience= 18, ethnicity=1, smsa=1, region=1, parttime=1)
 
#### We constructed a data frame x in RStudio whose variable names are those of our independent variables, and we assigned values of these regressor variables for which we wish to make predictions.

<p align="center">
<img width="586" alt="Screenshot 2022-10-02 at 14 51 12" src="https://user-images.githubusercontent.com/66077662/193457592-9f4004cc-5802-430e-ac5f-c554f97cb48b.png">

</p>
<h5 align="center"> Confidence and Prediction</h5>

#### For education being 13 years, experience as 18 years, and the explanatory variables assigned 1, the model predicts a wage of approximately 2.28 dollars [Keeping in mind that wage is formatted to its log value], with 95% confidence interval (2.27,2.29) and a prediction interval of (1.82, 2.75). We can also see that the prediction interval is considerably wider than the confidence interval, reflecting the increased uncertainty around wage for the given values in the data frame, as it also contains the error term.

## Residual plots

<p align="center">
<img width="486" alt="Screenshot 2022-10-02 at 14 38 23" src="https://user-images.githubusercontent.com/66077662/193457599-2c928ccf-cde0-4ad7-9ca7-81f4b52ebb9f.png">

</p>
<h5 align="center"> Residual Plots</h5>

#### From the residual plot, we can see that the residuals are randomly plotted around zero for the entire range of the fitted values. This indicates that our model’s predictions are correct on average rather than systematically too high or low. Moreover, we do not have any Cooks distances above 0.5.

#### Although no regression model can be perfect, we can say that as our chosen model satisfies the OLS assumptions, we have unbiased coefficient estimates. Moreover, minimum variance implies that our independent predictors describe the relationship thoroughly.

## Recommendations & Limitations

### R-Sqaured Value
#### The R square of our final model is 0.3974, which is a low value. Although this implies that our coefficients explain almost 40% of the variation in wage, it does not tell us anything about whether our chosen model is good or bad. In our case however, statistical significance of the predictors allows us to understand their effect on wage.

### Outliers
#### As we know, linear regressions are sensitive to outliers. In our case, we will find cases in education and experience where values can be higher than the average. These can be seen as extreme values or outliers, which can affect the results of the regression. To avoid this, we can take these values into account and remove them from the dataset and run the regression model after modifying.

### Data
#### Another limitation in the analysis can be that the relationships we have found in the model may not hold true if more data or more independent variables are taken into consideration. Our model is therefore limited to the dataset we have used for this analysis.

## Learning outcomes & Improvements
#### From our analysis, we learnt that all predictors in our chosen model are significant in explaining wage. This corresponds to our notion of what we expected the results to be before we performed the analysis. However, we did not expect that region would be insignificant. To improve the analysis, we believe that we should take more explanatory variables into account.Factors such as sector (private or public), professional or other, are examples of explanatory variables that can give substantial information about the differing trends in wage.Moreover, the predictor ethnicity takes two groups into  account, while there are many more to look at. Also, the R-Squared value usually tends to be higher the more variables there are in the model. By making these changes, we expect to get better results and an improved understanding of the relationship of various predictors to wage. 

### This project was done as a part of masters coursework by Sri Saikamal Priyank Samireddi,Saba Aurang Zaib, Janki Popat, Aleksandr Zogin
