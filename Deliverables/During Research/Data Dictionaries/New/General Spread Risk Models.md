# Data Dictionary for General Spread Risk Models

__Erica Keklak__ | 2026-01-07

For the general spread risk assessment using models created in mid-August 2025 and beyond this document represents training data processed in both county and state levels.

## Feature Columns

Before preprocessing (encoding, etc.) these are the contents of the general spread risk training data excluding target values. For space limitations set by the GeoPandas library, column names only get saved if they occupy ten characters each. The software truncates longer ones, so I tried to keep each as brief as possible. GitHub also doesn't allow for very wide tables, so I could not show which data is included in each model in the first one. To find which data is allocated to each type of model, see the subsequent table.

Keep in mind that almost all data columns have values dependent on whether or not the data is aggregated by counties or by states, so the exact values vary between "county models" and "state models" as well. Within these two levels of granularity, the values should be equivalent because no new data was introduced.

| Column Name |               Basic Meaning               |                                                Representation                                                |             Unit             | Data Type |
|-------------|-------------------------------------------|--------------------------------------------------------------------------------------------------------------|------------------------------|-----------|
| county      | County of data point                      | The official name of the county. Only used in the county-specific version of the training data.              | name                         | str       | 
| state       | State of data point                       | The official name of the state.                                                                              | name                         | str       |
| land_area   | Land area of place                        | The land area in square meters of the location of the data point.                                            | square meter                 | int       |
| water_area  | Water area of place                       | The area of the data point occupied by water, in square meters.                                              | square meter                 | int       |
| day_egg     | Daylight in egg szn                       | The average minutes of daylight per day during spotted lanternfly "egg season"                               | hour                         | float     |
| day_nymph   | Daylight in nymph szn                     | The average minutes of daylight per day during spotted lanternfly "nymph season"                             | hour                         | float     |
| day_adult   | Daylight in adult szn                     | The average minutes of daylight per day during spotted lanternfly "adult season"                             | hour                         | float     |
| human_pop   | Estimated census pop                      | Estimated human population in area according to closest official census taken                                | human                        | int       |
| forested    | Percent forest cover                      | Estimated percentage of the area that is forest, which is prime habitat for spotted lanternflies             | percent                      | float     |
| border_cnt  | Bordering areas                           | Number of counties bordering on non-corner counties or states bordering on non-corner states                 | territory                    | int       |
| road_cnt    | Number of highways                        | Number of primary roads (highways, major routes) in area                                                     | road                         | int       |
| rail_cnt    | Number of railways                        | Number of railways/railroads in area                                                                         | railroad                     | int       |
| rest_stops  | Number of rest stops                      | Number of rest stops alongside primary roads in area                                                         | rest stop                    | int       |
| t_stations  | Number of train stations                  | Number of train stations in area                                                                             | train station                | int       |
| slf_pop     | Estimated SLF population                  | The estimated population of spotted lanternflies in the area for the year                                    | lanternfly                   | int       |
| slfdnsty    | Estimated SLF density                     | The estimated populaton density of spotted lanternflies per square kilometer for the year                    | lanternfly/square kilometer* | int       |
| y_slf_pop   | Estimated SLF population last year        | The estimated last year's spotted lanternfly population                                                      | lanternfly                   | int       |
| y_slfdnsty  | Estimated SLF density last year           | The estimated last year's spotted lanternfly population density                                              | lanternfly/square kilometer* | int       |
| host_dvsty  | Number of host groups in area             | Number of taxonomic groups (genera and below) known to be hosts of spotted lanternflies in area              | plant taxa                   | int       |
| food_dvsty  | Number of food host groups in area        | Number of taxonomic groups of host plants that are grown for food production in the area                     | plant taxa                   | int       |
| wood_dvsty  | Number of wood host groups in area        | Number of taxonomic groups of host plants that are grown for timber, paper, and fiber production in the area | plant taxa                   | int       |
| omtl_dvsty  | Number of ornamental host groups in area  | Number of taxonomic groups of host plants that are grown for ornamental production in the area               | plant taxa                   | int       |
| egg_hosts   | Number of SLF egg hosts in area           | Number of taxonomic groups of host plants known in literature or observation to support egg masses           | plant taxa                   | int       |
| nym_hosts   | Number of SLF nymph hosts in area         | Number of taxonomic groups of host plants known in literature or observation to support nymph feeding        | plant taxa                   | int       |
| adu_hosts   | Number of SLF adult hosts in area         | Number of taxonomic groups of host plants known in literature or observation to support adult feeding/mating | plant taxa                   | int       |
| food_egg    | Number of food hosts supporting eggs      | Number of taxonomic groups grown for food that support SLF egg masses                                        | plant taxa                   | int       |
| food_nym    | Number of food hosts supporting nymphs    | Number of taxonomic groups grown for food that support SLF nymph feeding                                     | plant taxa                   | int       |
| food_adu    | Number of food hosts supporting adults    | Number of taxonomic groups grown for food that support SLF adult feeding/mating                              | plant taxa                   | int       |
| wood_egg    | Number of wood hosts supporting eggs      | Number of taxonomic groups grown for timber, paper, or fiber that support SLF egg masses                     | plant taxa                   | int       |
| wood_nym    | Number of wood hosts supporting nymphs    | Number of taxonomic groups grown for timber, paper, or fiber that support SLF nymph feeding                  | plant taxa                   | int       |
| wood_adu    | Number of wood hosts supporting adults    | Number of taxonomic groups grown for timber, paper, or fiber that support SLF adult feeding/mating           | plant taxa                   | int       |
| omtl_egg    | Number of ornamental hosts sup. eggs      | Number of taxonomic groups grown for ornamental usage that support SLF egg masses                            | plant taxa                   | int       |
| omtl_nym    | Number of ornamental hosts sup. nymphs    | Number of taxonomic groups grown for ornamental usage that support SLF nymph feeding                         | plant taxa                   | int       |
| omtl_adu    | Number of ornamentla hosts sup. adults    | Number of taxonomic groups grown for ornamental usage that support SLF adult feeding/mating                  | plant taxa                   | int       |
| eh_abund    | Abundance of egg-supporting hosts         | The estimated total abundance of host plants in the area that are shown to be able to support egg masses     | plant                        | int       |
| nh_abund    | Abundance of nymph-supporting hosts       | The estimated total abundance of host plants in the area that are shown to be able to support nymphs         | plant                        | int       |
| ah_abund    | Abundance of adult-supporting hosts       | The estimated total abundance of host plants in the area that are shown to be able to support adults         | plant                        | int       |
| eh_dnsty    | Density of egg-supporting hosts           | The estimated density of all host plants in the area that are shown to be able to support egg masses         | plant/square kilometer*      | int       |
| nh_dnsty    | Density of nymph-supporting hosts         | The estimated density of all host plants in the area that are shown to be able to support nymphs             | plant/square kilometer*      | int       |
| ah_dnsty    | Density of aduly-supporting hosts         | The estimated density of all host plants in the area that are shown to be able to support adults             | plant/square kilometer*      | int       |
| egg_road_a  | Average primary road traffic in egg szn   | Average daily highway traffic for all 24 hours of the day during the year's SLF egg season                   | vehicle border crossings     | int       |
| nym_road_d  | Average primary road traffic in nymph szn | Average daily daytime highway traffic during the year's SLF nymph season                                     | vehicle border crossings     | int       |
| adu_road_d  | Average primary road traffic in adult szn | Average daily daytime highway traffic during the year's SLF adult season                                     | vehicle border crossings     | int       |
| egg_rail_a  | Average railroad traffic in egg season    | Average daily railroad traffic for all 24 hours of the day during the year's SLF egg season                  | engine border crossings      | int       |
| nym_rail_d  | Average railroad traffic in nymph season  | Average daily daytime railroad traffic during the year's SLF nymph season                                    | engine border crossings      | int       |
| adu_rail_d  | Average railroad traffic in adult season  | Average daily daytime railroad traffic during the year's SLF adult season                                    | engine border crossings      | int       |
| d_temp_egg  | Average daytime temperature in egg season | Average daytime temperature in the year during egg season, counting both the beginning and end of the year   | degree Celsius               | float     |
| n_temp_egg  | Average nighttime temperature in egg szn  | Average nighttime temperature in the year during egg season, same caveat as above                            | degree Celsius               | float     |
| cold_egg    | Coldest recorded temp in egg season       | Coldest reported temperature in the area during egg season for that calendar year                            | degree Celsius               | float     |
| d_temp_nym  | Average daytime temperature in nymph szn  | Average daytime temperature in the year during nymph season                                                  | degree Celsius               | float     |
| n_temp_nym  | Average nighttime temp in nymph season    | Average nighttime temperature in the year during nymph season                                                | degree Celsius               | float     |
| d_temp_adu  | Average daytime temperature in adult szn  | Average daytime temeprature in the year during adult season                                                  | degree Celsius               | float     |
| n_temp_adu  | Average nighttime temp in adult season    | Average nighttime temperature in the year during adult season                                                | degree Celsius               | float     |
| d_hum_egg   | Average % humidity during days in egg szn | Average percent humidity (saturation) in the daytime for the year's egg season, counting both winters        | percent                      | float     |
| n_hum_egg   | Average % humidity at night in egg season | Average percent humidity (saturation) in the nighttime for the year's egg season, counting both winters      | percent                      | float     |
| d_hum_nym   | Average % hum during days in nymph season | Average percent humidity (saturation) in the daytime for the year's nymph season                             | percent                      | float     |
| n_hum_nym   | Average % hum at night in nymph season    | Average percent humidity (saturation) in the nighttime for the year's nymph season                           | percent                      | float     |
| d_hum_adu   | Average % hum during days in adult season | Average percent humidity (saturation) in the daytime for the year's adult season                             | percent                      | float     |
| n_hum_adu   | Average % hum at night in adult season    | Average percent humidity (saturation) in the nighttime for the year's adult season                           | percent                      | float     |
| rain_nymph  | Average daily rain intensity in nymph szn | Average intensity of precipitation during the daytime for the year's nymph season                            | centimeter of precipitation  | float     |
| rain_adult  | Average daily rain intensity in adult szn | Average intensity of precipitation during the daytime for the year's adult season                            | centimeter of precipitation  | float     |
| wind_nymph  | Average daily wind speed in nymph season  | Average wind speed during the daytime for the year's nymph season                                            | meter/second                 | float     |
| wind_adult  | Average daily wind speed in adult season  | Average wind speed during the daytime for the year's adult season                                            | meter/second                 | float     |
| pred_dvsty  | Number of predators groups in area        | Number of taxonomic groups of predators in the area that are able to hunt and kill spotted lanternflies      | animal taxa                  | int       |
| pred_abund  | Estimated abundance of predators in area  | Estimated total population of all taxonomic groups in the area that can hunt and kill spotted lanternflies   | animal                       | int       |
| pred_dnsty  | Estimated density of predators in area    | Estimated total population density of all predators of the spotted lanternfly that are in the area           | animal/square kilometer*     | int       |
| year        | Year of data point                        | The year pertaining to the row or data point                                                                 | year                         | int       |
| geometry    | Shape of territory                        | The shapefile definition of the shape of the area (county or state) of the data point                        | shape geometry               | polygons  |

Note that all population densities are rounded to the nearest individual per square kilometer.

Now to show the allocation of data columns for each model type. To reduce redundancy, general propagation risk models will now be known as GPRM and plant damage risk models as PDRM. Data columns that are a work in process will be assigned "WIP" in the Actual Implementation column.

| Column Name | Which Models Use These Data | Mandatory/Optional in GPRM | Mandatory/Optional in PDRM | Actual Implementation |
|-------------|-----------------------------|----------------------------|----------------------------|-----------------------|
| county      | Models with data aggregated by county only | Mandatory where included | Mandatory where included | Completely processed |
| state       | All models                  | Mandatory                  | Mandatory                  | Completely processed  |
| land_area   | All models                  | Strongly encouraged        | Optional                   | Completely processed  |
| water_area  | All models                  | Strongly encouraged        | Optional                   | Completely processed  |
| day_egg     | All models                  | Strongly encouraged        | Optional                   | WIP                   |
| day_nymph   | All models                  | Strongly encouraged        | Optional                   | WIP                   |
| day_adult   | All models                  | Strongly encouraged        | Optional                   | WIP                   |
| human_pop   | All models                  | Strongly encouraged        | Optional                   | WIP                   |
| forested    | All models                  | Strongly encouraged        | Optional                   | WIP                   |
| border_cnt  | All models                  | Strongly encouraged        | Optional                   | WIP                   |
| road_cnt    | All models                  | Strongly encouraged        | Optional                   | WIP                   |
| rail_cnt    | All models                  | Strongly encouraged        | Optional                   | WIP                   |
| rest_stops  | All models                  | Strongly encouraged        | Optional                   | WIP                   |
| t_stations  | All models                  | Strongly encouraged        | Optional                   | WIP                   |
| slf_pop     | All models                  | Strongly encouraged        | Strongly encouraged        | Completely processed  |
| slfdnsty    | All models                  | Strongly encouraged        | Strongly encouraged        | Completely processed  |
| y_slf_pop   | General propagation risk models where the year-to-year change in density determines class, all plant damage risk models | Strongly encouraged | Strongly encouraged | Completely processed |
| y_slfdnsty  | Same conditions as to y_slf_pop | Strongly encouraged | Strongly encouraged | Completely processed |
| host_dvsty  | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| food_dvsty  | All models                  | Optional                   | Strongly encouraged for food plant models, optional otherwise | WIP |
| wood_dvsty  | All models                  | Optional                   | Strongly encouraged for timber, paper, and fiber plant models, optional otherwise | WIP |
| omtl_dvsty  | All models                  | Optional                   | Strongly encouraged for ornamental plant models, optional otherwise | WIP |
| egg_hosts   | All models                  | Optional                   | Strongly encouraged        | WIP                   |
| nym_hosts   | All models                  | Optional                   | Strongly encouraged        | WIP                   |
| adu_hosts   | All models                  | Optional                   | Strongly encouraged        | WIP                   |
| food_egg    | All models                  | Optional                   | Strongly encouraged for food plant models, optional otherwise | WIP |
| food_nym    | All models                  | Optional                   | Strongly encouraged for food plant models, optional otherwise | WIP |
| food_adu    | All models                  | Optional                   | Strongly encouraged for food plant models, optional otherwise | WIP |
| wood_egg    | All models                  | Optional                   | Strongly encouraged for timber, paper, and fiber plant models, optional otherwise | WIP |
| wood_nym    | All models                  | Optional                   | Strongly encouraged for timber, paper, and fiber plant models, optional otherwise | WIP |
| wood_adu    | All models                  | Optional                   | Strongly encouraged for timber, paper, and fiber plant models, optional otherwise | WIP |
| omtl_egg    | All models                  | Optional                   | Strongly encouraged for ornamental plant models, optional otherwise | WIP |
| omtl_nym    | All models                  | Optional                   | Strongly encouraged for ornamental plant models, optional otherwise | WIP |
| omtl_adu    | All models                  | Optional                   | Strongly encouraged for ornamental plant models, optional otherwise | WIP |
| eh_abund    | All models                  | Optional                   | Strongly encouraged        | WIP                   |   
| nh_abund    | All models                  | Optional                   | Strongly encouraged        | WIP                   |
| ah_abund    | All models                  | Optional                   | Strongly encouraged        | WIP                   |
| eh_dnsty    | All models                  | Optional                   | Strongly encouraged        | WIP                   |
| nh_dnsty    | All models                  | Optional                   | Strongly encouraged        | WIP                   |
| ah_dnsty    | All models                  | Optional                   | Strongly encouraged        | WIP                   |
| egg_road_a  | All models                  | Strongly encouraged        | Optional                   | WIP                   |
| nym_road_d  | All models                  | Strongly encouraged        | Optional                   | WIP                   |
| adu_road_d  | All models                  | Strongly encouraged        | Optional                   | WIP                   |
| egg_rail_a  | All models                  | Strongly encouraged        | Optional                   | WIP                   |
| nym_rail_d  | All models                  | Strongly encouraged        | Optional                   | WIP                   |
| adu_rail_d  | All models                  | Strongly encouraged        | Optional                   | WIP                   |
| d_temp_egg  | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| n_temp_egg  | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| cold_egg    | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| d_temp_nym  | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| n_temp_nym  | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| d_temp_adu  | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| n_temp_adu  | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| d_hum_egg   | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| n_hum_egg   | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| d_hum_nym   | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| n_hum_nym   | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| d_hum_adu   | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| n_hum_adu   | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| rain_nymph  | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| rain_adult  | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| wind_nymph  | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| wind_adult  | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| pred_dvsty  | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| pred_dnsty  | All models                  | Strongly encouraged        | Strongly encouraged        | WIP                   |
| year        | All models                  | Mandatory | Completely processed |
| geometry    | No/dropped before training  | Never used | Completely processed |

## Target Column

The __target__ column (labeled `target`) represents the general spread risk value for its associated row or data point's county or state. See other documents in the `Deliverables > During Research` folder for a list of target value meanings. One of the most specific documents is at ![Spotted Lanternfly Modeling Classes](https://github.com/Resplendent-Keklak/slf-invasion-modeling/blob/e59816d8e070321e3f026b1b70a26c2d4370aa7e/Deliverables/During%20Research/Spotted%20Lanternfly%20Risk%20Modeling%20Classes.txt).
