# This R script is designed to generate sample data for the LFSC 507 final project.

library(ggplot2)
library(tidyverse)
library(hrbrthemes)
library(viridis)
library(geomtextpath)

pyscript_times <- rnorm(n=29, mean=10, sd=2)
diamond_times <- rnorm(n=29, mean=3, sd = 0.6)

figure1_df <- data.frame(analysis = c(rep("DIAMOND",29), rep("filter_paralogs.py",29)),
                         time_hours = c(rnorm(n=29, mean=3, sd = 1), rnorm(n=29, mean=8, sd = 2)))

figure1_df %>%
  ggplot( aes(x=analysis, y=time_hours, fill=analysis)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE, alpha=0.6, option="J") +
  geom_jitter(color="black", size=2, alpha=0.5) +
  theme_bw() +
  theme(
    legend.position="none"
  ) +
  ggtitle("Wall Time by Analysis") +
  xlab("") + 
  ylab("Wall time (hours)")

figure2_df <- data.frame(assembly_size_mb = rnorm(n=29, mean = 4, sd = 2),
                         pyscript_time_hours = rnorm(n=29), mean = 10, sd = 4)
figure2_df %>%
ggplot( aes(x = assembly_size_mb, y = pyscript_time_hours)) +
  geom_point() +
  geom_labelsmooth(aes(label = 'r = 0.2'), fill = "white",
                   method = "lm", formula = y ~ x,
                   size = 6, linewidth = 2, boxlinewidth = 0.6) +
  ggtitle("filter_paralogs.py Wall Time") +
  xlab("Assembly Size (GB)") + 
  ylab("Wall time (hours)") +
  theme_bw() + guides(color = 'none') # remove legend

figure3_df <- data.frame(method = c("filter_paralogs.py 8 cores","filter_paralogs.py 8 cores","filter_paralogs.py 8 cores","filter_paralogs.py 4 cores","filter_paralogs.py 4 cores","filter_paralogs.py 4 cores","no script 8 cores", "no script 4 cores"),
                         Analysis = c("DIAMOND","filter_paralogs.py","OrthoFinder","DIAMOND","filter_paralogs.py","OrthoFinder","OrthoFinder","OrthoFinder"),
                         time_days = c(0.6,1.2,3,1.2,3,3.6,9.18,20.22))
figure3_df %>% 
ggplot(aes(fill=Analysis, y=time_days, x=method)) + 
  geom_bar(position="stack", stat="identity") +
  scale_fill_viridis(discrete = TRUE, alpha=0.6, option="J") +
  ggtitle("Wall Time by Method") +
  xlab("Method") + 
  ylab("Wall time (days)") +
  theme_bw()
