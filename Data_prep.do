use "assignment_data_working.dta" 
keep if stateicp=14
keep if stateicp==14
drop if age>64
drop if age<18
drop if inctot<0
recode educ (0/2 = 0) (3/5 = 1) (6 = 2) (7/8 = 3) (9/11 = 4), gen(degree)
tabulate citizen, generate(cit_)
replace cit_1=1 if cit_4==1
drop cit_4