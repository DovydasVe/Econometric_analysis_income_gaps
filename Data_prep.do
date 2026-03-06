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



gen cit_1 = 1 if citizen == 0 | citizen == 1
replace cit_1=0 if citizen == 2 | citizen == 3

gen cit_2 = 1 if citizen ==2
replace cit_2=0 if citizen != 2


gen cit_3 = 1 if citizen ==3
replace cit_3=0 if citizen != 3

* Cit_1 refers to American Citizens, either born in US or to American parents
* Cit_2 refers to naturalized citizens in the US
* Cit_3 refers to not american citizens



* Take the log of income as a response variable
gen log_inctot = ln(inctot)

* Race indicators, dummy encoded
gen asian = racasian - 1
gen amind = racamind - 1
gen black = racblk - 1
gen pacis = racpacis - 1
gen white = racwht - 1
gen other = racother - 1

* Employement status, dummy encoded
gen is_not_in_labor_force = 1 if empstat ==3
replace is_not_in_labor_force=0 if empstat != 3

gen is_unemployed = 1 if empstat ==2
replace is_unemployed=0 if empstat != 2

* Regress log of income on degree, age, sex, and citizenship status. 
*The basic model is this
reg log_inctot degree age sex cit_1 cit_2 yrsusa1


* Alternate model
reg log_inctot degree age sex cit_1 cit_2 yrsusa1


* outreg2 using basic_model_IRDD.doc, word



