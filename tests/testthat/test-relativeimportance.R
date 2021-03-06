context("Relative importance analysis")

data(bank, package = "flipExampleData")

X <- structure(list(v1 = c(9, 8,
    7, 8, 9, 9, 5, 7, 5, 7, 8, 6, 5, 6, 9, 8, 5, 7, 7, 4, 6, 9, 9,
    5, 9, 9, 7, 9, 6, 5, 5, 7, 7, 9, 5, 9, 9, 7, 9, 9, 9, 6, 9, 8,
    7, 7, 7, 5, 9, 9, 9, 9, 9, 7, 6, 6, 9, 7, 6, 8, 9, 4, 8, 7, 8,
    8, 6, 9, 9, 6, 7, 9, 4, 7, 9, 8, 9, 5, 8, 8, 9, 4, 4, 6, 6, 9,
    6, 7, 9, 4, 6, 8, 7, 6, 7, 5, 6, 7, 9, 9, 9, 9, 8, 4, 5, 4, 9,
    5, 8, 4, 5, 9, 8, 4, 5, 8, 9, 6, 7, 7, 6, 9, 7, 5, 4, 4, 9, 5,
    9, 8, 5, 9, 9, 9, 8, 9, 7, 7, 7, 9, 5, 5, 8, 5, 7, 8, 7, 9, 7,
    9, 7, 6, 5, 7, 6, 8, 8, 9, 9, 6, 9, 9, 7, 9, 7, 7, 7, 5, 9, 6,
    8, 5, 6, 9, 5, 9, 4, 9, 9, 7, 9, 7, 7, 6, 5, 7, 8, 7, 4, 6, 4,
    4, 9, 6, 7, 6, 6, 5, 7, 6, 9, 9, 4, 7, 4, 7, 9, 7, 4, 9, 6, 6,
    9, 6, 4, 5, 7, 7, 8, 7, 5, 9, 6, 8, 8, 7, 8, 6, 6, 4, 7, 7, 5,
    8, 9, 7, 8, 7, 7, 9, 9, 6, 6, 7, 6, 9, 6, 7, 9, 6, 8, 9, 8, 7,
    6, 9, 6, 6, 9, 9, 9, 9, 7, 7, 9, 7, 9, 6, 8, 9, 9, 9, 7, 6, 6,
    7, 7, 9, 4, 7, 6, 5, 8, 4, 9, 6, 9, 7, 7, 4, 6, 6, 9, 8, 9, 7,
    4, 5, 7, 7, 9, 8, 9, 9, 6, 7, 9, 9, 9, 8, 9, 6, 6, 5, 9, 8, 4,
    6, 4, 9, 8, 7, 7, 9, 7, 6, 4),
    v2 = c(7,
    9, 3, 1, 3, 1, 8, 4, 3, 4, 3, 6, 2, 4, 2, 1, 1, 7, 1, 3, 4, 9,
    2, 2, 6, 4, 4, 2, 1, 7, 2, 4, 9, 3, 9, 4, 3, 1, 5, 2, 4, 6, 4,
    7, 7, 1, 3, 3, 3, 6, 1, 2, 1, 7, 4, 7, 7, 5, 8, 3, 4, 2, 8, 3,
    5, 8, 4, 6, 8, 6, 8, 3, 4, 6, 1, 4, 4, 8, 6, 9, 7, 1, 6, 1, 1,
    4, 5, 9, 5, 4, 7, 4, 6, 4, 4, 2, 3, 6, 1, 1, 9, 6, 4, 6, 3, 3,
    4, 5, 6, 2, 3, 4, 7, 6, 1, 8, 6, 1, 6, 1, 6, 2, 5, 2, 5, 1, 4,
    1, 2, 4, 4, 6, 2, 4, 3, 2, 4, 1, 1, 2, 3, 4, 4, 4, 6, 5, 6, 6,
    6, 3, 2, 3, 5, 4, 1, 5, 4, 5, 1, 1, 1, 2, 1, 4, 3, 6, 1, 4, 1,
    2, 6, 1, 5, 3, 5, 2, 6, 4, 4, 1, 3, 6, 5, 7, 4, 3, 9, 1, 5, 1,
    2, 4, 3, 1, 2, 5, 2, 6, 4, 7, 8, 3, 5, 2, 5, 1, 1, 1, 4, 1, 4,
    6, 3, 3, 2, 6, 6, 4, 1, 4, 1, 3, 7, 2, 1, 4, 3, 9, 3, 3, 5, 5,
    2, 4, 1, 7, 1, 3, 2, 8, 2, 5, 2, 4, 4, 1, 1, 2, 1, 2, 2, 5, 5,
    1, 3, 2, 2, 1, 7, 9, 4, 4, 3, 2, 3, 5, 2, 5, 5, 9, 1, 4, 1, 2,
    6, 6, 1, 4, 1, 4, 9, 2, 1, 1, 3, 6, 2, 1, 2, 7, 3, 4, 2, 6, 4,
    3, 2, 7, 4, 1, 3, 3, 3, 7, 5, 2, 7, 5, 6, 5, 6, 1, 1, 6, 3, 9,
    1, 1, 1, 1, 8, 5, 3, 1, 1, 9, 3),
    v3 = c(7, 9, 9, 8, 1, 1,
    9, 9, 9, 9, 9, 8, 1, 5, 6, 9, 1, 1, 9, 1, 9, 2, 1, 9, 6, 1, 9,
    1, 1, 8, 9, 9, 9, 5, 9, 9, 8, 1, 6, 9, 9, 9, 9, 9, 9, 5, 9, 9,
    9, 7, 1, 9, 7, 1, 9, 1, 9, 6, 9, 8, 9, 9, 6, 7, 6, 8, 9, 9, 9,
    9, 9, 1, 9, 7, 9, 9, 5, 4, 9, 9, 2, 4, 7, 5, 1, 4, 9, 9, 9, 8,
    9, 8, 9, 1, 4, 9, 8, 9, 7, 9, 9, 9, 9, 7, 7, 5, 1, 2, 1, 9, 9,
    9, 9, 9, 9, 9, 9, 7, 9, 9, 9, 1, 9, 1, 9, 1, 7, 9, 9, 9, 2, 9,
    3, 9, 9, 2, 7, 7, 9, 9, 9, 1, 9, 1, 9, 1, 9, 6, 9, 1, 9, 9, 9,
    9, 9, 7, 1, 9, 8, 6, 1, 4, 9, 9, 1, 1, 9, 9, 2, 9, 9, 6, 9, 9,
    9, 5, 9, 9, 1, 9, 9, 1, 9, 1, 9, 1, 8, 9, 3, 9, 9, 8, 9, 2, 1,
    7, 9, 5, 9, 9, 8, 5, 7, 9, 9, 3, 8, 1, 4, 9, 9, 6, 4, 9, 5, 9,
    6, 9, 9, 5, 1, 3, 9, 9, 9, 9, 1, 9, 1, 9, 3, 9, 9, 9, 5, 9, 7,
    1, 1, 9, 1, 9, 7, 9, 9, 1, 9, 3, 9, 9, 9, 1, 1, 7, 1, 9, 9, 9,
    9, 9, 1, 1, 9, 9, 9, 9, 1, 9, 9, 1, 9, 3, 7, 9, 2, 9, 9, 2, 9,
    9, 6, 9, 9, 9, 1, 9, 2, 1, 1, 9, 3, 3, 9, 5, 9, 9, 9, 9, 8, 6,
    1, 8, 7, 1, 9, 1, 9, 1, 9, 9, 1, 1, 9, 9, 9, 9, 5, 9, 1, 7, 8,
    1, 9, 9, 8, 8, 5)),
    .Names = c("v1", "v2", "v3"),
    row.names = c(NA, 327L),
    questiontype = "PickOneMulti",
    question = "Q4. Frequency of drinking", class = "data.frame")

y <- c(3, 7, 3, 3, 9, 9, 8, 5, 10, 7, 7, 9, 9, 4, 10, 3, 4, 8, 5,
       2, 8, 7, 9, 8, 4, 3, 5, 6, 3, 9, 8, 9, 4, 2, 9, 4, 9, 7, 2, 6,
       9, 7, 9, 6, 7, 3, 5, 6, 6, 7, 2, 9, 5, 3, 6, 4, 9, 4, 10, 2,
       5, 6, 2, 7, 2, 4, 10, 5, 3, 5, 5, 2, 4, 6, 7, 8, 6, 9, 9, 10,
       8, 4, 5, 2, 3, 2, 8, 9, 4, 2, 2, 10, 7, 4, 2, 8, 9, 9, 5, 9,
       2, 2, 7, 5, 2, 4, 2, 2, 4, 10, 8, 7, 5, 6, 6, 5, 2, 6, 9, 8,
       8, 5, 3, 6, 3, 5, 4, 10, 3, 2, 2, 10, 4, 2, 8, 6, 9, 8, 9, 9,
       4, 9, 2, 2, 4, 10, 6, 2, 6, 2, 2, 10, 5, 7, 5, 2, 8, 6, 2, 2,
       4, 3, 3, 3, 3, 4, 4, 7, 6, 5, 8, 9, 8, 8, 8, 9, 6, 5, 3, 3, 6,
       2, 5, 9, 6, 5, 6, 3, 3, 3, 9, 3, 9, 3, 2, 2, 7, 4, 6, 9, 2, 10,
       3, 8, 9, 4, 7, 8, 4, 9, 9, 9, 2, 3, 6, 8, 10, 7, 3, 3, 4, 5,
       3, 10, 10, 6, 6, 10, 2, 10, 2, 8, 6, 9, 2, 9, 9, 8, 9, 5, 9,
       3, 9, 2, 5, 3, 10, 6, 7, 8, 9, 5, 2, 3, 6, 8, 6, 5, 6, 8, 9,
       5, 2, 9, 3, 5, 8, 10, 3, 7, 7, 8, 6, 9, 7, 7, 5, 8, 7, 8, 9,
       2, 3, 10, 7, 8, 4, 10, 9, 10, 3, 4, 9, 4, 4, 9, 9, 8, 6, 5, 7,
       9, 5, 6, 5, 3, 8, 6, 7, 5, 8, 2, 3, 9, 5, 8, 8, 8, 5, 3, 4, 4,
       8, 4, 2, 4, 8)

w <- structure(c(1.02849002849003, 0.587708587708588, 0.587708587708588,
                 1.61619861619862, 1.02849002849003, 0.293854293854294, 0.440781440781441,
                 1.46927146927147, 0.440781440781441, 1.02849002849003, 1.02849002849003,
                 1.02849002849003, 0.440781440781441, 0.734635734635735, 0.587708587708588,
                 0.734635734635735, 0.587708587708588, 0.587708587708588, 1.02849002849003,
                 0.293854293854294, 0.734635734635735, 0.293854293854294, 1.02849002849003,
                 0.881562881562882, 0.587708587708588, 0.734635734635735, 0.587708587708588,
                 0.587708587708588, 0.293854293854294, 1.17541717541718, 0.881562881562882,
                 0.734635734635735, 0.734635734635735, 0.587708587708588, 0.734635734635735,
                 0.440781440781441, 0.587708587708588, 1.61619861619862, 0.293854293854294,
                 0.734635734635735, 0.293854293854294, 0.881562881562882, 0.734635734635735,
                 1.32234432234432, 1.61619861619862, 0.881562881562882, 0.734635734635735,
                 0.734635734635735, 1.61619861619862, 0.734635734635735, 0.587708587708588,
                 1.02849002849003, 1.61619861619862, 1.46927146927147, 0.587708587708588,
                 1.61619861619862, 0.587708587708588, 0.587708587708588, 0.293854293854294,
                 0.440781440781441, 0.734635734635735, 1.46927146927147, 0.440781440781441,
                 0.587708587708588, 1.02849002849003, 0.881562881562882, 0.587708587708588,
                 0.146927146927147, 0.587708587708588, 0.587708587708588, 1.17541717541718,
                 0.146927146927147, 0.587708587708588, 0.293854293854294, 0.734635734635735,
                 0.734635734635735, 1.61619861619862, 0.734635734635735, 0.587708587708588,
                 1.61619861619862, 0.734635734635735, 0.734635734635735, 1.61619861619862,
                 0.587708587708588, 0.293854293854294, 0.881562881562882, 0.587708587708588,
                 1.02849002849003, 1.17541717541718, 0.146927146927147, 1.32234432234432,
                 0.587708587708588, 0.734635734635735, 0.881562881562882, 1.61619861619862,
                 0.734635734635735, 0.881562881562882, 0.293854293854294, 0.440781440781441,
                 1.32234432234432, 0.293854293854294, 0.440781440781441, 1.61619861619862,
                 0.734635734635735, 0.293854293854294, 0.734635734635735, 1.61619861619862,
                 1.46927146927147, 1.02849002849003, 0.587708587708588, 0.881562881562882,
                 0.587708587708588, 0.587708587708588, 1.46927146927147, 0.587708587708588,
                 0.293854293854294, 0.440781440781441, 1.32234432234432, 0.734635734635735,
                 0.734635734635735, 1.02849002849003, 1.17541717541718, 1.17541717541718,
                 0.293854293854294, 1.32234432234432, 0.440781440781441, 0.734635734635735,
                 0.293854293854294, 0.734635734635735, 0.734635734635735, 0.734635734635735,
                 0.293854293854294, 1.61619861619862, 1.17541717541718, 1.02849002849003,
                 0.734635734635735, 0.146927146927147, 0.734635734635735, 0.440781440781441,
                 0.440781440781441, 0.587708587708588, 1.17541717541718, 1.32234432234432,
                 0.587708587708588, 1.02849002849003, 0.146927146927147, 0.734635734635735,
                 0.293854293854294, 1.02849002849003, 0.146927146927147, 0.881562881562882,
                 0.587708587708588, 0.881562881562882, 0.734635734635735, 0.293854293854294,
                 0.440781440781441, 0.587708587708588, 0.293854293854294, 0.293854293854294,
                 0.734635734635735, 0.881562881562882, 1.32234432234432, 1.61619861619862,
                 1.61619861619862, 0.881562881562882, 1.02849002849003, 0.440781440781441,
                 0.440781440781441, 1.61619861619862, 0.881562881562882, 1.61619861619862,
                 0.293854293854294, 1.17541717541718, 0.293854293854294, 1.32234432234432,
                 0.440781440781441, 0.293854293854294, 1.17541717541718, 0.881562881562882,
                 0.734635734635735, 0.293854293854294, 1.32234432234432, 0.587708587708588,
                 1.61619861619862, 1.17541717541718, 0.881562881562882, 0.881562881562882,
                 1.61619861619862, 0.881562881562882, 0.734635734635735, 0.440781440781441,
                 0.734635734635735, 0.440781440781441, 0.881562881562882, 0.587708587708588,
                 0.440781440781441, 1.61619861619862, 1.32234432234432, 0.734635734635735,
                 0.734635734635735, 0.146927146927147, 0.587708587708588, 1.17541717541718,
                 0.440781440781441, 0.734635734635735, 0.881562881562882, 1.17541717541718,
                 0.293854293854294, 1.32234432234432, 1.02849002849003, 1.32234432234432,
                 1.61619861619862, 1.02849002849003, 0.440781440781441, 0.881562881562882,
                 1.61619861619862, 0.587708587708588, 1.17541717541718, 0.881562881562882,
                 0.734635734635735, 1.61619861619862, 1.17541717541718, 0.587708587708588,
                 1.61619861619862, 0.293854293854294, 0.440781440781441, 1.02849002849003,
                 1.61619861619862, 0.587708587708588, 0.734635734635735, 0.881562881562882,
                 0.734635734635735, 0.734635734635735, 0.881562881562882, 0.293854293854294,
                 0.146927146927147, 0.734635734635735, 0.587708587708588, 0.734635734635735,
                 0.881562881562882, 0.146927146927147, 0.881562881562882, 1.17541717541718,
                 1.61619861619862, 1.61619861619862, 1.02849002849003, 1.61619861619862,
                 0.734635734635735, 0.440781440781441, 0.881562881562882, 1.17541717541718,
                 0.881562881562882, 0.734635734635735, 0.734635734635735, 0.734635734635735,
                 1.32234432234432, 0.734635734635735, 1.17541717541718, 0.587708587708588,
                 1.61619861619862, 0.587708587708588, 1.32234432234432, 0.734635734635735,
                 0.293854293854294, 0.734635734635735, 0.440781440781441, 0.440781440781441,
                 0.293854293854294, 0.587708587708588, 0.734635734635735, 0.734635734635735,
                 0.881562881562882, 0.734635734635735, 0.734635734635735, 1.61619861619862,
                 0.587708587708588, 0.881562881562882, 0.293854293854294, 1.02849002849003,
                 0.881562881562882, 0.734635734635735, 0.587708587708588, 0.881562881562882,
                 0.440781440781441, 0.734635734635735, 0.734635734635735, 0.881562881562882,
                 1.61619861619862, 0.440781440781441, 0.587708587708588, 0.587708587708588,
                 0.734635734635735, 0.440781440781441, 0.587708587708588, 1.17541717541718,
                 0.734635734635735, 0.293854293854294, 0.734635734635735, 0.734635734635735,
                 0.734635734635735, 0.587708587708588, 1.61619861619862, 0.881562881562882,
                 0.587708587708588, 0.587708587708588, 0.734635734635735, 0.734635734635735,
                 1.02849002849003, 1.17541717541718, 0.734635734635735, 0.881562881562882,
                 0.587708587708588, 0.881562881562882, 0.881562881562882, 0.881562881562882,
                 0.293854293854294, 0.440781440781441, 0.881562881562882, 0.734635734635735,
                 0.881562881562882, 1.02849002849003, 0.587708587708588, 0.587708587708588,
                 0.587708587708588, 0.734635734635735, 0.587708587708588, 0.440781440781441),
               name = "Q32", label = "Q32. Income")

dat <- cbind(y, X)

test_that("Relative importance linear", {
    ria <- flipRegression:::estimateRelativeImportance(y ~ v1 + v2 + v3, dat, NULL, "Linear", c(1, 1 ,1),
                                                       0.0409055316886271, variable.names = LETTERS[1:3], FALSE, TRUE, "None")
    expect_equal(unname(ria$importance[3]), 84.254254422183)
    expect_equal(unname(ria$raw.importance[1]), 0.00427583141764991)
    expect_equal(unname(ria$standard.errors[2]), 0.00639909659943047)
    expect_equal(unname(ria$statistics[3]), 1.67707778306778)
    expect_equal(unname(ria$p.values[1]), 0.601684127723725)
})

test_that("Relative importance linear weighted", {
    ria <- flipRegression:::estimateRelativeImportance(y ~ v1 + v2 + v3, dat, w, "Linear", c(1, 1, 1),
                                                       0.0488985219292419, variable.names = LETTERS[1:3], FALSE, TRUE, "None")
    expect_equal(unname(ria$importance[3]), 80.657438103125)
    expect_equal(unname(ria$raw.importance[1]), 0.00356269285452153)
    expect_equal(unname(ria$standard.errors[2]), 0.00922207572739253)
    expect_equal(unname(ria$statistics[3]), 1.80433377885404)
    expect_equal(unname(ria$p.values[1]), 0.639743624224031)
})

types <- c("Linear", "Binary Logit", "Ordered Logit", "Poisson", "Quasi-Poisson", "NBD")
output <- "Relative Importance Analysis"

data(bank, package = "flipExampleData")

for (t in types)
    test_that(paste("Relative importance", t),
              expect_error(suppressWarnings(print(Regression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM,
                                                   data = bank, type = t, output = output))), NA))
test_that("Relative importance Multinomial Logit",
          expect_error(suppressWarnings(print(Regression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM,
                                         data = bank, type = "Multinomial Logit", output = output))),
                                        "Type not handled:  Multinomial Logit"))

# Weights
for (t in types)
    test_that(paste("Relative importance weighted", t),
              expect_error(suppressWarnings(print(Regression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM,
                                               data = bank, type = t, output = output,
                                               weights = bank$weight))), NA))
test_that("Relative importance weighted Multinomial Logit",
          expect_error(suppressWarnings(print(Regression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM,
                                           data = bank, type = "Multinomial Logit", output = output,
                                           weights = bank$weight))), "Type not handled:  Multinomial Logit"))

# Filter
test_that("Relative importance filtered",
          expect_error(suppressWarnings(print(Regression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM,
                                               data = bank, type = "Linear", output = output,
                                               subset = bank$ID < 100))), NA))

# Robust standard error
test_that("Relative importance robust SE",
          expect_error(suppressWarnings(print(Regression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM,
                                               data = bank, type = "Linear", output = output,
                                               robust.se = F))), NA))

# Negative sign warning
test_that("Relative importance negative sign",
{
          expect_warning(flipRegression:::estimateRelativeImportance(y ~ v1 + v2 + v3, dat, NULL, "Linear", c(1, -1 ,1),
                                                             0.0409055316886271, variable.names = LETTERS[1:3], correction = "None"),
                         paste0("Negative signs in Relative Importance scores were applied from coefficient signs",
                                " in Linear Regression. To disable this feature, check the Absolute importance",
                                " scores option."))

    res <- Regression(y~v1+v2+v3, dat, output = "Relative Importance Analysis", missing = "Multiple imputation", importance.absolute = TRUE)
    expect_true(all(res$importance$importance > 0))
})

X.factor <- X
X.factor[[1]] <- as.factor(X.factor[[1]])
X.factor[[2]] <- as.factor(X.factor[[2]])
X.factor[[3]] <- as.factor(X.factor[[3]])
dat.factor <- cbind(y, X.factor)

# Factor warning
test_that("Relative importance ordered factor",
          expect_warning(flipRegression:::estimateRelativeImportance(y ~ v1 + v2 + v3, dat.factor, NULL, "Linear", c(1, -1 ,1),
                                                                     0.0409055316886271, variable.names = LETTERS[1:3], correction = "None"),
                         "The following variables have been treated as categorical: v1,v2,v3. This may over-inflate their effects."))

test_that("Relative importance robust SE, dot in formula",
{
    bank$ID <- bank$weight <- NULL
    out <- suppressWarnings(Regression(Overall ~ .,
                                               data = bank, type = "Linear", output = output,
                                       robust.se = F))
    expect_equal(attr(out$terms, "term.labels"), names(bank)[-1L])
})

test_that("Shapley",
{
    bank.no.missing <- bank[!is.na(rowSums(bank)), ]
    bank.no.missing$Interest <- -bank.no.missing$Interest # reverse sign to test signs

    warning.msg <- paste0("Negative signs in Relative Importance scores were applied ",
                          "from coefficient signs in Linear Regression. ",
                          "To disable this feature, check the Absolute importance ",
                          "scores option.")

    expect_warning(result <- computeShapleyImportance(Overall ~ Fees + Interest + Phone + Branch + Online + ATM,
                                      data = bank.no.missing,
                                      weights = rep(1, nrow(bank.no.missing)),
                                      variable.names = c("Fees", "Interest", "Phone",
                                                         "Branch", "Online", "ATM"),
                                      signs = NULL,
                                      correction = "None"), warning.msg)

    expect_equal(result$raw.importance[1], c(Fees = 0.115570678291964))
    expect_equal(sum(result$raw.importance), 0.4988654351715)
    expect_equal(result$importance[1], c(Fees = 23.1667039133))
    expect_equal(result$standard.errors[1], c(Fees = 0.03113091404327))
    expect_equal(result$statistics[1], c(Fees = 3.712408769345))
    expect_equal(result$p.values[1], c(Fees = 0.0002559481304636))
    expect_equal(result$importance[2], c(Interest = -15.1397373957463))

    expect_warning(result <- computeShapleyImportance(Overall ~ Fees + Interest + Phone + Branch + Online + ATM,
                                                      data = bank.no.missing,
                                                      weights = bank.no.missing$weight,
                                                      variable.names = c("Fees", "Interest", "Phone",
                                                                         "Branch", "Online", "ATM"),
                                                      signs = NULL,
                                                      correction = "None"), warning.msg)
    expect_equal(result$raw.importance[1], c(Fees = 0.1090244509126))
    expect_equal(sum(result$raw.importance), 0.4936505179077)
    expect_equal(result$importance[1], c(Fees = 22.08535126726))
    expect_equal(result$standard.errors[1], c(Fees = 0.0302990327033463))
    expect_equal(result$statistics[1], c(Fees = 3.59828156826045))
    expect_equal(result$p.values[1], c(Fees = 0.000389921200592241))

    suppressWarnings(print(Regression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM,
                     data = bank, type = "Linear", output = "Shapley regression")))

    expect_error(Regression(Overall ~ Fees + Interest + Phone + Branch + Online + ATM,
                            data = bank, type = "Binary Logit", output = "Shapley regression"),
                 "Shapley requires Regression type to be Linear. Set the output to Relative Importance Analysis instead.")

    many.variables <- matrix(rnorm(3000), ncol = 30)
    colnames(many.variables) <- paste0("v", 1:30)
    many.variables <- data.frame(many.variables)
    frml <- formula(paste("v1", "~", paste0("v", 2:30, collapse = " + ")))
    expect_error(result <- computeShapleyImportance(frml,
                                                   data = many.variables,
                                                   weights = NULL,
                                                   variable.names = paste0("v", 2:30),
                                                   signs = NULL,
                                                   correction = "None"),
        "Shapley can run with a maximum of 27 predictors. Set the output to Relative Importance Analysis instead.")
})
