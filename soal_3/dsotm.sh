#!/bin/bash
	echo "bismillahirrahmanirrahim"
	sleep 1
	echo "system initializing..."
	sleep 1
	clear
	echo "processing."
	sleep 0.25
	clear
	echo "processing.."
	sleep 0.5
	clear
	echo "processing..."
	sleep 0.4
	clear
	echo "processing."
	sleep 0.65
	clear
	echo "processing.."
	sleep 0.35
	clear
	echo "processing..."
	sleep 1.2
	clear
	echo "process complete シ"
	sleep 1
	echo "bentar banh, dikit lagi mulai!"
	sleep 1.5


	if [[ "$1" == --play=* ]]; then
	trek="${1#--play=}"

		case "$trek" in
		"Speak to Me")
		clear
		
echo "playing."
sleep 0.65
clear
echo "playing.."
sleep 0.4
clear
echo "playing..."
sleep 1
clear
echo "  ========================"
echo "  Now Playing: Speak to Me"
echo "  ========================"
sleep 2
clear
		
		
		while true
		do
		curl -s "https://www.affirmations.dev" | jq -r '.affirmation'
		sleep 1
		done
		;;
		
		"On the Run")
		clear

echo "playing."
sleep 0.65
clear
echo "playing.."
sleep 0.4
clear
echo "playing..."
sleep 1
clear
echo "  ======================="
echo "  Now Playing: On the Run"
echo "  ======================="
sleep 2
clear

		pnj=50

		for ((i=1; i<=pnj; i++)); do
    		printf "\r[%-${pnj}s] %d%%" $(printf "%0.s/" $(seq 1 $i)) $((i * 100 / pnj))
       		sleep $(awk 'BEGIN{srand(); print 0.1 + rand() * 0.9}')
		done

		echo " | Done!シ|"
		;;

		"Time")
		clear

echo "playing."
sleep 0.65
clear
echo "playing.."
sleep 0.4
clear
echo "playing..."
sleep 1
clear
echo "  ================="
echo "  Now Playing: Time"
echo "  ================="
sleep 2
clear

		
		while true
		do
		echo "======================="
    		date +'    %a %b %e %Y%n        %H:%M:%S'
		echo "======================="
		sleep 1
		tput cuu 4
		done
		;;

		"Money")
		clear

echo "playing."
sleep 0.65
clear
echo "playing.."
sleep 0.4
clear
echo "playing..."
sleep 1
clear
echo "  =================="
echo "  Now Playing: Money"
echo "  =================="
sleep 2
clear

		echo -e "\033[2J\033[?25l"

		R=$(tput lines)
		C=$(tput cols)

		SYMBOLS=(" $" " €" " £" " ¥" " ¢" " ₹" " ₩" " ₿" " ₣")

		while true; do
  		(
    		p=$((RANDOM % C))
    		l=$((RANDOM % R))

    		for ((i=1; i<=R; i++)); do
      		c=${SYMBOLS[RANDOM % ${#SYMBOLS[@]}]}
      
		echo -e "\033[$((i-1));${p}H\033[32m$c"
 		echo -e "\033[$i;${p}H\033[37m$c"

		sleep 0.05

 		if [ $i -ge $l ]; then
 		echo -e "\033[$((i-l));${p}H "
      		fi
    		done

    		for ((i=i-l; i<=R; i++)); do
      		echo -e "\033[$i;${p}H "
     		sleep 0.05
    		done
  		) &

		sleep 0.05
		done


		echo
		;;

		"Brain Damage")
		clear

echo "playing."
sleep 0.65
clear
echo "playing.."
sleep 0.4
clear
echo "playing..."
sleep 1
clear
echo "  ========================="
echo "  Now Playing: Brain Damage"
echo "  ========================="
sleep 2
clear
		
		while true
		do
    		clear
    		echo "=================== Task Manager KW 2.0 ==================="
    		echo "USER         PID %CP %MEM %STIME COMMAND"
    		ps -eo user,pid,%cpu,%mem,stime,comm --sort=-%cpu | awk 'NR<=13'
    		echo "==========================================================="
    		sleep 1
		done


		;;


		*) echo "maaf abangku, trek yang anda input tidak ada dalam daftar ジ"
			echo "sila input trek lain yah シ"
		;;

	esac
	else echo "banh... format inputnya loh salah :("
	fi
