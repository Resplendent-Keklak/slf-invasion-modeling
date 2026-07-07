# Data Processing Workflow
## Erica Keklak | 2025-08-20 to present
I thought it would be helpful for other users to understand how I gradually introduced new features into the training datasets since I used so many sources towards training my models. I failed to document my earlier workflows because I was trying to get everything done as fast as possible in time for the URI symposium on July 23, but now that I have the freedom to make decisions with less of a time crunch (still a time crunch; as you all know I return to NJIT this year as a third year) I can show interested people what my work looks like in more detail.
## Main Steps
As with every machine learning project, a developer has to:
1. Decide the purpose of their model(s)
2. Decide appropriate data sources for the model given what predictors are used in literature/observation to have a correlative or causative effect on the resulting target value(s), data availability, and copyright (especially in the case of viral licenses)
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
1. Download the data or use an API to then download handle data that is required.
2. Process each category of data in a separate Jupyter Notebook, adding training data columns as I progress. For these models, I go in the following order:
    1. geometry data in `Process Geometry Data.ipynb` because it contained the framework for the DataFrame I wanted to construct and export as training data
    2. observation data (sightings) of spotted lanternflies within `Processing SLF Observation Data.ipynb`
    3. (attempted) host plant data in `Processing Host Plant Data.ipynb`
    4. (attempted) climatological data in `Processing Local Climatological Data.ipynb`
    5. (attempted) predator observation data in  `Processing Predator Data.ipynb`
    6. (attempted) traffic data in `Processing Traffic Data.ipynb`
3. Once I had a sufficient amount of columns to satisfy a basic model, I added the target classes for each type of model I wanted to construct in `Adding Target Classes.ipynb`.
4. To train/fit the models, I made some iterations of the multi-layer perceptrons and random forest decision trees within several files: . They are currently a soup, so I will have to separate them out into multiple files that each train separate categories of model in equal amounts. I then use exported the fitted models so I can use them in other notebooks.
5. When I was ready to make predictions with the fitted models, I did so in `Model Predictions for 2025 and 2026.ipynb`.
6. To develop my data visualizations and maps, I did so in `Data Visualizations and Mapping.ipynb`.

I stopped using the `Data Processing and Exporting Modified Data.ipynb` months before July 2025 because it was getting quite lengthy, and I had to split up the data manipulation into multiple files.
## My Future Workflow
Now that I know a little more about model development from participating in this project, here's what I want my model development workflows to look like in the future. Maximizing time efficiency is very important, and skipping steps slows down my progress towards delivering high-quality predictions:
1. Keep outdated raw data with new data, keeping copies of the old ones developed for the July 2025 symposium so they remain reproducible. I will use different paths when importing raw data files into notebooks to represent those that I changed because they were outdated.
2. Process data in the same categories.
3. Still use `Adding Target Classes.ipynb` to assign target classes.
4. _Where I train and fit the models is still being worked out._
5. Make predictions using the models in `Model Predictions for 2025 and 2026.ipynb` as normal.
6. Make data visualizations using the models in `Data Visualizations and Mapping.ipynb` as normal.

_to be completed_
