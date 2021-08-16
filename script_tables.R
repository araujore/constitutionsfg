
### Generate tables of "The Rise of Future Generations in Constitutioons" paper
### Contact: renan.araujo@legalpriorities.org

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

#### Table 1

table1 <- read.csv("https://raw.github.com/araujore/constitutionsfg/main/table_1.csv")

rowlabels1 <- c("Environment", "Natural resources", "Future generations (stricto sensu)", "Societal values", "Public finance")
colnames(table1) <- c(rowlabels1)

table1 %>%
    kbl(digits = 0, align = "c", 
      caption = "Table 1. Themes of constitutional provisions mentioning future generations (2021)") %>%
  
    kable_styling(bootstrap_options = c("condensed"), font_size = 14)  %>%
  
    footnote(general = "Values exceed 100% as some constitutional provisions were coded twice for their primary and secondary themes.", 
           general_title = "Note. ", footnote_as_chunk = T)  %>%
  
    kable_classic(full_width = T, html_font = "Times New Roman")


#### Table 2

table2 <- read.csv("https://raw.github.com/araujore/constitutionsfg/main/table_2.csv")

rowlabels2 <- c("Principle", "Civic duty", "State duty", "Right", "Total")
colnames(table2) <- c(rowlabels2)

table2 %>%
    kbl(digits = 0, align = "c", 
      caption = "Table 2. Strength of $de$ $jure$ protection of future generations in constitutions (2021)") %>%
  
    kable_styling(bootstrap_options = c("condensed"), font_size = 14)  %>%
  
   # footnote(general = "Values exceed 100% as some constitutions were coded twice for their primary and secondary themes.", 
   #         general_title = "Note. ", footnote_as_chunk = T)  %>%
  
    kable_classic(full_width = T, html_font = "Times New Roman")

#### Table 3

obstbl <- chisq.test(allc$region, allc$fg)$observed
# expmtx <- chisq.test(allc$region, allc$fg)$expected


regions <- rownames(obstbl)
rowlabels <- c("No FG", "FG in constitution")

# fulltable <- cbind(expmtx, obstbl)
colnames(obstbl) <- c(rowlabels)

# result <- chisq.test(allc$region, allc$fg)
# x² = 12.903, df = 4, p-value = 0.01176

obstbl %>%
  kbl(digits = 0, align = "c", 
      caption = "Table 3. Regions vs. presence of future generations in constitution (2021)") %>%
  
  kable_styling(bootstrap_options = c("condensed"), font_size = 14)  %>%
  
  footnote(general = "Africa: 26% more FG than expected
                        Americas: 22% less FG than expected
                        Asia & the Pacific: 33% less FG than expected
                        Eastern Europe & Central Asia: 30% more FG than expected
                        Western Europe: 12% less FG than expected", 
           general_title = "Note. ", footnote_as_chunk = T)  %>%
  
  kable_classic(full_width = T, html_font = "Times New Roman")


#### Table 4

table4 <- read.csv("https://raw.github.com/araujore/constitutionsfg/main/table_4.csv")

rowlabels4 <- c("$De$ $jure$ $protection$", "Clear", "Unclear")
colnames(table4) <- c(rowlabels4)

table4 %>%
  kbl(digits = 0, align = "c", 
      caption = "Table 4. Categories of case studies on the constitutional protection of future generations") %>%
  
  add_header_above(c(" " = 1, "$De$ $facto$ $protection$" = 2))  %>%
  
  kable_styling(bootstrap_options = c("condensed"), font_size = 14)  %>%
  
  kable_classic(full_width = T, html_font = "Times New Roman")
