rm GNLtest 2> /dev/null
rm GNLtest_results.txt 2> /dev/null
# 2> silences error message in case of no previous GNLtest and GNLtest_results.txt
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'
# Sets colour for use below, NC being no colour
echo "\n ${RED}Starting TestSideStory.sh ...${NC}"
sleep 1s
echo " ${RED}What buffer size would you like to use for testing?${NC}"
read varbufsize
gcc -Wall -Wextra -Werror -D BUFFER_SIZE=$varbufsize get_next_line.c get_next_line_utils.c test_main.c -o GNLtest
file="GNLtest"
if [ -f "$file" ]
then
	echo " ${RED}TestSideStory.sh is initializing.${NC}"
else
	echo " ${RED}TestSideStory.sh could not find GNLtest. Please edit line 18 of TestSideStory.sh to ensure the compilation command is correct.${NC}"
	exit
fi
# Checks if compilation was succesful and exits function if not
sleep 1s
echo " ${RED}Please type your name below in order to start TestSideStory.${NC}"
read varname
# Asks for user name in order to personalize the testing experience
sleep 0.5
vartime=$(date +%H)
# Gets the time of day from the system in order to give the appropriate greeting
if (("10#$vartime - 8" < "12"))
	then
	varday="Good morning"
elif (("10#$vartime - 8" >= "12" && "10#$vartime - 8" < "18"))
	then
	varday="Good afternoon"
else
	varday="Good evening"
fi
# Woof (or anything else starting with a Ww) is considered the exit condition, as only CATs can use computers
while true; do
    echo " ${RED}$varday $varname. Are you ready to test?${NC}"

	read varanswer

    case $varanswer in
        [Yy]* ) break;;
        [Nn]* ) exit;;
		[Ww]* ) sleep 0.5s
				echo "\n ${BLUE}Woof! Woof!"
				sleep 0.5s
				echo "^..^      /
/_/\_____/
   /\   /|
  /  \ / |${NC}"
				sleep 1s
				echo "\n ${RED}A dog cannot use a computer. TestSideStory.sh will be closed.${NC}"
				exit;;
        * ) echo "${RED}Please answer yes, no or Woof, $varname.${NC}";;
    esac
done
sleep 0.5s
echo "${RED}Alright, then.."
sleep 0.5s
echo "\n██╗     ███████╗████████╗███████╗     ██████╗  ██████╗ ██╗
██║     ██╔════╝╚══██╔══╝██╔════╝    ██╔════╝ ██╔═══██╗██║
██║     █████╗     ██║   ███████╗    ██║  ███╗██║   ██║██║
██║     ██╔══╝     ██║   ╚════██║    ██║   ██║██║   ██║╚═╝
███████╗███████╗   ██║   ███████║    ╚██████╔╝╚██████╔╝██╗
╚══════╝╚══════╝   ╚═╝   ╚══════╝     ╚═════╝  ╚═════╝ ╚═╝
${NC}"
echo "Get Next Line test results produced by $varname using buffer size $varbufsize" >> GNLtest_results.txt
sleep 1s
echo "\n \033[7;32mLEVEL 1 - ONE SMALL LINE FOR MAN\033[0m"
sleep 0.5
./GNLtest ./inc/test-files/oneline
sleep 0.5
while true; do
    echo " ${RED}Is this the correct output?${NC}" 
	read yn
    case $yn in
        [Yy]* ) varstatus="Pass"
				echo "\nTest One Line: $varstatus" >> GNLtest_results.txt
				echo " ${RED}Thanks $varname! On we go.${NC}"
				break;;
        [Nn]* ) varstatus="Fail"
				echo " ${RED}Please describe why the output is wrong.${NC}"
				read varwrongreason
				echo "\nTest One Line: $varstatus" >> GNLtest_results.txt
				echo "Reason: $varwrongreason" >> GNLtest_results.txt
				echo " ${RED}Thanks $varname! On we go.${NC}"
				break;;
		[Ww]* ) sleep 0.5s
				echo "\n ${BLUE}Woof! Woof!"
				sleep 0.5s
				echo "^..^      /
/_/\_____/
   /\   /|
  /  \ / |${NC}"
				sleep 1s
				echo "\n ${RED}This is no time to play fetch! TestSideStory.sh will be closed.${NC}"
				exit;;
        * ) echo "${RED}Please answer yes, no or Woof.${NC}";;
    esac
done
sleep 0.5
echo "\n \033[7;32m LEVEL 1 - MUCH ADO ABOUT NO LINES\033[0m"
sleep 0.5
./GNLtest ./inc/test-files/nothing
sleep 0.5
while true; do
    echo " ${RED}Is this the correct output?${NC}" 
	read yn
    case $yn in
        [Yy]* ) varstatus="Pass"
				echo "\nTest No Line: $varstatus" >> GNLtest_results.txt
				echo " ${RED}Thanks $varname! On we go.${NC}"
				break;;
        [Nn]* ) varstatus="Fail"
				echo " ${RED}Please describe why the output is wrong.${NC}"
				read varwrongreason
				echo "\nTest No Line: $varstatus" >> GNLtest_results.txt
				echo "Reason: $varwrongreason" >> GNLtest_results.txt
				echo " ${RED}Thanks $varname! On we go.${NC}"
				break;;
		[Ww]* ) sleep 0.5s
				echo "\n ${BLUE}Woof! Woof!"
				sleep 0.5s
				echo "^..^      /
/_/\_____/
   /\   /|
  /  \ / |${NC}"
				sleep 1s
				echo "\n ${RED}Bad dog! TestSideStory.sh will be closed.${NC}"
				exit;;
        * ) echo "${RED}Please answer yes, no or Woof.${NC}";;
    esac
done
sleep 0.5
echo "\n \033[7;33mLEVEL 2 - MORE LINES MORE PROBLEMS\033[0m"
sleep 0.5
./GNLtest ./inc/test-files/multiline
sleep 0.5
while true; do
    echo " ${RED}Is this the correct output?${NC}" 
	read yn
    case $yn in
        [Yy]* ) varstatus="Pass"
				echo "\nTest Mulitiple Lines: $varstatus" >> GNLtest_results.txt
				echo " ${RED}Thanks $varname! On we go.${NC}"
				break;;
        [Nn]* ) varstatus="Fail"
				echo " ${RED}Please describe why the output is wrong.${NC}"
				read varwrongreason
				echo "\nTest Mulitiple Lines: $varstatus" >> GNLtest_results.txt
				echo "Reason: $varwrongreason" >> GNLtest_results.txt
				echo " ${RED}Thanks $varname! On we go.${NC}"
				break;;
		[Ww]* ) sleep 0.5s
				echo "\n ${BLUE}Woof! Woof!"
				sleep 0.5s
				echo "^..^      /
/_/\_____/
   /\   /|
  /  \ / |${NC}"
				sleep 1s
				echo "\n ${RED}Give me the tennis ball $varname. TestSideStory.sh will be closed.${NC}"
				exit;;
        * ) echo "${RED}Please answer yes, no or Woof.${NC}";;
    esac
done
sleep 0.5
echo "\n \033[7;33mLEVEL 2 - THE LONGEST LINE\033[0m"
sleep 0.5
./GNLtest ./inc/test-files/longline
sleep 0.5
while true; do
    echo " ${RED}Is this the correct output?${NC}" 
	read yn
    case $yn in
        [Yy]* ) varstatus="Pass"
				echo "\nTest Long Line: $varstatus" >> GNLtest_results.txt
				echo " ${RED}Thanks $varname! On we go.${NC}"
				break;;
        [Nn]* ) varstatus="Fail"
				echo " ${RED}Please describe why the output is wrong.${NC}"
				read varwrongreason
				echo "\nTest Long Line: $varstatus" >> GNLtest_results.txt
				echo "Reason: $varwrongreason" >> GNLtest_results.txt
				echo " ${RED}Thanks $varname! On we go.${NC}"
				break;;
		[Ww]* ) sleep 0.5s
				echo "\n ${BLUE}Woof! Woof!"
				sleep 0.5s
				echo "^..^      /
/_/\_____/
   /\   /|
  /  \ / |${NC}"
				sleep 1s
				echo "\n ${RED}This is not the time for walkies! TestSideStory.sh will be closed.${NC}"
				exit;;
        * ) echo "${RED}Please answer yes, no or Woof.${NC}";;
    esac
done
sleep 0.5
echo "\n${RED}... That was a long line, wasn't it $varname? I'm afraid it will only get worse..${NC}"
sleep 1
echo "\n \033[7;35mLEVEL 3 - LET THERE BE LINES A.K.A THE ENTIRE BIBLE\033[0m"
sleep 1.5
./GNLtest ./inc/test-files/bible
sleep 0.5
while true; do
    echo " ${RED}Is this the correct output?${NC}" 
	read yn
    case $yn in
        [Yy]* ) varstatus="Pass"
				echo "\nTest Enormous File 1: $varstatus" >> GNLtest_results.txt
				echo " ${RED}Thanks $varname! On we go.${NC}"
				break;;
        [Nn]* ) varstatus="Fail"
				echo " ${RED}Please describe why the output is wrong.${NC}"
				read varwrongreason
				echo "\nTest Enormous File 1: $varstatus" >> GNLtest_results.txt
				echo "Reason: $varwrongreason" >> GNLtest_results.txt
				echo " ${RED}Thanks $varname! On we go.${NC}"
				break;;
		[Ww]* ) sleep 0.5s
				echo "\n ${BLUE}Woof! Woof!"
				sleep 0.5s
				echo "^..^      /
/_/\_____/
   /\   /|
  /  \ / |${NC}"
				sleep 1s
				echo "\n ${RED}Stop chasing the CATs! TestSideStory.sh will be closed.${NC}"
				exit;;
        * ) echo "${RED}Please answer yes, no or Woof.${NC}";;
    esac
done
sleep 0.5
echo "\n \033[7;35mLEVEL 3 - WHEREFOR ART THOU ROMEO? A.K.A. THE COMPLETE WORKS OF WILLIAM SHAKESPEARE\033[0m"
sleep 1.5
./GNLtest ./inc/test-files/shakespeare
sleep 0.5
while true; do
    echo " ${RED}Is this the correct output?${NC}" 
	read yn
    case $yn in
        [Yy]* ) varstatus="Pass"
				echo "\nTest Enormous File 2: $varstatus" >> GNLtest_results.txt
				break;;
        [Nn]* ) varstatus="Fail"
				echo " ${RED}Please describe why the output is wrong.${NC}"
				read varwrongreason
				echo "\nTest Enormous File 2: $varstatus" >> GNLtest_results.txt
				echo "Reason: $varwrongreason" >> GNLtest_results.txt
				break;;
		[Ww]* ) sleep 0.5s
				echo "\n ${BLUE}Woof! Woof!"
				sleep 0.5s
				echo "^..^      /
/_/\_____/
   /\   /|
  /  \ / |${NC}"
				sleep 1s
				echo "\n ${RED}No digging holes in the back yard! TestSideStory.sh will be closed.${NC}"
				exit;;
        * ) echo "${RED}Please answer yes, no or Woof.${NC}";;
    esac
done
sleep 0.5
echo "\n ${RED}Well, that was it $varname. Hope you had a good test.${NC}"
echo "\n$varname: Awesome" >> GNLtest_results.txt
while true; do
    echo "\n ${RED}Would you like TestSideStory.sh to show you your results?${NC}"
	read yn
    case $yn in
        [Yy]* ) sleep 1s
				echo "\n ${RED}Alright, please see your results below.${NC}"
				cat	GNLtest_results.txt
				break;;
        [Nn]* ) sleep 1s
				echo " ${RED}TestSideStory.sh didn't want to show them to you anyway, $varname.${NC}"
				break;;
		[Ww]* ) sleep 0.5s
				echo "\n ${BLUE}Woof! Woof!"
				sleep 0.5s
				echo "^..^      /
/_/\_____/
   /\   /|
  /  \ / |${NC}"
				sleep 1s
				echo "\n ${RED}Don't tear up my homework! TestSideStory.sh will be closed.${NC}"
				exit;;
        * ) echo "${RED}Please answer yes, no or Woof.${NC}";;
    esac
done
echo "\n ${RED}Would you like to run TestSideStory.sh again?${NC}"
read varfinalanswer
case $varfinalanswer in
		[Yy]* ) echo "${RED}Booting up Time Machine ...${NC}"
				echo "${RED}__
.-'--'-._
'-O---O--'${NC}"
				chmod +x TestSideStory.sh
				sleep 1s
				exec "./$(basename $0)" && chmod -x TestSideStory.sh && exit;;
		[Nn]* ) echo "${RED}Thank you for using TestSideStory.sh, $varname. The application will be closed.${NC}"
				exit;;
		[Ww]* ) sleep 0.5s
				echo "\n ${BLUE}Woof! Woof!"
				sleep 0.5s
				echo "^..^      /
/_/\_____/
   /\   /|
  /  \ / |${NC}"
				sleep 1s
				echo "\n ${RED}Good dog! TestSideStory.sh will be closed.${NC}"
				exit;;
        * ) echo "${RED}Please answer yes, no or Woof.${NC}";;
    esac
					
