if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2", repos = "http://cran.us.r-project.org")
}
library(ggplot2)

# Read csv file

df <- read.csv("regrex1.csv")

is.data.frame(df)

df

head(df)

str(df)
    cat("Is df a data frame? ", is.data.frame(df), "\n")
#Scatter plot
p_orig <- ggplot2::ggplot(df, aes(x = x, y = y)) +
  ggplot2::geom_point() +
  ggplot2::labs(title = "Scatter Plot",
                x = "X Axis",
                y = "Y Axis")
# Image of Scatterplot
    
ggsave("r_orig.png", plot = p_orig)    

# linear regression

cat("\nPerforming linear regression:\n")
LMR <- lm(y ~ x, data = df)
    
p_lm <- ggplot(df, aes(x = x, y = y)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatter Plot with Linear Regression Line",
       x = "X Axis",
       y = "Y Axis")
#Image of Scatter Plot
    ggsave("r_lm.png", plot = p_lm)



# Print coefficients of the regression model
cat("\nCoefficients of the regression model:\n")
print(coef(LMR))