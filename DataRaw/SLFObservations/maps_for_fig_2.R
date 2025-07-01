library(tidyverse)
library(patchwork)

theme_set(theme_minimal())

data_to_map <- read_csv("data_to_map.csv")

data_temporal <- read_csv("data_2_temporal.csv")


glimpse(data_to_map)

glimpse(data_temporal)

data_to_map_166 <- data_to_map %>%
  filter(fips %in% data_temporal$fips)

glimpse(data_to_map_166)


state_vals <- c("connecticut","district of columbia",
                "delaware","maryland","new jersey",
                "new york","ohio","pennsylvania",
                "virginia","west virginia")

states <- map_data("state") %>%
  filter(region %in% state_vals)

glimpse(states)

data_for_infested <- data_temporal %>%
  select(year,infested,fips)

data_for_infested <- data_for_infested %>%
  pivot_wider(values_from=infested,names_from = year) %>%
  arrange(fips)


glimpse(data_for_infested)


glimpse(data_to_map_166)


data_to_map_166_inf <- data_for_infested %>% 
  left_join(data_to_map_166, by = "fips")

glimpse(data_to_map_166_inf)

data_to_map_166_inf <- data_to_map_166_inf %>%
  janitor::clean_names()

obtain_plot_pairs <- function(y_val,y_val_chr,yr_val,yr_val_chr,data_to_map_val = data_to_map_166_inf){
  
  y_val <- enquo(y_val)
  t_val <- paste0("20",str_sub(y_val_chr,2,-1), " Predictions")
  
  yr_val <- enquo(yr_val)
  
  p_pred <-  ggplot() +
    geom_polygon(data=states,
                 aes(long,lat,group=group),
                 fill="white",color="black") + 
    geom_polygon(data=data_to_map_val,
                 mapping = aes(long, lat, group = group, fill = !!y_val),
                 color="black",linewidth=0.2) +
    scale_fill_continuous(name="Proportion", 
                          low = "white", 
                          high = "darkgreen",
                          limits = c(0,1)) + 
    labs(title = t_val, x = "", y= "") + 
    theme(panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(),
          legend.position = "none",
          axis.ticks.x = element_blank(),
          axis.text.x = element_blank(),
          axis.ticks.y = element_blank(),
          axis.text.y = element_blank(),
          plot.title = element_text(hjust = 0.5))
  
  p_infested <- ggplot() + 
    geom_polygon(data=states,
                 aes(long,lat,group=group),
                 fill="white",color="black") + 
    geom_polygon(data=data_to_map_val,
                 aes(long, lat, group = group, fill = as.character(!!yr_val)),
                 color="black",linewidth=0.2) +
    scale_fill_discrete(name="Infested",type=c("white","darkgreen")) + 
    labs(title = paste0(yr_val_chr," Infested"), x = "", y= "") + 
    theme(panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(),
          legend.position = "none",
          axis.ticks.x = element_blank(),
          axis.text.x = element_blank(),
          axis.ticks.y = element_blank(),
          axis.text.y = element_blank(),
          plot.title = element_text(hjust = 0.5))
  
  p <- (p_infested / p_pred)
  
  #ggsave(paste0("./Maps/map_",t_val,".jpg"),plot=p)
  
  return(p)
  
}

obtain_plot_pairs(i14,"i14",x2014,"2014")
obtain_plot_pairs(i15,"i15",x2015,"2015")
obtain_plot_pairs(i16,"i16",x2016,"2016")
obtain_plot_pairs(i17,"i17",x2017,"2017")
obtain_plot_pairs(i18,"i18",x2018,"2018")
obtain_plot_pairs(i19,"i19",x2019,"2019")
obtain_plot_pairs(i20,"i20",x2020,"2020")
obtain_plot_pairs(i21,"i21",x2021,"2021")
