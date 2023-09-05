#' Extract URLs from Excel xlsx hyperlinks
#'
#' @param xlsx_file a string indicating the xlsx file's path.
#' @param sheet an inetger or a string indicating the xlsx sheet.
#'
#' @return a tibble.
#' @export
xlsx_get_url <- function(xlsx_file, sheet = 1){
  tidyxl::xlsx_cells(xlsx_file, sheet) %>%
    dplyr::filter(formula %>%
                    stringr::str_detect("HYPERLINK")) %>%
    dplyr::transmute(creative = formula %>%
                       stringr::str_split_i('"', 4) %>%
                       stringr::str_squish(),
                     url = formula %>%
                       stringr::str_split_i('"', 2) %>%
                       stringr::str_squish()
    )
}
