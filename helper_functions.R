#helper functions

library(ggplot2)

sanitize <- function(str){
    #given raw string input
    #remove non-alpha characters, convert to lower, return relative frequencies
    
    newstr <- gsub("[^[:alpha:]]", "", str)
    newstr <- tolower(newstr)
    chars <- strsplit(newstr, NULL)[[1]]
    freqs <- summary(factor(chars))
    rfreqs <- freqs / sum(freqs)
    
    return(rfreqs)
}

fill_freqs <- function(rfreqs) {
    #given relative frequencies
    #return array with all english letters
    
    
    #make 0-count vector
    alphabet <- rep(1,26)
    names(alphabet) <- letters
    
    alphabet_filled <- sapply(1:26, function(x) {rfreqs[names(alphabet)[x]]})
    
    alphabet_filled[is.na(alphabet_filled)] <- 0
    
    names(alphabet_filled) <- letters
    alphabet_filled <- as.data.frame(alphabet_filled)
    names(alphabet_filled) <- "rfreqs"
    
    return(alphabet_filled)
#     return("textstring")
    
}


sanitize_fill <- function(str) {

    return(fill_freqs(sanitize(str)))
}



fplot <- function(str){
    
    rfreqs <- sanitize(str)
    alphabet_filled <- fill_freqs(rfreqs)
    
    p <- ggplot(data=alphabet_filled, aes(x=seq(1:26),y=rfreqs)) + geom_bar(stat="identity",aes(fill=rfreqs)) + 
        scale_x_discrete(breaks = c(1:26), labels=letters) +
        labs(title="Letter Frequency", x = "letter", y="frequency")
    
    print(p)
}






