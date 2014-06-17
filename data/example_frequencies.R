#example_frequencies.R

#make 0-count vector
alphabet <- rep(1,26)
names(alphabet) <- letters


#English classics
#http://www.data-compression.com/english.html
#classics_raw includes the space character
classics_raw <- c(0.0651738,0.0124248,0.0217339,0.0349835,0.1041442,0.0197881,0.0158610,0.0492888,0.0558094,0.0009033,0.0050529,0.0331490,0.0202124,0.0564513,0.0596302,0.0137645,0.0008606,0.0497563,0.0515760,0.0729357,0.0225134,0.0082903,0.0171272,0.0013692,0.0145984,0.0007836,0.1918182)

#recompute freq to exclude space
classics <- classics_raw[1:26] / sum(classics_raw[1:26])
names(classics) <- letters
