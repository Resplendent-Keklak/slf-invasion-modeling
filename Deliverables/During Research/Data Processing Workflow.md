# Data Processing Workflow
## Erica Keklak | 2025-08-20 to present
I thought it would be helpful for other users to understand how I gradually introduced new features into the training datasets since I used so many sources towards training my models. I failed to document my earlier workflows because I was trying to get everything done as fast as possible in time for the URI symposium on July 23, but now that I have the freedom to make decisions with less of a time crunch (still a time crunch; as you all know I return to NJIT this year as a third year) I can show interested people what my work looks like in more detail.
## Main Steps
As with every machine learning project, a developer has to:
1. Decide the purpose of their model(s)
2. Decide appropriate data sources for the model given what predictors are used in literature/observation to have a correlative or causative effect on the resulting target value(s), data availability, and copyright
4. Decide the best type of model to use given the data they think they want to collect (as training data) and the math the model performs when fitting and predicting (classification, regression, etc.)
5. Collect data (overlaps in some aspects with the next few steps because model developers like me often have to find more sources if there is insufficient data or replace sources when after looking through the characteristics of the data provided we realize that it doesn't actually provide the data we want)
6. Data cleaning (removing unnecessary or incomprehensible columns, especially if no data dictionary was provided; automatically or manually, _often manually given the quality of data type inference tools on Python as of late_, assigning data types to columns; removing data points with crucial data missing; converting units when they are unreasonable or inappropriate for the models being developed; and other things). Sometimes data cleaning extends to dealing with log data taken at inconsistent times and with many rows having information that needs to be copied across others that have missing data.
7. Data derivation (using multiple columns of cleaned data to derive a different value or unit that was not available in the raw data; e.g. a voltage column from one current and one resistance column)
8. Data splitting and encoding (data should be split into many parts for cross-validation and testing on smaller subsets; _normal_ people say to split data before encoding it and passing the same transform functions to each split of the data, but this isn't a good idea in type-heterogeneous data like mine because my program loves throwing errors at me for array reshaping)
9. Fitting, which is when a model is fit to encoded data
10. Cross-validation to test the accuracy and generalizability of the model(s) that were made. Cross-validation often helps people infer by trial and error which features are actually necessary and which features are detrimental to the performance of the model across predictions.
11. Predicting with a trained model (very annoying; I have yet to see significant results out of predictions from the models made for this project and I'll explain that later)
12. Communicating to other people what the predictions mean; this can look very different between projects because it depends on the project's current goals or long-term mission
## My Current Workflow
Given what I described in the steps above, here is what my current workflow looks like in developing models:
_to be completed_
## My Old Workflow
Here's what I remember doing in this project and in other model development projects before I got wise:
_to be completed_
## My Future Workflow
Now that I know a little more about model development from participating in this project, here's what I want my model development workflows to look like in the future. Maximizing time efficiency is very important, and skipping steps slows down my progress towards delivering high-quality predictions:
_to be completed_
