context("column_width")
describe("column_width", {
  it("checks that ncol is a single positive integer", {
    expect_that(
      column_width(ncol = 1:2),
      throws_error("ncol must be a single positive integer")
    )
    expect_that(
      column_width(ncol = integer(0)),
      throws_error("ncol must be a single positive integer")
    )
    expect_that(
      column_width(ncol = -1),
      throws_error("ncol must be a single positive integer")
    )
    expect_that(
      column_width(ncol = 0),
      throws_error("ncol must be a single positive integer")
    )
    expect_that(
      column_width(ncol = 1.1),
      throws_error("ncol must be a single positive integer")
    )
    expect_that(
      column_width(ncol = NA),
      throws_error("ncol must be a single positive integer")
    )
    expect_that(
      column_width(ncol = "1"),
      throws_error("ncol must be a single positive integer")
    )
    expect_that(
      column_width(ncol = 1),
      is_a("numeric")
    )
    expect_that(
      column_width(ncol = 1L),
      is_a("numeric")
    )
  })
  it("checks that space is a single positive number", {
    expect_that(
      column_width(space = 1:2),
      throws_error("space must be a single number")
    )
    expect_that(
      column_width(space = numeric(0)),
      throws_error("space must be a single number")
    )
    expect_that(
      column_width(space = -1),
      throws_error("space must be positive")
    )
    expect_that(
      column_width(space = 0),
      is_a("numeric")
    )
    expect_that(
      column_width(space = 1.1),
      is_a("numeric")
    )
    expect_that(
      column_width(space = NA),
      throws_error("space must be a single number")
    )
    expect_that(
      column_width(space = "1"),
      throws_error("space must be a single number")
    )
    expect_that(
      column_width(ncol = 1),
      is_a("numeric")
    )
    expect_that(
      column_width(ncol = 1L),
      is_a("numeric")
    )
  })
})

context("column_start")
describe("column_start", {
  it("checks that start is a single positive integer", {
    expect_that(
      column_start(start = 1:2),
      throws_error("start must be a single positive integer")
    )
    expect_that(
      column_start(start = integer(0)),
      throws_error("start must be a single positive integer")
    )
    expect_that(
      column_start(start = -1),
      throws_error("start must be a single positive integer")
    )
    expect_that(
      column_start(start = 0),
      throws_error("start must be a single positive integer")
    )
    expect_that(
      column_start(start = 1.1),
      throws_error("start must be a single positive integer")
    )
    expect_that(
      column_start(start = NA),
      throws_error("start must be a single positive integer")
    )
    expect_that(
      column_start(start = "1"),
      throws_error("start must be a single positive integer")
    )
    expect_that(
      column_start(start = 1),
      is_a("numeric")
    )
    expect_that(
      column_start(start = 1L),
      is_a("numeric")
    )
  })
  it("checks that start is not larger than ncol", {
    expect_that(
      column_start(start = 2, ncol = 1),
      gives_warning("start > ncol. start = ncol used instead")
    )
    expect_that(
      column_start(start = 2, ncol = 1),
      is_identical_to(column_start(start = 1, ncol = 1))
    )
  })
})
