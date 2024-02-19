library(tidyverse)
iban = str_replace_all(readline(prompt = "Please enter your IBAN here :" ), fixed(" "), "")
x <- strtoi(str_sub(iban,1,1), 36L)
x2 <- strtoi(str_sub(iban,2,2), 36L)
y <- nchar(iban) %/% 3
parts <- substring(iban, seq(5, nchar(iban)-5, 6), seq(10, nchar(iban), 6))
if((nchar(iban)-4) %% 6 != 0){
lastpart <- substring(iban, nchar(iban) + 1 - (nchar(iban)-4) %% 6, nchar(iban))
}else{
  lastpart <- 0
}
residue <- 0
for (p in parts)
{
  while((substring(p,1,1) == 0) && (nchar(p) > 1))
  {
    p = substring(p,2,nchar(p))
  }
  residue <- (residue * 1000000 + strtoi(p)) %% 97
  print(residue)
}
print(residue)
print(lastpart)
if(lastpart != 0)
{
residue <- (residue * (10 ^ nchar(lastpart)) + strtoi(lastpart)) %% 97
}
print(residue)
residue <- (residue * 1000000 + x * 10000 + x2 * 100) %% 97
checksum <- 98 - residue

if(checksum == strtoi(substring(iban, 3,4))){
  print("valid")
  } else {
  print("not valid")
  }

