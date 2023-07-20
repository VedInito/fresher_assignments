#!/bin/sh

echo "Enter your password:"
read -s -p "Password: " Input_Password
echo

Minimum_Password_Length=10
Password_Length=${#Input_Password}

(( Password_Length < Minimum_Password_Length )) && echo "Minimum size should be 10." && exit

Contains_Small_Letters=0
Contains_Capital_Letters=0
Contains_Numbers=0
Contains_Special_Characters=0

[[ $Input_Password =~ [a-z] ]] && Contains_Small_Letters=1
[[ $Input_Password =~ [A-Z] ]] && Contains_Capital_Letters=1
[[ $Input_Password =~ [0-9] ]] && Contains_Numbers=1
[[ $Input_Password =~ [^[:alnum:]] ]] && Contains_Special_Characters=1

Number_Of_Small_Letters_In_Alphabet=26
Number_Of_Capital_Letters_In_Alphabet=26
Number_Of_Digits_In_Base_10=10

Total_Number_Of_Possible_Characters=256
Number_Of_Special_Characters_In_ASCII=$(( Total_Number_Of_Possible_Characters -
    (Number_Of_Small_Letters_In_Alphabet + Number_Of_Capital_Letters_In_Alphabet + Number_Of_Digits_In_Base_10
)))

Number_Of_Choices_For_Each_Characters=$((
  Contains_Small_Letters * Number_Of_Small_Letters_In_Alphabet + 
  Contains_Capital_Letters * Number_Of_Capital_Letters_In_Alphabet + 
  Contains_Numbers * Number_Of_Digits_In_Base_10 + 
  Contains_Special_Characters * Number_Of_Special_Characters_In_ASCII
))


Strong_Password_Length=20
High_Password_Length=16
Medium_Password_Length=12

Strong_Password_Strength=$(echo "$Total_Number_Of_Possible_Characters^$Strong_Password_Length" | bc)
High_Password_Strength=$(echo "$Total_Number_Of_Possible_Characters^$High_Password_Length" | bc)
Medium_Password_Strength=$(echo "$Total_Number_Of_Possible_Characters^$Medium_Password_Length" | bc)

Password_Strength=$(echo "$Number_Of_Choices_For_Each_Characters^$Password_Length" | bc)

Password_Is_Medium=0
Password_Is_Low=0

Password_Is_Strong=0
Password_Is_Strong=$(echo "$Password_Strength > $Strong_Password_Strength" | bc)
(( Password_Is_Strong == 1)) && echo "Password strength is Strong" && exit

Password_Is_High=0
Password_Is_High=$(echo "$Password_Strength > $High_Password_Strength" | bc)
(( Password_Is_High == 1)) && echo "Password strength is High" && exit


Password_Is_Medium=0
Password_Is_Medium=$(echo "$Password_Strength > $Medium_Password_Strength" | bc)
(( Password_Is_Medium == 1)) && echo "Password strength is Medium" && exit

echo "Password Strength is Low"
