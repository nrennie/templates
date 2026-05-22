---
name: r-general
description: General best practices for use when writing any R code.
---

## Code style

* Do not add comments at the end of lines.
* Use `<-` not `=` for assignment. Use `=` only for function arguments.
* Use `TRUE` not `T`, and `FALSE` not `F`.
* Be explicit about all function arguments e.g. `ggplot(data = plot_data)` rather than `ggplot(plot_data)`.
* Keep lines under 80 characters where possible.
* Use consistent spacing e.g. `x + 3` not `x+ 3`.
