# Create GitLab CI/CD file

Create GitLab CI/CD file

## Usage

``` r
use_gitlab_ci(type, overwrite = FALSE)
```

## Arguments

- type:

  Type of CI/CD pipeline. Options include `"pages"`, `"quarto"`,
  `"quarto-r"`, or `"pkgdown"`.

- overwrite:

  Boolean to overwrite existing file if it exists. Default `FALSE`.

## Value

a message if template file was successfully copied over
