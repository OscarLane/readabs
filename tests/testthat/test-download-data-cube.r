check_abs_site <- function() {
  if (is.null(curl::nslookup("abs.gov.au", error = FALSE))) {
    skip("ABS Time Series Directory not available")
  }
}


test_that("File is downloaded",{
  #Download May 2020 EQ09

  testthat::skip_on_cran()
  check_abs_site()

  temp_path <- tempdir()

  download_abs_data_cube(cat_no = "6291.0.55.003",
                         cube = "EQ09", date = "May 2020",
                         path = temp_path)


  expect_equal(file.exists(file.path(temp_path, "eq09.zip")), TRUE)

  file.remove(file.path(temp_path, "eq09.zip"))
})


test_that("File can be unzipped",{

  testthat::skip_on_cran()
  check_abs_site()

  temp_path <- tempdir()

  download_abs_data_cube(cat_no = "6291.0.55.003",
                         cube = "EQ09", date = "May 2020",
                         path = temp_path)

  unzip(zipfile  = file.path(temp_path, "eq09.zip"), files = "EQ09.xlsx", exdir = temp_path)
  expect_equal(file.exists(file.path(temp_path, "eq09.xlsx")), TRUE)

  file.remove(file.path(temp_path, "eq09.zip"))
  file.remove(file.path(temp_path, "eq09.xlsx"))
})


test_that("File contents are as expected",{

  testthat::skip_on_cran()
  check_abs_site()

  temp_path <- tempdir()

  download_abs_data_cube(cat_no = "6291.0.55.003",
                         cube = "EQ09", date = "May 2020",
                         path = temp_path)

  unzip(zipfile  = file.path(temp_path, "eq09.zip"), files = "EQ09.xlsx", exdir = temp_path)

  eq09 <- readxl::read_excel(file.path(temp_path, "EQ09.xlsx"), range = "A3",
                     col_names = FALSE) %>%
    dplyr::pull()
  expect_equal(eq09, "Released at 11.30 am (Canberra time) 25 June 2020")

  file.remove(file.path(temp_path, "eq09.zip"))
  file.remove(file.path(temp_path, "eq09.xlsx"))
})



