import math

def IBANchecker(iban):
    chunks = [iban[i : i+5] for i in range(4, len(iban), 5)]
    x = int(iban[0],36)
    y = int(iban[1],36)
    residue = 0;
    for i in chunks:
        residue = (residue * math.pow(10,len(i)) + int(i)) % 97
    residue = (residue * 1000000 + x * 10000 + y * 100) % 97
    residue = 98 - residue
    if residue == int(iban[2]+iban[3]):
        print("Valid IBAN")
    else:
        print("IBAN not Valid")




if __name__ == "__main__":
    iban = input("Please enter your IBAN: ")
    IBANchecker(iban)
    
    
