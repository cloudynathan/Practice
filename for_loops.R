#------ For Loops (Chapter 17: Iteration with purrr, page 314)

# for loop
df <- list(df = datasets::mtcars)
df <- data.frame(df)

output <- vector(mode = "double", length = ncol(df)) #output, allocate space for output
  for (i in seq_along(df)) {                         #sequence, what to loop over
    output[[i]] <- mean(df[[i]])                     #body, run repeatedly - each time with a different value for i
  }
output


