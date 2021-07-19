
### Analysis script of "The Rise of Future Generations in Constitutioons" paper
### Contact: renan.araujo@legalpriorities.org

# Importing complete dataset

allc <- read.csv("https://raw.githubusercontent.com/araujore/constitutionsfg/main/constitutionsfg.csv")

# Creating a separate dataset with countries that 
# reference future generations in their constitutions

library(crunch)
cfg <- allc[allc$fg == TRUE,]

##### What predicts the constitutionalization of future generations?

##### region

obs <- chisq.test(allc$region1, allc2$fg)$observed
exp <- chisq.test(allc$region1, allc2$fg)$expected

chisq.test(allc$region, allc$fg)$observed
chisq.test(allc$region, allc$fg)$expected

chisq.test(allc$region, allc$fg)
# X-squared = 10.293, df = 4, p-value = 0.03577 

##### ideology (using scores by Law, 2016)

cor.test(allc$ideolib, allc$fg)
# cor = -0.2392342, p-value = 0.01618

cor.test(allc$ideosta, allc$fg)
# cor = -0.07036851, p-value = 0.3736 (insignificant)

cor.test(allc$ideouni, allc$fg)
# cor = 0.2234809, p-value = 0.004254


##### legal system (not correlated)

chisq.test(allc$legsyst, allc$fg)
# X-squared = 5.1918, df = 3, p-value = 0.1583


chisq.test(allc$qogleg, allc$fg)
# X-squared = 0.41621, df = 1, p-value = 0.5188


##### GDP per capita

chisq.test(allc$econ, allc$fg)
# X-squared = 0.1567, df = 2, p-value = 0.9246 (insignificant)

gdp <- as.numeric(allc$gdp)
cor.test(gdp, allc$fg)
# cor = -0.01758729, t = -0.23336, df = 176, p-value = 0.8158
# insignificant

# Predicting the content of FG provisions

## Region
### Region vs theme

chisq.test(cfg$region, cfg$theme) 
# X-squared = 31.6, df = 12, p-value = 0.001595

### Region vs type

chisq.test(cfg$region, cfg$type)
# X-squared = 22.128, df = 12, p-value = 0.03611
