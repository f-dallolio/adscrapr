library(tidyverse)
tv_xlsx_dir <- "~/Dropbox/vivvix/xlsx_files/tv/"

tv_xlsx_list <- list.files(tv_xlsx_dir) %>%
  str_subset(".xlsx") %>%
  paste0(tv_xlsx_dir, .) %>%
  sort()

tv_creative_url <- tv_xlsx_list %>%
  map(xlsx_get_url) %>%
  list_rbind() %>%
  distinct()

usethis::use_data(tv_creative_url, overwrite = TRUE)
