library("knitr")
knitr::opts_chunk$set(error = TRUE)
knit2pdf("Latex/rapport_HG.Rnw", compiler = 'xelatex')
