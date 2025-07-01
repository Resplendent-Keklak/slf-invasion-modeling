library(tidyverse)
library(RColorBrewer)
library(ggh4x)
library(maps)

theme_set(theme_minimal())

data_to_map_21 <- read.csv("data_to_map_21.csv")

data_to_map_21 <- data_to_map_21 %>%
  mutate(infested = ifelse(i21 == 1, "Yes","No"))

glimpse(data_to_map_21)

state_vals <- c("connecticut","district of columbia",
                "delaware","maryland","new jersey",
                "new york","ohio","pennsylvania",
                "virginia","west virginia")

state_abbr <- c("CT","DC","DE","MD","NJ","NY",
                "OH","PA","VA","WV")

state_names <- tibble(region=state_vals,abbr=state_abbr)

states <- map_data("state") %>%
  filter(region %in% state_vals)

glimpse(states)

states <- left_join(states,state_names)

states_for_labels <- states %>% filter(abbr != "DC")

hull <- data_to_map_21 %>% 
  slice(chull(long,lat))

p_infested <- ggplot() + 
  geom_polygon(data=states,
               aes(long,lat,group=group),
               fill="white",color="black") + 
  geom_polygon(data=data_to_map_21,
               aes(long, lat, group = group, fill = infested),
               color="black",linewidth=0.2) +
  geom_polygon(data=hull,aes(x=long,y=lat),color="blue",alpha=0.0) +
  scale_fill_discrete(name="Infested",type=c("white","darkgreen")) + 
  stat_midpoint(data=states_for_labels,
                aes(long,lat,label=abbr,group=abbr),
                geom="text",size=6,fontface="bold") + 
  labs(title = "2021 Infested", x = "", y= "") + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        plot.title = element_text(hjust = 0.5))

p_gc <- ggplot() + 
  geom_polygon(data=states,
               aes(long,lat,group=group),
               fill="white",color="black") + 
  geom_polygon(data=data_to_map_21,
               aes(long, lat, group = group, fill = gc),
               color="black",linewidth=0.2) +
  scale_fill_continuous(name="Garden \n Centers", 
                        low = "white", 
                        high = "darkgreen") + 
  stat_midpoint(data=states_for_labels,
                aes(long,lat,label=abbr,group=abbr),
                geom="text",size=6,fontface="bold") +
  labs(title = "2021 Garden Centers", x = "", y= "") + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        plot.title = element_text(hjust = 0.5))

p_pop <- ggplot() + 
  geom_polygon(data=states,
               aes(long,lat,group=group),
               fill="white",color="black") + 
  geom_polygon(data=data_to_map_21,
               aes(long, lat, group = group, fill = pop_log),
               color="black",linewidth=0.2) +
  scale_fill_continuous(name="Pop (log)", 
                        low = "white", 
                        high = "darkgreen") + 
  stat_midpoint(data=states_for_labels,
                aes(long,lat,label=abbr,group=abbr),
                geom="text",size=6,fontface="bold") +
  labs(title = "2021 Population", x = "", y= "") + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        plot.title = element_text(hjust = 0.5))

p_is <- ggplot() + 
  geom_polygon(data=states,
               aes(long,lat,group=group),
               fill="white",color="black") + 
  geom_polygon(data=data_to_map_21,
               aes(long, lat, group = group, fill = nis),
               color="black",linewidth=0.2) +
  scale_fill_continuous(name="Primary \n Interstate \n Highways", 
                        low = "white", 
                        high = "darkgreen") + 
  stat_midpoint(data=states_for_labels,
                aes(long,lat,label=abbr,group=abbr),
                geom="text",size=6,fontface="bold") +
  labs(title = "2021 Primary Interstate Highways", x = "", y= "") + 
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank(),
        plot.title = element_text(hjust = 0.5))


p_infested
p_gc
p_pop
p_is
