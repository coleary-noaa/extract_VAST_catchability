##load model##
fit <- model_name

##MLE = exp(Q1+Q2)
exp(as.numeric(fit$parameter_estimates$par['lambda1_k']) + as.numeric(fit$parameter_estimates$par['lambda2_k']))

##SE (###sqrt((sample_size*(SE^2)) + (sample_size*(SE^2))/sqrt(sample_size)))
fish_report = TMB::summary.sdreport(fit$parameter_estimates$SD)
fish_se1 <- fish_report[which(rownames(fish_report)=="lambda1_k"),"Std. Error"]
fish_se2 <- fish_report[which(rownames(fish_report)=="lambda2_k"),"Std. Error"]
fish_sample_size <- fit$data_list$n_i
sqrt((fish_sample_size*(fish_se1^2)) + (fish_sample_size*(fish_se2^2)))/sqrt(fish_sample_size)
