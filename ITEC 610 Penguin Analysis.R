install.packages("palmerpenguins")
library(palmerpenguins)
data("penguins")

str(penguins)

mean(penguins$body_mass_g, na.rm=TRUE)
# one-sample test where penguin wt pop is 4000 g. (guessing)
t.test(x=penguins$body_mass_g, mu=4000)
# t-critical at df=341 & alpha of 0.05 & two-tail = 1.96

# 2-sample t comparing penguin body weight by sex
# hyp: males are heavier than females -- one-tail
  # check sample
table(penguins$sex)
  # check equal variance
var.test(body_mass_g ~ sex, data=penguins)
t.test(body_mass_g ~ sex, data=penguins, alternative="less", var.equal=T)

# chi-square test of indepence
# examine if there is a relationshp between penguin
  # species and island
chi.tab <- table(penguins$species, penguins$island)
chisq.test(table(penguins$species, penguins$island))
chisq.test(chi.tab)

fo = chi.tab
addmargins(chi.tab)


str(penguins)

#descriptive stats
library(summarytools)
library(dplyr)
# CAT IV
freq(penguins$species)
freq(penguins$sex)
# Quant DV + IVs
penguins |>
  select(body_mass_g, flipper_length_mm, bill_length_mm) |> 
  descr()

# checking OLS assumptions
  # right variables -- no code
  # linear in the parameters - no code
  # homoscedasticty -- ok, not a prob
  # influential outliers-- ok, not a prob
  # multicollinearity -- yes, issues on sev var but ok bc p-value are tiny, leave it alone.
  # normally dist errors-- ok, not a prob
  # indep. errors-- ok, not a prob

# make dummies
penguins$species.gentoo <- ifelse(penguins$species=="Gentoo", 1, 0)
penguins$species.chinstrap <- ifelse(penguins$species=="Chinstrap", 1, 0) 
penguins$species.adelie <-  ifelse(penguins$species=="Adelie", 1, 0)
# check dummy coding
table(penguins$species, penguins$species.chinstrap)
table(penguins$species, penguins$species.gentoo)
table(penguins$species, penguins$species.adelie)

# regression model
m.peng <- lm(body_mass_g ~ species.chinstrap + species.gentoo +
               sex + 
               bill_length_mm + 
               flipper_length_mm, data=penguins)
summary(m.peng)

# regression equation
#body_mass_g = -759 -291(Species: Chinstrap) + 707(Species: Gentoo) + 
#              465(Sex) + 21.6(Bill Length (mm) ) + 17.8(Flipper Length (mm) ) + e

library(stargazer)
stargazer(m.peng, type="text")
 
# plots for assumption above
plot(m.peng)
library(car)
vif(m.peng)

# f^2 = R^2 / 1-R^2
0.8685 / (1-0.8685) # 6.6  HUGE

# power
library(pwr)
pwr.f2.test(v=327, u=5, f2=6.6, sig.level=0.05, power=NULL)

##################


