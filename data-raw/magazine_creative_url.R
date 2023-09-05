library(tidyverse)
magazine_xlsx_dir <- "~/Dropbox/vivvix/xlsx_files/magazine/"

magazine_xlsx_list <- list.files(magazine_xlsx_dir) %>%
  str_subset(".xlsx") %>%
  paste0(magazine_xlsx_dir, .) %>%
  sort()

magazine_creative_url <- magazine_xlsx_list %>%
  map(xlsx_get_url) %>%
  list_rbind() %>%
  distinct()

usethis::use_data(magazine_creative_url, overwrite = TRUE)
