library(tidyverse)

theme_set(theme_minimal())

data_to_map <- read_csv("data_to_map.csv")

glimpse(data_to_map)

state_vals <- c("connecticut","district of columbia",
                "delaware","indiana","massachusetts","maryland",
                "north carolina","new jersey",
                "new york","ohio","pennsylvania","rhode island",
                "virginia","west virginia")

states <- map_data("state") %>%
  filter(region %in% state_vals)

glimpse(states)

obtain_plot <- function(y_val,y_val_chr,data_to_map_val = data_to_map){
  
  y_val <- enquo(y_val)
  t_val <- paste0("20",str_sub(y_val_chr,2,-1), " Predictions")
  
  p <-  ggplot() +
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
  
  #ggsave(paste0("./Maps/map_",t_val,".jpg"),plot=p)
  
  return(p)
  
}

obtain_plot(i22,"i22")
obtain_plot(i23,"i23")
obtain_plot(i24,"i24")
obtain_plot(i25,"i25")
