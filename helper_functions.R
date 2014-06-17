#helper functions

library(ggplot2)

sanitize <- function(str){
    #input: raw text string
    #output: relative frequencies
    
    newstr <- gsub("[^[:alpha:]]", "", str)
    newstr <- tolower(newstr)
    chars <- strsplit(newstr, NULL)[[1]]
    freqs <- summary(factor(chars))
    rfreqs <- freqs / sum(freqs)
    
    return(rfreqs)
}

fill_freqs <- function(rfreqs) {
    #input: relative frequencies (not necessarily for all 26 letters)
    #output: relative frequencies for all 26 letters
    
    #make 0-count vector
    alphabet <- rep(1,26)
    names(alphabet) <- letters
    
    alphabet_filled <- sapply(1:26, function(x) {rfreqs[names(alphabet)[x]]})
    
    alphabet_filled[is.na(alphabet_filled)] <- 0
    
    names(alphabet_filled) <- letters
    alphabet_filled <- as.data.frame(alphabet_filled)
    names(alphabet_filled) <- "rfreqs"
    
    return(alphabet_filled)
}



fplot <- function(str,ref){
    #input: raw text, array with reference frequencies
    #output: plot
    rfreqs <- sanitize(str)
    alphabet_filled <- fill_freqs(rfreqs)
    
    if (ref[1] != "None") {
        alphabet_filled_ref <- fill_freqs(ref)
    
        #two-hist plot
        p <- ggplot(data=alphabet_filled, aes(x=seq(1:26),y=rfreqs)) + geom_bar(stat="identity",aes(fill=rfreqs)) + 
            scale_x_discrete(breaks = c(1:26), labels=letters) + 
            geom_bar(data=alphabet_filled_ref,stat="identity",color="salmon",alpha = 0) +
            labs(title="Relative Letter Frequency", x = "letter", y="relative frequency")
        
    } else {
        #one-hist plot
        p <- ggplot(data=alphabet_filled, aes(x=seq(1:26),y=rfreqs)) + geom_bar(stat="identity",aes(fill=rfreqs)) + 
            scale_x_discrete(breaks = c(1:26), labels=letters) + 
            labs(title="Relative Letter Frequency", x = "letter", y="relative frequency")
    }
        
    print(p)
}






