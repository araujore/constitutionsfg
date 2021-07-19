## I'm thinking of tables in the 17th ed. Chicago citation style, like this one:
"https://libapps-au.s3-ap-southeast-2.amazonaws.com/accounts/2306/images/Green_Star.JPG"
## Thanks so much for taking the time!


##### SCRIPT BEGINS ##### 

# install kableExtra
# install.packages("kableExtra")
# install.packages("devtools")
# install.packages("data.table", dependencies=TRUE)

require(data.table)
# devtools::install_github("haozhu233/kableExtra")

library(kableExtra)
# library(tibble)
# library(gt)

allc <- read.csv("https://raw.githubusercontent.com/araujore/constitutionsfg/main/constitutionsfg.csv")

# generating tables
obstbl <- chisq.test(allc$region, allc$fg)$observed
expmtx <- chisq.test(allc$region, allc$fg)$expected
results <- chisq.test(allc$region, allc$fg)


regions <- rownames(obstbl)
rowlabels <- c("No FG", "FG in constitution")

fulltable <- cbind(expmtx, obstbl)
colnames(fulltable) <- c(rowlabels,rowlabels)

#### Table 1

# chisq.test(allc$region, allc$fg)
# x² = 10.293, df = 4, p-value = 0.0377

fulltable %>%
    kbl(digits = 0, align = "c", 
      caption = "Table 1. Regions vs. presence of future generations in constitution (2021)") %>%
  
    add_header_above(c(" " = 1, "Expected" = 2, "Observed" = 2))  %>%

    kable_styling(bootstrap_options = c("condensed"), font_size = 14)  %>%

    footnote(general = "$x²(4, N = 81)= 10.3, p = 0.036$", 
           general_title = "Note. ", footnote_as_chunk = T)  %>%
  
    kable_classic(full_width = T, html_font = "Times New Roman")
  

#### Table 2

table2 <- read.csv("https://raw.github.com/araujore/constitutionsfg/main/Table%202.csv")

rowlabels2 <- c("Environment", "Natural resources", "Future generations (stricto sensu)", "Societal values", "Public finance")
colnames(table2) <- c(rowlabels2)

table2 %>%
    kbl(digits = 0, align = "c", 
      caption = "Table 2. Themes of constitutional provisions mentioning future generations (2021)") %>%
  
    kable_styling(bootstrap_options = c("condensed"), font_size = 14)  %>%
  
    footnote(general = "Values exceed 100% as some constitutions were coded twice for their primary and secondary themes.", 
           general_title = "Note. ", footnote_as_chunk = T)  %>%
  
    kable_classic(full_width = T, html_font = "Times New Roman")


#### Table 3

table3 <- read.csv("https://raw.github.com/araujore/constitutionsfg/main/Table%203.csv")

rowlabels3 <- c("        Principle        ", "     Civic duty     ", "     State duty     ", "        Right        ")
colnames(table3) <- c(rowlabels3)

table3 %>%
    kbl(digits = 0, align = "c", 
      caption = "Table 3. Types of constitutional provisions mentioning future generations (2021)") %>%
  
    kable_styling(bootstrap_options = c("condensed"), font_size = 14)  %>%
  
   # footnote(general = "Values exceed 100% as some constitutions were coded twice for their primary and secondary themes.", 
   #         general_title = "Note. ", footnote_as_chunk = T)  %>%
  
    kable_classic(full_width = T, html_font = "Times New Roman")
