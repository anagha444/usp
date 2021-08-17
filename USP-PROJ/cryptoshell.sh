#!/bin/bash
jp2a --size=60x30 an.png
figlet   -f starwars  "CRYPTOSHELL" | lolcat -f -d 5
echo "NIDHI == ANAGHA == CHIRAG == GNANESH" 
echo "-----------------------------------------------------"
ACTUAL="CRYPTO23##"
read -s -p "Password: " enteredpass
echo " "
printf "\n"
if [ "$enteredpass" == "$ACTUAL" ] 
     then
	 printf "Encrypting zone\n"
	 printf  "Select the Algo\n"
	 printf "1.Normal\n2.AES\n"
	 read ch
	 case $ch in
		 Normal)
			 printf "Normal Buffer ALgorithm\n"
			 printf "1.Encryption\n2.Decryption\n"
			 read ec
			 case $ec in
				 Encryption)
					 printf "enter the Filename to create\n"
					 read fn
					 touch $fn
					 echo""
					if  grep -w -q $fn listoffile.txt; then
						echo "Already encrypted"
					else
					       	printf "Enter the Contents of the file\n"
						read gg
					 	echo $gg > $fn
					 	echo ""
					 	printf "Enter the destination where the encrypted file will be\n"
					 	read dest
					 	gcc encryptfile.c -w  -o E.out && ./E.out $fn  $dest
					 	rm $fn
						echo $dest >> listoffile.txt
					fi
					;;
				 Decryption)
					 printf "Enter the file to be decrypted"
					 read fn
					 echo ""
					 if ! grep -w -q $fn listoffile.txt; then
						 echo "Never Encrypted"
					 else
					 	printf "Enter the Destination "
					 	read dest
					 	gcc decryptfile.c -w -o D.out && ./D.out $fn $dest
						fi;;
				 *)
					 printf "incorrect Operation"
					 esac;;
		AES)
			 printf  "AES Algo\n"
			 printf "1.Encrypt\n2.Decrypt\n"
			 read fv
			 case $fv in
				 Encrypt)
					 printf "Enter the file to be encrypted"
					 read fn
					 if  grep -w -q $fn aes.txt; then
						 echo "already encrypted"
					 else
					 	printf "Enter the contents into the file"
					 	read gg
					 	echo $gg > $fn
					 	gcc aesED.c  -lcrypto -o output && ./output encrypt $fn 
						echo $fn >>aes.txt
					 fi;;
				 Decrypt)
					 printf "Enter the file to be decrypted"
					 read fn
					 if ! grep -w -q $fn aes.txt; then
						 echo "Never encrypted"
					 else
					 	gcc aesED.c -lcrypto -o output && ./output decrypt $fn
						fi;;
				 *)
					 printf "D"
			 esac;;
		 *)
			 printf  "INVALID OPTION\n"
			 ;; 
	 esac
	 printf "\n Execution is Completed  " 
else 
    echo "wrong password ..exiting "
fi
