* Load the dataset
use "assignment_data_working.dta" 

* Filter for Pennsylvania
keep if stateicp==14

* Filter for appropriate age groups
drop if age>64
drop if age<18

* Positive total income
drop if inctot<0

* Check the categories in education, recode them for degree
label list EDUC
recode educ (0/2 = 0) (3/5 = 1) (6 = 2) (7/8 = 3) (9/11 = 4), gen(degree)

* Generate dummy variables for citizen categories, merge those born abroad
* with American citizens.
tabulate citizen, generate(cit_)
replace cit_1=1 if cit_4==1
drop cit_4