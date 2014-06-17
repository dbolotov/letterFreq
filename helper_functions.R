#helper functions


sanitize <- function(str){
    
    newstr <- gsub("[^[:alpha:]]", "", str)
    newstr <- tolower(newstr)
    chars <- strsplit(newstr, NULL)[[1]]
    freqs <- summary(factor(chars))
    rfreqs <- freqs / sum(freqs)
    
    return(newstr)
}