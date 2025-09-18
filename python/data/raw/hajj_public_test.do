cd "Z:\Hajj Public Data"
capture log close
log using hajj_public_test.log, replace
clear all
set mem 100m
set more off

use hajj_public.dta


desmat pod*cat*ptygrp

foreach var of varlist x_s14aq10 x_s14aq1 x_s14aq3 x_s14aq4 x_s14aq5 x_s14aq6 x_s14bq2 x_s14aq8 x_s14aq9 x_s14aq12 ///
x_s14aq13 x_s14aq15d x_s14aq16b x_s14aq16a x_s14aq16d x_s14aq16e x_s14aq16f x_s14dq6 x_s14cq6 x_s10dq7 x_s14dq7 ///
x_2_s14aq16b x_2_s14aq16a x_2_s14aq16d x_2_s14aq16f x_s15cq5 x_s15cq6 x_s15cq7 x_s15cq8 x_s15cq10 x_s15cq9 x_s15b_b6 ///
x_s15b_c6 x_s15b_a6 x_s15cq2 x_s15cq3 x_s15cq1 x_s14aq7 x_s10bq4 x_s10bq5 x_s10cq5 x_s10cq4 x_s10cq3 x_s10hq6 ///
x_s10hq7 x_s10hq8 x_s7q12a x_s7q12f x_s7q12d x_s7q12c x_s7q11c x_s10aq3 x_s10aq2 x_s10aq4 x_s10aq5 x_s10dq15a ///
x_s10dq15b x_s10dq15c x_s10dq18 xda_s10dq19b xda_s10dq19c xda_s10dq19d x_2_s10dq8 xd_s10dq8 x_s10eq2 x_s10eq5 ///
x_s10eq4 x_s10eq6 x_s10eq3 x_s1_3q3 x_s1_3q4 x_s1_3q5r4 x_s10dq15d x_s10dq6 x_s10hq3 x_s10hq11 x_s10dq1 x_s10dq14 ///
x_2_s14cq8_9 x_s14bq4 x_s14bq6 x_s14cq4 x_2_s14cq6 x_s10dq12 xop_s10dq19b xop_s10dq19c xop_s10dq19d x_s2q1 x_s2q2 ///
s3q1a s3q1b s3q1c s3q1d s3q1e s3q1f x_s3q2a x_s3q2b x_s3q2c x_s3q7 x_s3q3 x_s3q4 x_s3q5 x_s3q6 x_s7q7 x_s7q1 x_s7q2 ///
x_s5_4q5a x_s5_4q4a x_s7q10 x_s7q9 x_s5_5q1 x_s5_5q2 x_s5_5q3 x_s5_5q4 s5_2q1a s5_2q2a s5_2q3a s5_2q1b s5_2q2b ///
s5_2q3b x_s5_4q1a x_s5_4q2a x_s5_4q3a x_s12q2 x_s12q1 x_s14dq3 x_2_s14dq6 x_s14dq4 x_s8q2 x_s8q3 x_s8q7 x_s8q8 ///
x_s8q6 x_s8q5 x_pillars x_s14bq5 x_s14bq7 x_s14cq2 x_s14cq1 x_s14dq2 x_s14dq1 x_s14dq5 x_s14bq3 x_s14cq3 {

	ivreg `var' (hajj2006=success) _x_*, cluster(clusterid)
	}

log close

