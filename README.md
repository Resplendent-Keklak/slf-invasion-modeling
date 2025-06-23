# slf-invasion-modeling
This repository holds scripts, maps, machine learning models, and other data visualizations related to a Summer 2025 ![NJIT Provost Undergraduate Research and Innovation (URI) fellowship](https://research.njit.edu/uri/summer-research-programs) with the project formally named "Predictive model of the spread of the spotted lanternfly in the continental United States using machine learning." The fellowship, and therefore updates to the repository, conclude on July 24, 2025, but the repository will be available and public for several years. This project is intended to process historical data on the amount of reported observations of the ![introducted population of the spotted lanternfly (_Lycorma delicatula_)](https://www.aphis.usda.gov/plant-pests-diseases/slf) and use classification-based machine learning techniques to predict the propagation of the invasion in certain areas of the continental United States. While the full write-up of this project and the deliverables for the fellowship should be available on this repository, the project is not subject to formal peer review and its results will likely not be published in a journal.

## Navigating This Repository
The original __slf-invasion-modeling__ repository is structured differently from the standard research directory because it is not self-hosted:
- __DataModified:__ data that was processed in a script, exported as some Python-compatible file format, and then stored here
- __DataRaw:__ files and subfolders of raw data collected from free, public and/or open sources that were modified, send to the DataModified folder, and used in model and data visualization creation
    - __Climate:__ local climatological data provided by the National Oceanic and Atmospheric Administration for certain parts of the United States historically from the beginning of 2014 (2014-01-01) to the end of 2024 (2024-12-31)
    - __Ecological:__ observational and abundance data provided mainly by ![iNaturalist](https://inaturalist.org/) (with data limited to 2014 to 2024, inclusive) but also by the United States Department of Agriculture
    - __Geometry:__ map boundary, area, and locational data provided by a variety of sources
    - __Traffic:__ traffic-related data for primary road/highway usage and railway usage from 2014 to 2024, inclusive, from a variety of sources
- __Deliverables:__ contains copies of deliverables submitted to the URI team as well as major "non-programmed" parts of the research process, including notes
- __Scripts:__ contains ![Jupyter Notebook](https://jupyter.org/) and ![Python](https://www.python.org/) programs that this project used in the development of its results
    - __Old:__ files that were used in the project but are not necessary for final model and visualization development
    - __Final:__ all files necessary for model and visualization development except for data
- __Visualizations:__ contains images showing the results of this research project, mostly as static images in ![.PNG or .JPG format](https://en.wikipedia.org/wiki/Image_file_format)
    - __MapScreenshots:__ static images of maps
    - __MapInteractive:__ interactive versions of maps, if possible
    - __NonMaps:__ any data visualizations that are not displayed geospatially as in points or marks on a map of the lower 48 states
- __.gitignore:__ the default template containing ![a general list of files to ignore](https://docs.github.com/en/get-started/git-basics/ignoring-files) when cloning the repository; this one uses the template GitHub provided for the ![Python](https://www.python.org/downloads/) language
- __LICENSE:__ details of the ![MIT License](https://choosealicense.com/licenses/mit/) used to protect this research while giving the ability to the general public to use this repository in almost any way they'd like
- __README.md:__ this file

## Software Used
The primary investigator ran training, validation, and test data on Jupyter Notebook using Python 3 with some early data processing in R using a fork of ![lydemap](https://github.com/ieco-lab/lydemapr) included as a small section in this repository. 2025-era versions of NumPy, Pandas, and Geopandas were necessary for data processing and computations. Matplotlib, Seaborn, and Shapely were helpful in visualizing data points and trends. Model development outside of data cleaning and pre-processing required Scikitlearn (Sklearn) for decision tree modeling, Keras for neural networks, and TensorFlow for understanding model development fundamentals. While not formally used for this project, the primary investigator ran some data through Maxent.

__TL;DR:__
- _Languages/Main Ware:_ ![Conda](https://anaconda.org/anaconda/conda), ![Jupyter Notebook](https://jupyter.org/), ![Python](https://www.python.org/), ![R](https://www.r-project.org/), ![RStudio](https://posit.co/downloads/), ![Maxent](https://biodiversityinformatics.amnh.org/open_source/maxent/)
- _Packages and Libraries:_ ![NumPy](https://numpy.org/), ![Pandas](https://pandas.pydata.org/pandas-docs/stable/index.html), ![Geopandas](https://geopandas.org/en/stable/), ![Matplotlib](https://matplotlib.org/), ![Seaborn](https://seaborn.pydata.org/), ![Shapely](https://shapely.readthedocs.io/en/stable/manual.html), ![Sklearn](https://scikit-learn.org/stable/index.html), ![Keras](https://keras.io/), ![TensorFlow](https://www.tensorflow.org/)

## Frequently-Asked Questions (FAQs)
### _Is a GitHub repository required for your project?_

Hosting a GitHub repository is not mandatory for participation in this year's Undergraduate Research and Innovation (URI) program, but it is extremely helpful for publishing data and results when programs like these only publish abstracts (to be published in the !["2025 URI Book of Abstracts"](https://research.njit.edu/uri/archive-summer-research-program#tab-2)) and presentations. This project is not likely to make it to an actual journal unless the momentum continues and its participants get the opportunity to continue their research.

### _Will you be sending the models to ![Hugging Face](https://huggingface.co/)?_

The main contributors to this project have yet to review data protection and other policies required of Hugging Face users, but we understand the potential benefits of making our modified datasets and models available to Hugging Face users who tend to be more skilled at machine learning usage and development. There is no guarantee that the contents of this repository will be uploaded to Hugging Face by the main contributors, but if the repository license permits it anyone may do so.

### _Why is there no app release for this project?_

While some other URI participants proposed making an app as part of their project, this project was accepted without a proposal for an app. The value this project brings to the table does not fit the scope of a web or mobile app especially since there are several research (both academic- and government-led) projects by other experts who are trying to increase our knowledge of _L. delicatula_ and how the problems the species poses can be resolved. Since there are already robust invasive species reporting apps, there is no need for this project to make one when the focus of the project is on machine learning model development.

If you would like to help out as a citizen scientist to gather data on the spotted lanternfly and you have timestamped photographs that you or a friend took of any trace of a spotted lanternfly (eggs, nymphs, adults, molts, honeydew, etc.) you may upload them as observations to ![iNaturalist](https://www.inaturalist.org/home) (not sponsored). There are several mobile apps by the iNaturalist curators and developers, and they have a ![centralized repository](https://github.com/inaturalist/inaturalist) as well as other repositories for their ![iOS app](https://github.com/inaturalist/INaturalistIOS) and ![Android app](https://github.com/inaturalist/iNaturalistAndroid).

### _Why use classification modeling?_

Classification modeling is the process of using existing data, that may or may not contain target classes in each data point, to determine what classes apply to similar data if it was processed through the model. Most classification modeling is done on one class per data point, e.g. of a person's marital status "Never Married," "Currently Married," and "Formerly Married." This is opposed to multiple classes like tags (of an image file "Contains locational metadata," "Contains at least one black/#000000 pixel," "Has an author," etc). Classification is important to most people because applying labels to things is helpful, especially when things are not usually easy to determine. All the machine learning models in this project use data manipulated to contain up to five target classes at a time, and each existing data point and prediction has only one class.

"General spread risk modeling" is the main type of model used in this project which means each class relates to the expectation of a change in the number of _L. delicatula_ present in an area from the current year to the next year regardless of the ![expected local abundance](https://en.wikipedia.org/wiki/Abundance_estimation) of specific host plant ![species and genera](https://en.wikipedia.org/wiki/Taxonomic_rank). "Purpose-specific risk modeling" comprises three types of classification models with different goals each aligning with the risk that the expected change in _L. delicatula_ abundance from the current to the next year will have on damage and fungal infection in host plants found in each area; purpose-specific risk modeling uses almost all the same features and data as general spread risk modeling but has additional features relating to the types and abundance of local host plants. To keep the process simple, the original contributors tagged each known/expected host plant as "able to provide food to humans" (the category is broad to encompass fruit, vegetable, spice, syrup, and other food production), "able to provide wood to humans" (this category is also broad so it can encompass all forms of timber and paper production), and "ornamental" (including landscaping and bonsai plants). The risk class for a county or state is based not on the risk of invasion to all possible species of that type but to only the species that are found in that area. Not all host plants from those known in literature and observation fit any of these tags, but some fit more than one tag and are considered for more than one purpose-specific risk model. This keeps the classification method used in this project as fair and as easy as possible for a non-academic person to understand.

### _What can the average American gain from this project?_

Most residents of the United States understand that they depend on plant products to survive, and the accidental introduction of spotted lanternflies to the United States has demonstrated both potential harm and existing harm to the production of plant-based food, wood and paper products, and the perceived beauty and health of ornamental plants. If the invasion continues, it is quite possible that spotted lanternflies become permanently established unless they evolve into a new species or become locally extinct, and being a permanent pest adds additional strain to agriculture industry workers' profits and the availability of plant-based resources produced locally. They will know that a lack of preventative and active measures against the spotted lanternfly have the ability to worsen the problem and possibly contribute to plant-based resource scarcity during times like these when certain resources are already scarce.

If contributors make reports based on the results of models for each county and state and send them to members of the general public, it will increase public awareness of the spotted lanternfly problem in the United States and allow those with special powers (legislators, agricultural managers, plant conservation organizations, pest control services, and more) to make informed business and lawmaking decisions due to how the spotted lanternfly affects many aspects of the economy. People outside of these demographics still benefit from "spotted lanternfly awareness" by giving them the knowledge and permission to remove spotted lanternflies from their property and take action to prevent spotted lanternflies from establishing themselves on their properties.

### _Q: Where are your sources/works cited?_

The proposal and active citation list is available for review in the __Deliverables__ folder and may span several files. Some files have annotations about the reasons why sources were used and whether or not they have been cited at certain stages of the project's development.

## Contributing
If you would like to contribute to the development of this project, you can:
- report __bugs__ and __security issues__ to any of the listed contributors or try to resolve them by (1) forking this repository, (2) clone the fork, (3) make necessary changes that you would like to see in the next release, (4) commit and push, and (5) wait for your request to be merged
- contribute __features__ to the Python and Jupyter Notebook scripts using the same methods as with bug/security reports
- make forks that __expand__ the purposes of this project to fit other locations where _L. delicatula_ may be found next, use the scripts as a template for your own local invasive species (you may need data beyond that which is in this project), etc.

If you are a subject matter expert (SME) in spotted lanternfly biology and behavior and are not yet affiliated with ![Stop SLF](https://www.stopslf.org/) (not sponsored), feel free to add your publication to the ![list of publications on the site](https://www.stopslf.org/research-updates/scientific-publications/). This repository's contributors read and cite these publications often!

## Funding
Funding for this project was provided by the NJIT Provost Undergraduate Research and Innovation (URI) program and the Grace Hopper Research Institute (GHRI). We are very thankful that they were able to provide us with the opportunity to perform compensated research for a good cause.
