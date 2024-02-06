#!/bin/bash
#///////////////////////////DECLARACION DE FUNCIONES
#VARIABLES GLOBALES
CONTR=0
COMIENZO=0
FIN=0
TURNO=0
PUNTOS=0
PUEDE=0
FLAG2=0
POSICION=0
#-----------
JUG11=(  )
JUG12=(  )
JUG21=(  )
JUG22=(  )
JUG31=(  )
JUG32=(  )
JUG41=(  )
JUG42=(  )  	 
#---------
MESA_O=(  )
EXTREMOSUP_O=0
EXTREMOINF_O=0
#---------
MESA_B=(  )
EXTREMOSUP_B=0
EXTREMOINF_B=0
#---------
MESA_E=(  )
EXTREMOSUP_E=0
EXTREMOINF_E=0
#---------
MESA_C=(  )
EXTREMOSUP_C=0
EXTREMOINF_C=0
#---------
CARTAS=0
PALOS=0

POSIBILIDADES=( 13 13 14 )
RANDOMPOSI=0
JUG=3
   	 
#PARA IR ALMACENANDO LAS CARTAS YA ESTABLECIDAS
P1=( 0 )
P2=( "" )

function jugador1 {
	((CONTR++))
   	echo
  	echo -------------TU TURNO-------------
   	echo
   	#EN CASO DE QUE NOS TOQUE COMENZAR-------------
   	if test "$COMIENZO" -eq 1
   	then
   		while test "$FLAG2" -ne 1 ; do
   		VALIDO=0
   			while test "$VALIDO" -eq 0; do
   				echo -n "INTRODUCE EL 5 DE OROS PARA COMENZAR: " 
   				read POSICION
   				if [[ "$POSICION" =~ ^[0-9]+$ ]]
   				then
   					VALIDO=1   	
   				fi
   			done
   		if test "${JUG11[$POSICION-1]}" -eq 5 -a "${JUG12[$POSICION-1]}" = "O"
   		then
   			MESA_O[4]="5O"
   			unset JUG11[$POSICION-1]
   			JUG11=("${JUG11[@]}")
   			unset JUG12[$POSICION-1]
   			JUG12=("${JUG12[@]}")
   			EXTREMOSUP_O=5
   	 		EXTREMOINF_O=5
			FLAG2=1
			COMIENZO=0
		else
			echo
			echo LA CARTA DEBE DE SER OBLIGATORIAMENTE EL 5 DE OROS PARA COMENZAR  
			echo						
  		fi
   		done
   	fi
   	#-----------------------------------------------
   	while test "$FLAG2" -eq 0; do
   		for i in ${!JUG11[*]}; do
   			if test "${JUG12[$i]}" = "O"
   		then
 			if test "${JUG11[$i]}" -eq $((EXTREMOSUP_O+1)) 
   			then
   				PUEDE=1
   				break;
   			elif test "${JUG11[$i]}" -eq $((EXTREMOINF_O-1))
   			then
   				PUEDE=1
   				break;
   			fi
   		elif test "${JUG12[$i]}" = "E"
   		then
 			if test "${JUG11[$i]}" -eq $((EXTREMOSUP_E+1))
   			then
   				PUEDE=1
   				break;
   			elif test "${JUG11[$i]}" -eq $((EXTREMOINF_E-1))
   			then
   				PUEDE=1
   				break;
   			elif test "${JUG11[$i]}" -eq 5
   			then
   				PUEDE=1
   				break;
   			fi	
   		elif test "${JUG12[$i]}" = "B"
   		then
 			if test "${JUG11[$i]}" -eq $((EXTREMOSUP_B+1))
   			then
   				PUEDE=1
   				break;
   			elif test "${JUG11[$i]}" -eq $((EXTREMOINF_B-1))
   			then
   				PUEDE=1
   				break;
   			elif test "${JUG11[$i]}" -eq 5
   			then
   				PUEDE=1
   				break;
   			fi	
   		elif test "${JUG12[$i]}" = "C"
   		then
 			if test "${JUG11[$i]}" -eq $((EXTREMOSUP_C+1))
   			then
   				PUEDE=1
   				break;
   			elif test "${JUG11[$i]}" -eq $((EXTREMOINF_C-1))
   			then
   				PUEDE=1
   				break;
   			elif test "${JUG11[$i]}" -eq 5
   			then
   				PUEDE=1
   				break;
   			fi
   		fi
   		done
   		
   		if test "$PUEDE" -eq 0
   		then
   			 echo
   			 echo EL JUGADOR 1 PASA DE TURNO POR NO TENER CARTAS DISPONIBLES
   			 echo
   			 break;	
   		elif test "$PUEDE" -eq 1
   		then
   			VALIDO=0
   			while test "$VALIDO" -eq 0; do
   				echo -n "Introduce la posicion de la carta a colocar >> "
   				read POSICION
   				if [[ "$POSICION" =~ ^[0-9]+$ ]]
   				then
   					PUEDE=0
   					VALIDO=1   	
   				fi
   			done
   		fi
   		if test "${JUG12[$POSICION-1]}" = "O"
   		then
   			 if test "${JUG11[$POSICION-1]}" -eq $((EXTREMOSUP_O+1))
   			 then
   			 #COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 	if test ${JUG11[$POSICION-1]} -gt 9
   			 	then
   			 		case ${JUG11[$POSICION-1]} in
   			 			10)
   							MESA_O[7]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   			 				;;	
   						11)
   		 					MESA_O[8]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   		 					;;
   			 			12)
   							MESA_O[9]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   		 					;;
   		 				esac
				else
   			 		  MESA_O[${JUG11[$POSICION-1]}-1]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   	 			fi 
 			#------------------------------------------------------------------ 			 		
   			  	unset JUG11[$POSICION-1]
   			  	JUG11=("${JUG11[@]}")
   		 	  	unset JUG12[$POSICION-1]
   			  	JUG12=("${JUG12[@]}")
   			  	FLAG2=1
   			  	((EXTREMOSUP_O++))
   			 elif test "${JUG11[$POSICION-1]}" -eq $((EXTREMOINF_O-1))
   			 then
   			 	MESA_O[${JUG11[$POSICION-1]}-1]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   			 	unset JUG11[$POSICION-1]
   				JUG11=("${JUG11[@]}")
   				unset JUG12[$POSICION-1]
   			 		   JUG12=("${JUG12[@]}")
   			 		   FLAG2=1
   			 		   ((EXTREMOINF_O--))
   			 else
   			 	echo
   			 	echo ESTA CARTA NO SE PUEDE PONER, ELIGE OTRA
   			 	echo
   			 fi
   		#SI LA CARTA ES DE BASTOS
   		elif test "${JUG12[$POSICION-1]}" = "B"
   		then
   			 #SI NO ESTA EL 5 EN LA MESA
   			 if test "${MESA_B[4]}" = "--"
   			 then
   			 	if test "${JUG11[$POSICION-1]}" -eq 5
   			 	then
   		 			EXTREMOSUP_B=5
   					EXTREMOINF_B=5
   			 		MESA_B[4]="5B"
   			 		unset JUG11[$POSICION-1]
   					JUG11=("${JUG11[@]}")
   					unset JUG12[$POSICION-1]
   			 		JUG12=("${JUG12[@]}")
   			 		FLAG2=1
   			 	else
   			 		echo
   			 		echo ESTA CARTA NO SE PUEDE POSICIONAR, ELIGE OTRA
   			 		echo
   			 	fi
   			 #EN CASO DE QUE SI ESTE EL 5
   			 else
   				#SI LA CARTA ES MAYOR QUE EL LIMITE SUPERIOR EN 1 UNIDAD	
   			 	if test "${JUG11[$POSICION-1]}" -eq $((EXTREMOSUP_B+1))
   			 	then
   			 		#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 		if test ${JUG11[$POSICION-1]} -gt 9
   			 		then
   			 			case ${JUG11[$POSICION-1]} in
   		 					10)
   		 						MESA_B[7]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   								;;	
   			 				11)
   			 					MESA_B[8]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   			 					;;
   			 				12)
   								MESA_B[9]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   			 					;;
   						esac
   			 		else
   		 			  MESA_B[${JUG11[$POSICION-1]}-1]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   					fi
   			 		#-------------------------------------------------------------------
   			 			unset JUG11[$POSICION-1]
   						JUG11=("${JUG11[@]}")
   						unset JUG12[$POSICION-1]
   						JUG12=("${JUG12[@]}")
   			 			FLAG2=1
   			 			((EXTREMOSUP_B++))
   		 			#SI LA CARTA ES MENOR QUE EL LIMITE INFERIOR EN 1 UNIDAD
   				elif test "${JUG11[$POSICION-1]}" -eq $((EXTREMOINF_B-1))
 			 	then
   		 			MESA_B[${JUG11[$POSICION-1]}-1]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   		 			unset JUG11[$POSICION-1]
   					JUG11=("${JUG11[@]}")
   					unset JUG12[$POSICION-1]
   			 		JUG12=("${JUG12[@]}")
   			 		FLAG2=1
   			 		((EXTREMOINF_B--))
   		 		else
   					echo
   			 		echo ESTA CARTA NO SE PUEDE POSICIONAR, ELIGE OTRA
   			 		echo
   			 	fi
   			fi
   		 #SI LA CARTA ES DE ESPADAS
   		 elif test "${JUG12[$POSICION-1]}" = "E"
   		 then
   			 if test "${MESA_E[4]}" = "--"
   			 then
   				if test "${JUG11[$POSICION-1]}" -eq 5
   			 	then
   			 		EXTREMOSUP_E=5
   			 		EXTREMOINF_E=5
   			 		MESA_E[4]="5E"
   			 		unset JUG11[$POSICION-1]
   					JUG11=("${JUG11[@]}")
   					unset JUG12[$POSICION-1]
   			 		JUG12=("${JUG12[@]}")
   			 		FLAG2=1
   			 	else
   			 		echo
   			 		echo ESTA CARTA NO SE PUEDE POSICIONAR, ELIGE OTRA
   					echo
   			 	fi
   			 #EN CASO DE QUE SI ESTE EL 5
   			 else
   			 	#SI LA CARTA ES MAYOR QUE EL LIMITE SUPERIOR EN 1 UNIDAD
   			 	if test "${JUG11[$POSICION-1]}" -eq $((EXTREMOSUP_E+1))
   			 	then
   			 		#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 		if test ${JUG11[$POSICION-1]} -gt 9
   			 		then
   			 			case ${JUG11[$POSICION-1]} in
   			 				10)
   			 					MESA_E[7]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   			 					;;	
   			 				11)
   			 					MESA_E[8]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   			 					;;
   		 					12)
   		 						MESA_E[9]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   		 						;;
   		 				esac
   		 			else
   		 			  MESA_E[${JUG11[$POSICION-1]}-1]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   					fi
   		 			#-------------------------------------------------------------------
   		 			unset JUG11[$POSICION-1]
   					JUG11=("${JUG11[@]}")
   					unset JUG12[$POSICION-1]
   		 			JUG12=("${JUG12[@]}")
   		 			FLAG2=1
   	 				((EXTREMOSUP_E++))
   		 		#SI LA CARTA ES MENOR QUE EL LIMITE INFERIOR EN 1 UNIDAD
   		 		elif test "${JUG11[$POSICION-1]}" -eq $((EXTREMOINF_E-1))
   		 		then
   		 			MESA_E[${JUG11[$POSICION-1]}-1]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   		 			unset JUG11[$POSICION-1]
   					JUG11=("${JUG11[@]}")
   					unset JUG12[$POSICION-1]
   		 			JUG12=("${JUG12[@]}")
   		 			FLAG2=1
   		 		  	((EXTREMOINF_E--))
   		 		else
   		 			echo
   		 			echo ESTA CARTA NO SE PUEDE POSICIONAR, ELIGE OTRA
   		 			echo
   		 		fi
   		 	fi
   		 #SI LA CARTA ES DE COPAS
   		 elif test "${JUG12[$POSICION-1]}" = "C"
   		 then
   		 	if test "${MESA_C[4]}" = "--"
   		 	then
   		 		if test "${JUG11[$POSICION-1]}" -eq 5
   		 		then
   		 			EXTREMOSUP_C=5
   		 			EXTREMOINF_C=5
   		 			MESA_C[4]="5C"
   					unset JUG11[$POSICION-1]
   					JUG11=("${JUG11[@]}")
   					unset JUG12[$POSICION-1]
   			 		JUG12=("${JUG12[@]}")
   			 		FLAG2=1
   		 		else
   					echo
   		 			echo ESTA CARTA NO SE PUEDE POSICIONAR, ELIGE OTRA
   		 			echo
   		 		fi
   		 	#EN CASO DE QUE SI ESTE EL 5
   			else
   			 	#SI LA CARTA ES MAYOR QUE EL LIMITE SUPERIOR EN 1 UNIDAD
   			 	if test "${JUG11[$POSICION-1]}" -eq $((EXTREMOSUP_C+1))
   			 	then
   			 		#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 		if test ${JUG11[$POSICION-1]} -gt 9
   			 		then
   			 			case ${JUG11[$POSICION-1]} in
   			 				10)
   			 					MESA_C[7]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   			 					;;	
   			 				11)
   			 					MESA_C[8]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   			 					;;
   			 				12)
   			 					MESA_C[9]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   			 					;;
   			 			esac
   			 		else
   			 		  MESA_C[${JUG11[$POSICION-1]}-1]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   					fi
   		 			#-------------------------------------------------------------------
   		 			unset JUG11[$POSICION-1]
   					JUG11=("${JUG11[@]}")
   					unset JUG12[$POSICION-1]
   		 			JUG12=("${JUG12[@]}")
   		 			FLAG2=1
   					((EXTREMOSUP_C++))
   			 	#SI LA CARTA ES MENOR QUE EL LIMITE INFERIOR EN 1 UNIDAD
   			 	elif test "${JUG11[$POSICION-1]}" -eq $((EXTREMOINF_C-1))
   			 	then
   			 		MESA_C[${JUG11[$POSICION-1]}-1]="${JUG11[$POSICION-1]}${JUG12[$POSICION-1]}"
   			 		unset JUG11[$POSICION-1]
   					JUG11=("${JUG11[@]}")
   					unset JUG12[$POSICION-1]
   			 		JUG12=("${JUG12[@]}")
   			 		FLAG2=1
   			 	  	((EXTREMOINF_C--))
   		 		else
   		 			echo
   		 			echo ESTA CARTA NO SE PUEDE POSICIONAR, ELIGE OTRA
   		 			echo
   		 		fi
   			fi
   		 fi
   	done
}
#-----------------------------------------------------
function jugador2E0 {
	((CONTR++))
   	echo
   	echo -------------TURNO DEL JUGADOR 2-------------
   	echo
   	if test "$COMIENZO" -eq 2
   	then
   		for i in ${!JUG21[*]}; do
   		if test "${JUG21[$i]}" -eq 5 -a "${JUG22[$i]}" = "O"
   		then
   			 MESA_O[4]="5O"
   			 echo EL JUGADOR 2 COLOCA LA CARTA 5 de O
   			 echo
   			 unset JUG21[$i]
   			 JUG21=("${JUG21[@]}")
   			 unset JUG22[$i]
   		 	 JUG22=("${JUG22[@]}")
   		 	 EXTREMOSUP_O=5
   	 		 EXTREMOINF_O=5
			 FLAG2=1
			 COMIENZO=0
			 break;
   		fi
   		done
   	fi
   	while test "$FLAG2" -eq 0; do
   	for i in ${!JUG21[*]}; do
   	if test "${JUG22[$i]}" = "O"
   	then
   		if test "${JUG21[$i]}" -eq $((EXTREMOSUP_O+1))
   		then
   			#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			if test ${JUG21[$i]} -gt 9
   			then
   			case ${JUG21[$i]} in
   			 	10)
   			 		MESA_O[7]="${JUG21[$i]}${JUG22[$i]}"
   			 		;;	
   			 	11)
   			 		MESA_O[8]="${JUG21[$i]}${JUG22[$i]}"
   			 		;;
   			 	12)
   			 		MESA_O[9]="${JUG21[$i]}${JUG22[$i]}"
   			 		;;
   			 esac
   			 else
   			 	MESA_O[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   			 fi
   		#-------------------------------------------------------------------
   			echo -n EL JUGADOR 2 COLOCA LA CARTA
   			echo " ${JUG21[$i]} de ${JUG22[$i]}"
   			echo
   			unset JUG21[$i]
   			JUG21=("${JUG21[@]}")
   			unset JUG22[$i]
   			JUG22=("${JUG22[@]}")
   			FLAG2=1
   			((EXTREMOSUP_O++))
   			break;
   		elif test "${JUG21[$i]}" -eq $((EXTREMOINF_O-1))
   		then
   			MESA_O[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   			echo -n EL JUGADOR 2 COLOCA LA CARTA
   			echo " ${JUG21[$i]} de ${JUG22[$i]}"
   			echo
   			unset JUG21[$i]
   			JUG21=("${JUG21[@]}")
   			unset JUG22[$i]
   			JUG22=("${JUG22[@]}")
   			FLAG2=1
   			((EXTREMOINF_O--))
   			break;
   		fi
   	elif test "${JUG22[$i]}" = "B"
   	then
   		if test "${JUG21[$i]}" -eq 5
   		then
   			MESA_B[4]="5B"
   			echo EL JUGADOR 2 COLOCA LA CARTA 5 de B
   			echo
   			unset JUG21[$i]
   			JUG21=("${JUG21[@]}")
   			unset JUG22[$i]
   			JUG22=("${JUG22[@]}")
   			EXTREMOSUP_B=5
   			EXTREMOINF_B=5
			FLAG2=1
			break;
   		else
   			if test "${JUG21[$i]}" -eq $((EXTREMOSUP_B+1))
   			then
   				#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 		if test ${JUG21[$i]} -gt 9
   		 		then
   		 		case ${JUG21[$i]} in
   		 			10)
   		 				MESA_B[7]="${JUG21[$i]}${JUG22[$i]}"
   		 				;;	
   					11)
   		 				MESA_B[8]="${JUG21[$i]}${JUG22[$i]}"
   		 				;;
   		 			12)
   		 				MESA_B[9]="${JUG21[$i]}${JUG22[$i]}"
   		 				;;
   		 		esac
   		 		else
   		 			 MESA_B[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   		 		fi
   		 	#-------------------------------------------------------------------
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG21[$i]} de ${JUG22[$i]}"
   				echo
   				unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   			 	FLAG2=1
   			 	((EXTREMOSUP_B++))
   			 	break;
   			elif test "${JUG21[$i]}" -eq $((EXTREMOINF_B-1))
   			then
   				MESA_B[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG21[$i]} de ${JUG22[$i]}"
   				echo
   			 	unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   				FLAG2=1
   				((EXTREMOINF_B--))
   				break;  			 					
   			fi
   		fi
   	elif test "${JUG22[$i]}" = "E"
   	then
   		if test "${JUG21[$i]}" -eq 5
   		then
   			MESA_E[4]="5E"
   			echo EL JUGADOR 2 COLOCA LA CARTA 5 de E
   			echo
   			unset JUG21[$i]
   			JUG21=("${JUG21[@]}")
   			unset JUG22[$i]
   			JUG22=("${JUG22[@]}")
   			EXTREMOSUP_E=5
   	 		EXTREMOINF_E=5
			FLAG2=1
			break;
   		else
   			if test "${JUG21[$i]}" -eq $((EXTREMOSUP_E+1))
   			then
   				#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 	if test ${JUG21[$i]} -gt 9
   			 	then
   			 	case ${JUG21[$i]} in
   			 		10)
   			 			MESA_E[7]="${JUG21[$i]}${JUG22[$i]}"
   			 			;;	
   			 		11)
   			 			MESA_E[8]="${JUG21[$i]}${JUG22[$i]}"
   			 			;;
   			 		12)
   			 			MESA_E[9]="${JUG21[$i]}${JUG22[$i]}"
   			 			;;
   			 	esac
   			 	else
   			 		MESA_E[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   			 	fi
   			#-------------------------------------------------------------------
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG21[$i]} de ${JUG22[$i]}"
   				echo
   				unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   			 	FLAG2=1
   			 	((EXTREMOSUP_E++))
   			 	break;
   			elif test "${JUG21[$i]}" -eq $((EXTREMOINF_E-1))
   			then
   				MESA_E[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG21[$i]} de ${JUG22[$i]}"
   				echo
   			 	unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   				JUG22=("${JUG22[@]}")
   		 		FLAG2=1
   		 		((EXTREMOINF_E--))
   		 		break;  			 					
   			fi
   		fi
   	elif test "${JUG22[$i]}" = "C"
   	then
   		if test "${JUG21[$i]}" -eq 5
   		then
   			MESA_C[4]="5C"
   			echo EL JUGADOR 2 COLOCA LA CARTA 5 de C
   			echo
   			unset JUG21[$i]
   			JUG21=("${JUG21[@]}")
   			unset JUG22[$i]
   		 	JUG22=("${JUG22[@]}")
   		 	EXTREMOSUP_C=5
   	 		EXTREMOINF_C=5
			FLAG2=1
			break;
   		else
   			if test "${JUG21[$i]}" -eq $((EXTREMOSUP_C+1))
   			then
   				#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 		if test ${JUG21[$i]} -gt 9
   		 		then
   		 		case ${JUG21[$i]} in
   		 			10)
   		 				MESA_C[7]="${JUG21[$i]}${JUG22[$i]}"
   		 				;;	
   		 			11)
   		 				MESA_C[8]="${JUG21[$i]}${JUG22[$i]}"
   		 				;;
   		 			12)
   		 				MESA_C[9]="${JUG21[$i]}${JUG22[$i]}"
   						;;
   		 		esac
   				else
   		 			MESA_C[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   		 		fi
   		 	#-------------------------------------------------------------------
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG21[$i]} de ${JUG22[$i]}"
   				echo
   		 		unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   		 		JUG22=("${JUG22[@]}")
   		 		FLAG2=1
   	 			((EXTREMOSUP_C++))
   		 		break;
   			elif test "${JUG21[$i]}" -eq $((EXTREMOINF_C-1))
   			then
   				MESA_C[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG21[$i]} de ${JUG22[$i]}"
   				echo
   		 		unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   		 		JUG22=("${JUG22[@]}")
   		 		FLAG2=1
   		 		((EXTREMOINF_C--))
   		 		break;
   			fi
   		fi
  	fi
   		if test "$i" -eq "$((${#JUG21[*]}-1))"
  		then
   			echo -n EL JUGADOR 2 PASA DE  TURNO
  			echo " POR NO TENER CARTAS DISPONIBLES"
   			FLAG2=1 
  		fi 						
   	
   	done				
	done
}

function jugador2E1 {
	((CONTR++))
   	echo
   	echo -------------TURNO DEL JUGADOR 2-------------
   	echo
   	if test "$COMIENZO" -eq 2
   	then
   		for i in ${!JUG21[*]}; do
   		if test "${JUG21[$i]}" -eq 5 -a "${JUG22[$i]}" = "O"
   		then
   			MESA_O[4]="5O"
   			echo EL JUGADOR 2 COLOCA LA CARTA 5 de O
   			echo
   			unset JUG21[$i]
   			JUG21=("${JUG21[@]}")
   			unset JUG22[$i]
   		 	JUG22=("${JUG22[@]}")
   		 	EXTREMOSUP_O=5
   	 		EXTREMOINF_O=5
			FLAG2=1
			COMIENZO=0
			break;
   		fi
   		done
   	fi
   	while test "$FLAG2" -eq 0; do
   	for i in ${!JUG21[*]}; do
   	if test "${JUG21[$i]}" -gt 5
   	then
   		if test "${JUG22[$i]}" = "O"
   		then
   			if test "${JUG21[$i]}" -eq $((EXTREMOSUP_O+1))
   			then
   				#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 	if test ${JUG21[$i]} -gt 9
   			 	then
   			 	case ${JUG21[$i]} in
   			 		10)
   			 			MESA_O[7]="${JUG21[$i]}${JUG22[$i]}"
   			 			;;	
   			 		11)
   			 			MESA_O[8]="${JUG21[$i]}${JUG22[$i]}"
   			 			;;
   			 		12)
   			 			MESA_O[9]="${JUG21[$i]}${JUG22[$i]}"
   			 			;;
   			 	esac
   			 	else
   			 		MESA_O[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   			 	fi
   			#-------------------------------------------------------------------
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG21[$i]} de ${JUG22[$i]}"
   				echo
   				unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   			 	FLAG2=1
   			 	((EXTREMOSUP_O++))
   			 	break;
   			fi
   		elif test "${JUG22[$i]}" = "B"
   		then
   			if test "${JUG21[$i]}" -eq $((EXTREMOSUP_B+1))
   			then
   				#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 		if test ${JUG21[$i]} -gt 9
   		 		then
   		 		case ${JUG21[$i]} in
   		 			10)
   		 				MESA_B[7]="${JUG21[$i]}${JUG22[$i]}"
   		 				;;	
   					11)
   		 				MESA_B[8]="${JUG21[$i]}${JUG22[$i]}"
   		 				;;
   		 			12)
   		 				MESA_B[9]="${JUG21[$i]}${JUG22[$i]}"
   		 				;;
   		 		esac
   		 		else
   		 			  MESA_B[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   		 		fi
   		 	#-------------------------------------------------------------------
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG21[$i]} de ${JUG22[$i]}"
   				echo
   				unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   			 	FLAG2=1
   			 	((EXTREMOSUP_B++))
   			 	break;
   			fi
   		elif test "${JUG22[$i]}" = "E"
   		then
   			if test "${JUG21[$i]}" -eq $((EXTREMOSUP_E+1))
   			then
   				#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 	if test ${JUG21[$i]} -gt 9
   			 	then
   			 	case ${JUG21[$i]} in
   			 		10)
   			 			MESA_E[7]="${JUG21[$i]}${JUG22[$i]}"
   			 			;;	
   			 		11)
   			 			MESA_E[8]="${JUG21[$i]}${JUG22[$i]}"
   			 			;;
   			 		12)
   			 			MESA_E[9]="${JUG21[$i]}${JUG22[$i]}"
   			 			;;
   			 	esac
   			 	else
   			 		MESA_E[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   			 	fi
   			#-------------------------------------------------------------------
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG21[$i]} de ${JUG22[$i]}"
   				echo
   				unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   			 	FLAG2=1
   			 	((EXTREMOSUP_E++))
   			 	break;
   			 fi
   		elif test "${JUG22[$i]}" = "C"
   		then
   			 if test "${JUG21[$i]}" -eq $((EXTREMOSUP_C+1))
   			 then
   				#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 		if test ${JUG21[$i]} -gt 9
   		 		then
   		 		case ${JUG21[$i]} in
   		 			10)
   		 				MESA_C[7]="${JUG21[$i]}${JUG22[$i]}"
   		 				;;	
   		 			11)
   		 				MESA_C[8]="${JUG21[$i]}${JUG22[$i]}"
   		 				;;
   		 			12)
   		 				MESA_C[9]="${JUG21[$i]}${JUG22[$i]}"
   						;;
   		 		esac
   				else
   		 			MESA_C[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   		 		fi
   		 	#-------------------------------------------------------------------
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG21[$i]} de ${JUG22[$i]}"
   				echo
   		 		unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   		 		JUG22=("${JUG22[@]}")
   		 		FLAG2=1
   	 			((EXTREMOSUP_C++))
   		 		break;
   		 	fi
   		fi	
   	fi
   	done
   	if test "$FLAG2" -eq 1
   	then
   		break;
   	fi
   	for i in ${!JUG21[*]}; do
   	if test "${JUG21[$i]}" -le 5
   	then
   		if test "${JUG22[$i]}" = "O"
   		then
   			if test "${JUG21[$i]}" -eq $((EXTREMOINF_O-1))
   			then
   				MESA_O[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG21[$i]} de ${JUG22[$i]}"
   				echo
   			 	unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   			 	FLAG2=1
   			 	((EXTREMOINF_O--))
   			 	break;
   			fi
   		elif test "${JUG22[$i]}" = "B"
   		then
   			if test "${JUG21[$i]}" -eq 5
   			then
   				MESA_B[4]="5B"
   				echo EL JUGADOR 2 COLOCA LA CARTA 5 de B
   				echo
   				unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   				EXTREMOSUP_B=5
   				EXTREMOINF_B=5
				FLAG2=1
				break;
   			else
   				if test "${JUG21[$i]}" -eq $((EXTREMOINF_B-1))
   				then
   					MESA_B[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   					echo -n EL JUGADOR 2 COLOCA LA CARTA
   					echo " ${JUG21[$i]} de ${JUG22[$i]}"
   					echo
   			 		unset JUG21[$i]
   					JUG21=("${JUG21[@]}")
   					unset JUG22[$i]
   			 		JUG22=("${JUG22[@]}")
   					FLAG2=1
   					((EXTREMOINF_B--))
   					break;  			 					
   				fi
   			fi
   		elif test "${JUG22[$i]}" = "E"
   		then
   			if test "${JUG21[$i]}" -eq 5
   			then
   				MESA_E[4]="5E"
   				echo EL JUGADOR 2 COLOCA LA CARTA 5 de E
   				echo
   				unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   				EXTREMOSUP_E=5
   				EXTREMOINF_E=5
				FLAG2=1
				break;
   			else
   				if test "${JUG21[$i]}" -eq $((EXTREMOINF_E-1))
   				then
   					MESA_E[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   					echo -n EL JUGADOR 2 COLOCA LA CARTA
   					echo " ${JUG21[$i]} de ${JUG22[$i]}"
   					echo
   			 		unset JUG21[$i]
   					JUG21=("${JUG21[@]}")
   					unset JUG22[$i]
   			 		JUG22=("${JUG22[@]}")
   					FLAG2=1
   					((EXTREMOINF_E--))
   					break;  			 					
   				fi
   			fi
   		elif test "${JUG22[$i]}" = "C"
   		then
   			if test "${JUG21[$i]}" -eq 5
   			then
   				MESA_C[4]="5C"
   				echo EL JUGADOR 2 COLOCA LA CARTA 5 de C
   				echo
   				unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   				EXTREMOSUP_C=5
   				EXTREMOINF_C=5
				FLAG2=1
				break;
   			else
   				if test "${JUG21[$i]}" -eq $((EXTREMOINF_C-1))
   				then
   					MESA_C[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   					echo -n EL JUGADOR 2 COLOCA LA CARTA
   					echo " ${JUG21[$i]} de ${JUG22[$i]}"
   					echo
   			 		unset JUG21[$i]
   					JUG21=("${JUG21[@]}")
   					unset JUG22[$i]
   			 		JUG22=("${JUG22[@]}")
   					FLAG2=1
   					((EXTREMOINF_C--))
   					break;  			 					
   				fi
   			fi
   		fi 
   	fi	
   	done
   		if test "$FLAG2" -eq 1
   		then
   			break;
   		fi
   		if test "$i" -eq "$((${#JUG21[*]}-1))"
  		then
   			echo -n EL JUGADOR 2 PASA DE  TURNO
  			echo " POR NO TENER CARTAS DISPONIBLES"
   			FLAG2=1 
  		 fi 
	done
}

function jugador2E2 {
	((CONTR++))
   	echo
   	echo -------------TURNO DEL JUGADOR 2-------------
   	echo
   	if test "$COMIENZO" -eq 2
   	then
   		for i in ${!JUG21[*]}; do
   			if test "${JUG21[$i]}" -eq 5 -a "${JUG22[$i]}" = "O"
   			then
   			 	MESA_O[4]="5O"
   			 	echo EL JUGADOR 2 COLOCA LA CARTA 5 de O
   				echo
   			 	unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   		 		JUG22=("${JUG22[@]}")
   		 		EXTREMOSUP_O=5
   	 			EXTREMOINF_O=5
				FLAG2=1
				COMIENZO=0
				break;
   			 fi
   		done
   	fi
   	while test "$FLAG2" -eq 0; do
   	for i in ${!JUG21[*]}; do
   	if test "${JUG21[$i]}" -lt 5
   	then
   		if test "${JUG22[$i]}" = "O"
   		then
   			if test "${JUG21[$i]}" -eq $((EXTREMOINF_O-1))
   			then
   				MESA_O[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG21[$i]} de ${JUG22[$i]}"
   				echo
   			 	unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   			 	FLAG2=1
   			 	((EXTREMOINF_O--))
   			 	break;
   			fi
   		elif test "${JUG22[$i]}" = "B"
   		then
   			if test "${JUG21[$i]}" -eq $((EXTREMOINF_B-1))
   			then
   				MESA_B[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG21[$i]} de ${JUG22[$i]}"
   				echo
   			 	unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   				FLAG2=1
   				((EXTREMOINF_B--))
   				break;  			 					
   			fi
   		elif test "${JUG22[$i]}" = "E"
   		then
   			if test "${JUG21[$i]}" -eq $((EXTREMOINF_E-1))
   			then
   				MESA_E[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG21[$i]} de ${JUG22[$i]}"
   				echo
   			 	unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   				FLAG2=1
   				((EXTREMOINF_E--))
   				break;  			 					
   			fi
   		elif test "${JUG22[$i]}" = "C"
   		then
   			if test "${JUG21[$i]}" -eq $((EXTREMOINF_C-1))
   			then
   				MESA_C[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG21[$i]} de ${JUG22[$i]}"
   				echo
   			 	unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   				FLAG2=1
   				((EXTREMOINF_C--))
   				break;  			 					
   			fi
   		fi
   	fi
   	done
   			 	
   		if test "$FLAG2" -eq 1
   		then
   			break;
   		fi
   				
   	for i in ${!JUG21[*]}; do
   	if test "${JUG21[$i]}" -ge 5
   	then
   		if test "${JUG22[$i]}" = "O"
   		then
   			if test "${JUG21[$i]}" -eq $((EXTREMOSUP_O+1))
   			then
   				#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 	if test ${JUG21[$i]} -gt 9
   			 	then
   			 	case ${JUG21[$i]} in
   			 		10)
   			 			MESA_O[7]="${JUG21[$i]}${JUG22[$i]}"
   			 			;;	
   			 		11)
   			 			MESA_O[8]="${JUG21[$i]}${JUG22[$i]}"
   			 			;;
   			 		12)
   			 			MESA_O[9]="${JUG21[$i]}${JUG22[$i]}"
   			 			;;
   			 	esac
   			 	else
   			 		MESA_O[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   			 	fi
   			 #-------------------------------------------------------------------
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG21[$i]} de ${JUG22[$i]}"
   				echo
   				unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   			 	FLAG2=1
   			 	((EXTREMOSUP_O++))
   			 	break;
   			fi
   		elif test "${JUG22[$i]}" = "B"
   		then
   			if test "${JUG21[$i]}" -eq 5
   			then
   				MESA_B[4]="5B"
   				echo EL JUGADOR 2 COLOCA LA CARTA 5 de B
   				echo
   				unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   				EXTREMOSUP_B=5
   				EXTREMOINF_B=5
				FLAG2=1
				break;
   			else
   				if test "${JUG21[$i]}" -eq $((EXTREMOSUP_B+1))
   				then
   					#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 			if test ${JUG21[$i]} -gt 9
   		 			then
   		 			case ${JUG21[$i]} in
   		 				10)
   		 					MESA_B[7]="${JUG21[$i]}${JUG22[$i]}"
   		 					;;	
   						11)
   		 					MESA_B[8]="${JUG21[$i]}${JUG22[$i]}"
   		 					;;
   		 				12)
   		 					MESA_B[9]="${JUG21[$i]}${JUG22[$i]}"
   		 					;;
   		 			esac
   		 			else
   		 			  	MESA_B[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   		 			fi
   		 		#-------------------------------------------------------------------
   					echo -n EL JUGADOR 2 COLOCA LA CARTA
   					echo " ${JUG21[$i]} de ${JUG22[$i]}"
   					echo
   					unset JUG21[$i]
   					JUG21=("${JUG21[@]}")
   					unset JUG22[$i]
   			 		JUG22=("${JUG22[@]}")
   			 		FLAG2=1
   			 		((EXTREMOSUP_B++))
   			 		break;
   			 	fi
   			fi
   		elif test "${JUG22[$i]}" = "E"
   		then
   			if test "${JUG21[$i]}" -eq 5
   			then
   				MESA_E[4]="5E"
   				echo EL JUGADOR 2 COLOCA LA CARTA 5 de E
   				echo
   				unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   				EXTREMOSUP_E=5
   				EXTREMOINF_E=5
				FLAG2=1
				break;
   			else
   				if test "${JUG21[$i]}" -eq $((EXTREMOSUP_E+1))
   				then
   					#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 		if test ${JUG21[$i]} -gt 9
   			 		then
   			 		case ${JUG21[$i]} in
   			 			10)
   			 				MESA_E[7]="${JUG21[$i]}${JUG22[$i]}"
   			 				;;	
   			 			11)
   			 				MESA_E[8]="${JUG21[$i]}${JUG22[$i]}"
   			 				;;
   			 			12)
   			 				MESA_E[9]="${JUG21[$i]}${JUG22[$i]}"
   			 				;;
   			 		esac
   			 		else
   			 		  	MESA_E[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   			 		fi
   				#-------------------------------------------------------------------
   					echo -n EL JUGADOR 2 COLOCA LA CARTA
   					echo " ${JUG21[$i]} de ${JUG22[$i]}"
   					echo
   					unset JUG21[$i]
   					JUG21=("${JUG21[@]}")
   					unset JUG22[$i]
   			 		JUG22=("${JUG22[@]}")
   			 		FLAG2=1
   			 		((EXTREMOSUP_E++))
   			 		break;
   			 	fi
   			fi
   		elif test "${JUG22[$i]}" = "C"
   		then
   			if test "${JUG21[$i]}" -eq 5
   			then
   				MESA_C[4]="5C"
   				echo EL JUGADOR 2 COLOCA LA CARTA 5 de C
   				echo
   				unset JUG21[$i]
   				JUG21=("${JUG21[@]}")
   				unset JUG22[$i]
   			 	JUG22=("${JUG22[@]}")
   				EXTREMOSUP_C=5
   				EXTREMOINF_C=5
				FLAG2=1
				break;
   			else
   				if test "${JUG21[$i]}" -eq $((EXTREMOSUP_C+1))
   				then
   					#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 			if test ${JUG21[$i]} -gt 9
   		 			then
   		 			case ${JUG21[$i]} in
   		 				10)
   		 					MESA_C[7]="${JUG21[$i]}${JUG22[$i]}"
   		 					;;	
   		 				11)
   		 					MESA_C[8]="${JUG21[$i]}${JUG22[$i]}"
   		 					;;
   		 				12)
   		 					MESA_C[9]="${JUG21[$i]}${JUG22[$i]}"
   							;;
   		 			esac
   					else
   		 			  	MESA_C[${JUG21[$i]}-1]="${JUG21[$i]}${JUG22[$i]}"
   		 			fi
   		 		#-------------------------------------------------------------------
   					echo -n EL JUGADOR 2 COLOCA LA CARTA
   					echo " ${JUG21[$i]} de ${JUG22[$i]}"
   					echo
   		 			unset JUG21[$i]
   					JUG21=("${JUG21[@]}")
   					unset JUG22[$i]
   		 			JUG22=("${JUG22[@]}")
   		 			FLAG2=1
   	 				((EXTREMOSUP_C++))
   		 			break;
   		 		 fi
   			fi
   		fi
   	fi
   	done
   		if test "$FLAG2" -eq 1
   		then
   			break;
   		fi
   			 
   		if test "$i" -eq "$((${#JUG21[*]}-1))"
  		then
   		 	echo -n EL JUGADOR 2 PASA DE  TURNO
  		 	echo " POR NO TENER CARTAS DISPONIBLES"
   		 	FLAG2=1 
  	 	fi 
   	done
}
#-----------------------------------------------------
function jugador3E0 {
	((CONTR++))
   	echo
   	echo -------------TURNO DEL JUGADOR 3-------------
   	echo
   	if test "$COMIENZO" -eq 3
   	then
   		for i in ${!JUG31[*]}; do
   			if test "${JUG31[$i]}" -eq 5 -a "${JUG32[$i]}" = "O"
   			then
   			 	MESA_O[4]="5O"
   			 	echo EL JUGADOR 3 COLOCA LA CARTA 5 de O
   				echo
   			 	unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   		 		JUG32=("${JUG32[@]}")
   		 		EXTREMOSUP_O=5
   	 			EXTREMOINF_O=5
				FLAG2=1
				COMIENZO=0
				break;
   			 fi
   		done
   	fi
   	while test "$FLAG2" -eq 0; do
   	for i in ${!JUG31[*]}; do
   	if test "${JUG32[$i]}" = "O"
   	then
   		if test "${JUG31[$i]}" -eq $((EXTREMOSUP_O+1))
   		then
   			#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			if test ${JUG31[$i]} -gt 9
   			then
   			case ${JUG31[$i]} in
   			 	10)
   			 		MESA_O[7]="${JUG31[$i]}${JUG32[$i]}"
   			 		;;	
   			 	11)
   			 		MESA_O[8]="${JUG31[$i]}${JUG32[$i]}"
   			 		;;
   			 	12)
   			 		MESA_O[9]="${JUG31[$i]}${JUG32[$i]}"
   			 		;;
   			 esac
   			 else
   			 	MESA_O[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   			 fi
   		#-------------------------------------------------------------------
   			echo -n EL JUGADOR 3 COLOCA LA CARTA
   			echo " ${JUG31[$i]} de ${JUG32[$i]}"
   			echo
   			unset JUG31[$i]
   			JUG31=("${JUG31[@]}")
   			unset JUG32[$i]
   			JUG32=("${JUG32[@]}")
   			FLAG2=1
   			((EXTREMOSUP_O++))
   			break;
   		elif test "${JUG31[$i]}" -eq $((EXTREMOINF_O-1))
   		then
   			MESA_O[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   			echo -n EL JUGADOR 3 COLOCA LA CARTA
   			echo " ${JUG31[$i]} de ${JUG32[$i]}"
   			echo
   			unset JUG31[$i]
   			JUG31=("${JUG31[@]}")
   			unset JUG32[$i]
   			JUG32=("${JUG32[@]}")
   			FLAG2=1
   			((EXTREMOINF_O--))
   			break;
   		fi
   	elif test "${JUG32[$i]}" = "B"
   	then
   		if test "${JUG31[$i]}" -eq 5
   		then
   			MESA_B[4]="5B"
   			echo EL JUGADOR 3 COLOCA LA CARTA 5 de B
   			echo
   			unset JUG31[$i]
   			JUG31=("${JUG31[@]}")
   			unset JUG32[$i]
   			JUG32=("${JUG32[@]}")
   			EXTREMOSUP_B=5
   			EXTREMOINF_B=5
			FLAG2=1
			break;
   		else
   			if test "${JUG31[$i]}" -eq $((EXTREMOSUP_B+1))
   			then
   				#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 		if test ${JUG31[$i]} -gt 9
   		 		then
   		 		case ${JUG31[$i]} in
   		 			10)
   		 				MESA_B[7]="${JUG31[$i]}${JUG32[$i]}"
   		 				;;	
   					11)
   		 				MESA_B[8]="${JUG31[$i]}${JUG32[$i]}"
   		 				;;
   		 			12)
   		 				MESA_B[9]="${JUG31[$i]}${JUG32[$i]}"
   		 				;;
   		 		esac
   		 		else
   		 			MESA_B[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   		 		fi
   		 	#-------------------------------------------------------------------
   				echo -n EL JUGADOR 3 COLOCA LA CARTA
   				echo " ${JUG31[$i]} de ${JUG32[$i]}"
   				echo
   				unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   			 	FLAG2=1
   			 	((EXTREMOSUP_B++))
   			 	break;
   			elif test "${JUG31[$i]}" -eq $((EXTREMOINF_B-1))
   			then
   				MESA_B[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   				echo -n EL JUGADOR 3 COLOCA LA CARTA
   				echo " ${JUG31[$i]} de ${JUG32[$i]}"
   				echo
   			 	unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   				FLAG2=1
   				((EXTREMOINF_B--))
   				break;  			 					
   			fi
   		fi
   	elif test "${JUG32[$i]}" = "E"
   	then
   		if test "${JUG31[$i]}" -eq 5
   		then
   			MESA_E[4]="5E"
   			echo EL JUGADOR 3 COLOCA LA CARTA 5 de E
   			echo
   			unset JUG31[$i]
   			JUG31=("${JUG31[@]}")
   			unset JUG32[$i]
   			JUG32=("${JUG32[@]}")
   			EXTREMOSUP_E=5
   	 		EXTREMOINF_E=5
			FLAG2=1
			break;
   		else
   			if test "${JUG31[$i]}" -eq $((EXTREMOSUP_E+1))
   			then
   				#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 	if test ${JUG31[$i]} -gt 9
   			 	then
   			 	case ${JUG31[$i]} in
   			 		10)
   			 			MESA_E[7]="${JUG31[$i]}${JUG32[$i]}"
   			 			;;	
   			 		11)
   			 			MESA_E[8]="${JUG31[$i]}${JUG32[$i]}"
   			 			;;
   			 		12)
   			 			MESA_E[9]="${JUG31[$i]}${JUG32[$i]}"
   			 			;;
   			 	esac
   			 	else
   			 		  MESA_E[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   			 	fi
   			#-------------------------------------------------------------------
   				echo -n EL JUGADOR 3 COLOCA LA CARTA
   				echo " ${JUG31[$i]} de ${JUG32[$i]}"
   				echo
   				unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   			 	FLAG2=1
   			 	((EXTREMOSUP_E++))
   			 	break;
   			elif test "${JUG31[$i]}" -eq $((EXTREMOINF_E-1))
   			then
   				MESA_E[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   				echo -n EL JUGADOR 3 COLOCA LA CARTA
   				echo " ${JUG31[$i]} de ${JUG32[$i]}"
   				echo
   			 	unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   				JUG32=("${JUG32[@]}")
   		 		FLAG2=1
   		 		((EXTREMOINF_E--))
   		 		break;  			 					
   			fi
   		fi
   	elif test "${JUG32[$i]}" = "C"
   	then
   		if test "${JUG31[$i]}" -eq 5
   		then
   			MESA_C[4]="5C"
   			echo EL JUGADOR 3 COLOCA LA CARTA 5 de C
   			echo
   			unset JUG31[$i]
   			JUG31=("${JUG31[@]}")
   			unset JUG32[$i]
   		 	JUG32=("${JUG32[@]}")
   		 	EXTREMOSUP_C=5
   	 		EXTREMOINF_C=5
			FLAG2=1
			break;
   		else
   			if test "${JUG31[$i]}" -eq $((EXTREMOSUP_C+1))
   			then
   				#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 		if test ${JUG31[$i]} -gt 9
   		 		then
   		 		case ${JUG31[$i]} in
   		 			10)
   		 				MESA_C[7]="${JUG31[$i]}${JUG32[$i]}"
   		 				;;	
   		 			11)
   		 				MESA_C[8]="${JUG31[$i]}${JUG32[$i]}"
   		 				;;
   		 			12)
   		 				MESA_C[9]="${JUG31[$i]}${JUG32[$i]}"
   						;;
   		 		esac
   				else
   		 			  MESA_C[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   		 		fi
   		 	#-------------------------------------------------------------------
   				echo -n EL JUGADOR 3 COLOCA LA CARTA
   				echo " ${JUG31[$i]} de ${JUG32[$i]}"
   				echo
   		 		unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   		 		JUG32=("${JUG32[@]}")
   		 		FLAG2=1
   	 			((EXTREMOSUP_C++))
   		 		break;
   			elif test "${JUG31[$i]}" -eq $((EXTREMOINF_C-1))
   			then
   				MESA_C[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   				echo -n EL JUGADOR 3 COLOCA LA CARTA
   				echo " ${JUG31[$i]} de ${JUG32[$i]}"
   				echo
   		 		unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   		 		JUG32=("${JUG32[@]}")
   		 		FLAG2=1
   		 		((EXTREMOINF_C--))
   		 		break;
   			fi
   		fi
  	fi
   		if test "$i" -eq "$((${#JUG31[*]}-1))"
  		then
   		 	echo -n EL JUGADOR 3 PASA DE  TURNO
  		 	echo " POR NO TENER CARTAS DISPONIBLES"
   		 	FLAG2=1 
  	 	 fi 						
   	done				
   	done
}

function jugador3E1 {
	((CONTR++))
   	echo
   	echo -------------TURNO DEL JUGADOR 3-------------
   	echo
   	if test "$COMIENZO" -eq 3
   	then
   		for i in ${!JUG31[*]}; do
   			if test "${JUG31[$i]}" -eq 5 -a "${JUG32[$i]}" = "O"
   			then
   			 	MESA_O[4]="5O"
   			 	echo EL JUGADOR 3 COLOCA LA CARTA 5 de O
   				echo
   			 	unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   		 		JUG32=("${JUG32[@]}")
   		 		EXTREMOSUP_O=5
   	 			EXTREMOINF_O=5
				FLAG2=1
				COMIENZO=0
				break;
   			 fi
   		done
   	fi
   	while test "$FLAG2" -eq 0; do
   	for i in ${!JUG31[*]}; do
   	if test "${JUG31[$i]}" -gt 5
   	then
   		if test "${JUG32[$i]}" = "O"
   		then
   			if test "${JUG31[$i]}" -eq $((EXTREMOSUP_O+1))
   			then
   				#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 	if test ${JUG31[$i]} -gt 9
   			 	then
   			 	case ${JUG31[$i]} in
   			 		10)
   			 			MESA_O[7]="${JUG31[$i]}${JUG32[$i]}"
   			 			;;	
   			 		11)
   			 			MESA_O[8]="${JUG31[$i]}${JUG32[$i]}"
   			 			;;
   			 		12)
   			 			MESA_O[9]="${JUG31[$i]}${JUG32[$i]}"
   			 			;;
   			 	esac
   			 	else
   			 		MESA_O[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   			 	fi
   			#-------------------------------------------------------------------
   				echo -n EL JUGADOR 3 COLOCA LA CARTA
   				echo " ${JUG31[$i]} de ${JUG32[$i]}"
   				echo
   				unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   			 	FLAG2=1
   			 	((EXTREMOSUP_O++))
   			 	break;
   			fi
   		elif test "${JUG32[$i]}" = "B"
   		then
   			if test "${JUG31[$i]}" -eq $((EXTREMOSUP_B+1))
   			then
   				#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 		if test ${JUG31[$i]} -gt 9
   		 		then
   		 		case ${JUG31[$i]} in
   		 			10)
   		 				MESA_B[7]="${JUG31[$i]}${JUG32[$i]}"
   		 				;;	
   					11)
   		 				MESA_B[8]="${JUG31[$i]}${JUG32[$i]}"
   		 				;;
   		 			12)
   		 				MESA_B[9]="${JUG31[$i]}${JUG32[$i]}"
   		 				;;
   		 		esac
   		 		else
   		 			  MESA_B[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   		 		fi
   		 	#-------------------------------------------------------------------
   				echo -n EL JUGADOR 3 COLOCA LA CARTA
   				echo " ${JUG31[$i]} de ${JUG32[$i]}"
   				echo
   				unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   			 	FLAG2=1
   			 	((EXTREMOSUP_B++))
   			 	break;
   			fi
   		elif test "${JUG32[$i]}" = "E"
   		then
   			if test "${JUG31[$i]}" -eq $((EXTREMOSUP_E+1))
   			then
   				#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 	if test ${JUG31[$i]} -gt 9
   			 	then
   			 	case ${JUG31[$i]} in
   			 		10)
   			 			MESA_E[7]="${JUG31[$i]}${JUG32[$i]}"
   			 			;;	
   			 		11)
   			 			MESA_E[8]="${JUG31[$i]}${JUG32[$i]}"
   			 			;;
   			 		12)
   			 			MESA_E[9]="${JUG31[$i]}${JUG32[$i]}"
   			 			;;
   			 	esac
   			 	else
   			 		 MESA_E[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   			 	fi
   			#-------------------------------------------------------------------
   				echo -n EL JUGADOR 3 COLOCA LA CARTA
   				echo " ${JUG31[$i]} de ${JUG32[$i]}"
   				echo
   				unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   			 	FLAG2=1
   			 	((EXTREMOSUP_E++))
   			 	break;
   			 fi
   		elif test "${JUG32[$i]}" = "C"
   		then
   			if test "${JUG31[$i]}" -eq $((EXTREMOSUP_C+1))
   			then
   				#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 		if test ${JUG31[$i]} -gt 9
   		 		then
   		 		case ${JUG31[$i]} in
   		 			10)
   		 				MESA_C[7]="${JUG31[$i]}${JUG32[$i]}"
   		 				;;	
   		 			11)
   		 				MESA_C[8]="${JUG31[$i]}${JUG32[$i]}"
   		 				;;
   		 			12)
   		 				MESA_C[9]="${JUG31[$i]}${JUG32[$i]}"
   						;;
   		 		esac
   				else
   		 			 MESA_C[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   		 		fi
   		 	#-------------------------------------------------------------------
   				echo -n EL JUGADOR 3 COLOCA LA CARTA
   				echo " ${JUG31[$i]} de ${JUG32[$i]}"
   				echo
   		 		unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   		 		JUG32=("${JUG32[@]}")
   		 		FLAG2=1
   	 			((EXTREMOSUP_C++))
   		 		break;
   		 	fi
   		fi	
   	fi
   	done
   		if test "$FLAG2" -eq 1
   		then
   			break;
   		fi
   	for i in ${!JUG31[*]}; do
   	if test "${JUG31[$i]}" -le 5
   	then
   		if test "${JUG32[$i]}" = "O"
   		then
   			if test "${JUG31[$i]}" -eq $((EXTREMOINF_O-1))
   			then
   				MESA_O[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   				echo -n EL JUGADOR 3 COLOCA LA CARTA
   				echo " ${JUG31[$i]} de ${JUG32[$i]}"
   				echo
   			 	unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   			 	FLAG2=1
   			 	((EXTREMOINF_O--))
   			 	break;
   			fi
   		elif test "${JUG32[$i]}" = "B"
   		then
   			if test "${JUG31[$i]}" -eq 5
   			then
   				MESA_B[4]="5B"
   				echo EL JUGADOR 3 COLOCA LA CARTA 5 de B
   				echo
   				unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   				EXTREMOSUP_B=5
   				EXTREMOINF_B=5
				FLAG2=1
				break;
   			else
   				if test "${JUG31[$i]}" -eq $((EXTREMOINF_B-1))
   				then
   					MESA_B[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   					echo -n EL JUGADOR 2 COLOCA LA CARTA
   					echo " ${JUG31[$i]} de ${JUG32[$i]}"
   					echo
   			 		unset JUG31[$i]
   					JUG31=("${JUG31[@]}")
   					unset JUG32[$i]
   			 		JUG32=("${JUG32[@]}")
   					FLAG2=1
   					((EXTREMOINF_B--))
   					break;  			 					
   				fi
   			fi
   		elif test "${JUG32[$i]}" = "E"
   		then
   			if test "${JUG31[$i]}" -eq 5
   			then
   				MESA_E[4]="5E"
   				echo EL JUGADOR 3 COLOCA LA CARTA 5 de E
   				echo
   				unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   				EXTREMOSUP_E=5
   				EXTREMOINF_E=5
				FLAG2=1
				break;
   			else
   				if test "${JUG31[$i]}" -eq $((EXTREMOINF_E-1))
   				then
   					MESA_E[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   					echo -n EL JUGADOR 2 COLOCA LA CARTA
   					echo " ${JUG31[$i]} de ${JUG32[$i]}"
   					echo
   			 		unset JUG31[$i]
   					JUG31=("${JUG31[@]}")
   					unset JUG32[$i]
   			 		JUG32=("${JUG32[@]}")
   					FLAG2=1
   					((EXTREMOINF_E--))
   					break;  			 					
   				fi
   			fi
   		elif test "${JUG32[$i]}" = "C"
   		then
   			if test "${JUG31[$i]}" -eq 5
   			then
   				MESA_C[4]="5C"
   				echo EL JUGADOR 3 COLOCA LA CARTA 5 de C
   				echo
   				unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   				EXTREMOSUP_C=5
   				EXTREMOINF_C=5
				FLAG2=1
				break;
   			else
   				if test "${JUG31[$i]}" -eq $((EXTREMOINF_C-1))
   				then
   					MESA_C[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   					echo -n EL JUGADOR 3 COLOCA LA CARTA
   					echo " ${JUG31[$i]} de ${JUG32[$i]}"
   					echo
   			 		unset JUG31[$i]
   					JUG31=("${JUG31[@]}")
   					unset JUG32[$i]
   			 		JUG32=("${JUG32[@]}")
   					FLAG2=1
   					((EXTREMOINF_C--))
   					break;  			 					
   				fi
   			fi
   		fi 
   	fi	
   	done
   		if test "$FLAG2" -eq 1
   		then
   			break;
   		fi
   		if test "$i" -eq "$((${#JUG31[*]}-1))"
  		then
   		 	echo -n EL JUGADOR 3 PASA DE  TURNO
  		 	echo " POR NO TENER CARTAS DISPONIBLES"
   		 	FLAG2=1 
  	 	fi 
   	done
}

function jugador3E2 {
	((CONTR++))
   	echo
   	echo -------------TURNO DEL JUGADOR 3-------------
   	echo
   	if test "$COMIENZO" -eq 3
   	then
   		for i in ${!JUG31[*]}; do
   			if test "${JUG31[$i]}" -eq 5 -a "${JUG32[$i]}" = "O"
   			 then
   			 	MESA_O[4]="5O"
   			 	echo EL JUGADOR 3 COLOCA LA CARTA 5 de O
   				echo
   			 	unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   		 		JUG32=("${JUG32[@]}")
   		 		EXTREMOSUP_O=5
   	 			EXTREMOINF_O=5
				FLAG2=1
				COMIENZO=0
				break;
   			fi
   		done
   	fi
   	while test "$FLAG2" -eq 0; do
   	for i in ${!JUG31[*]}; do
   	if test "${JUG31[$i]}" -lt 5
   	then
   		if test "${JUG32[$i]}" = "O"
   		then
   			if test "${JUG31[$i]}" -eq $((EXTREMOINF_O-1))
   			then
   				MESA_O[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG31[$i]} de ${JUG32[$i]}"
   				echo
   			 	unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   			 	FLAG2=1
   			 	((EXTREMOINF_O--))
   			 	break;
   			fi
   		elif test "${JUG32[$i]}" = "B"
   		then
   			if test "${JUG31[$i]}" -eq $((EXTREMOINF_B-1))
   			then
   				MESA_B[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   				echo -n EL JUGADOR 2 COLOCA LA CARTA
   				echo " ${JUG31[$i]} de ${JUG32[$i]}"
   				echo
   			 	unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   				FLAG2=1
   				((EXTREMOINF_B--))
   				break;  			 					
   			fi
   		elif test "${JUG32[$i]}" = "E"
   		then
   			if test "${JUG31[$i]}" -eq $((EXTREMOINF_E-1))
   			then
   				MESA_E[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   				echo -n EL JUGADOR 3 COLOCA LA CARTA
   				echo " ${JUG31[$i]} de ${JUG32[$i]}"
   				echo
   			 	unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   				FLAG2=1
   				((EXTREMOINF_E--))
   				break;  			 					
   			fi
   		elif test "${JUG32[$i]}" = "C"
   		then
   			if test "${JUG31[$i]}" -eq $((EXTREMOINF_C-1))
   			then
   				MESA_C[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   				echo -n EL JUGADOR 3 COLOCA LA CARTA
   				echo " ${JUG31[$i]} de ${JUG32[$i]}"
   				echo
   			 	unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   				FLAG2=1
   				((EXTREMOINF_C--))
   				break;  			 					
   			fi
   		fi
   	fi
   	done
   			 	
   		if test "$FLAG2" -eq 1
   		then
   			break;
   		fi
   				
	for i in ${!JUG31[*]}; do
   	if test "${JUG31[$i]}" -ge 5
   	then
   		if test "${JUG32[$i]}" = "O"
   		then
   			if test "${JUG31[$i]}" -eq $((EXTREMOSUP_O+1))
   			then
   				#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 	if test ${JUG31[$i]} -gt 9
   			 	then
   			 	case ${JUG31[$i]} in
   			 		10)
   			 			MESA_O[7]="${JUG31[$i]}${JUG32[$i]}"
   			 			;;	
   			 		11)
   			 			MESA_O[8]="${JUG31[$i]}${JUG32[$i]}"
   			 			;;
   			 		12)
   			 			MESA_O[9]="${JUG31[$i]}${JUG32[$i]}"
   			 			;;
   			 	esac
   			 	else
   			 		 MESA_O[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   			 	fi
   			#-------------------------------------------------------------------
   				echo -n EL JUGADOR 3 COLOCA LA CARTA
   				echo " ${JUG31[$i]} de ${JUG32[$i]}"
   				echo
   				unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   			 	FLAG2=1
   			 	((EXTREMOSUP_O++))
   			 	break;
   			fi
   		elif test "${JUG32[$i]}" = "B"
   		then
   			if test "${JUG31[$i]}" -eq 5
   			then
   				MESA_B[4]="5B"
   				echo EL JUGADOR 3 COLOCA LA CARTA 5 de B
   				echo
   				unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   				EXTREMOSUP_B=5
   				EXTREMOINF_B=5
				FLAG2=1
				break;
   			else
   				if test "${JUG31[$i]}" -eq $((EXTREMOSUP_B+1))
   				then
   					#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 			if test ${JUG31[$i]} -gt 9
   		 			then
   		 			case ${JUG31[$i]} in
   		 				10)
   		 					MESA_B[7]="${JUG31[$i]}${JUG32[$i]}"
   		 					;;	
   						11)
   		 					MESA_B[8]="${JUG31[$i]}${JUG32[$i]}"
   		 					;;
   		 				12)
   		 					MESA_B[9]="${JUG31[$i]}${JUG32[$i]}"
   		 					;;
   		 			esac
   		 			else
   		 			  	MESA_B[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   		 			fi
   		 		#-------------------------------------------------------------------
   					echo -n EL JUGADOR 3 COLOCA LA CARTA
   					echo " ${JUG31[$i]} de ${JUG32[$i]}"
   					echo
   					unset JUG31[$i]
   					JUG31=("${JUG31[@]}")
   					unset JUG32[$i]
   			 		JUG32=("${JUG32[@]}")
   			 		FLAG2=1
   			 		((EXTREMOSUP_B++))
   			 		break;
   			 	fi
   			fi
   		elif test "${JUG32[$i]}" = "E"
   		then
   			if test "${JUG31[$i]}" -eq 5
   			then
   				MESA_E[4]="5E"
   				echo EL JUGADOR 3 COLOCA LA CARTA 5 de E
   				echo
   				unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   				EXTREMOSUP_E=5
   				EXTREMOINF_E=5
				FLAG2=1
				break;
   			else
   				if test "${JUG31[$i]}" -eq $((EXTREMOSUP_E+1))
   				then
   					#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 		if test ${JUG31[$i]} -gt 9
   			 		then
   			 		case ${JUG31[$i]} in
   			 			10)
   			 				MESA_E[7]="${JUG31[$i]}${JUG32[$i]}"
   			 				;;	
   			 			11)
   			 				MESA_E[8]="${JUG31[$i]}${JUG32[$i]}"
   			 				;;
   			 			12)
   			 				MESA_E[9]="${JUG31[$i]}${JUG32[$i]}"
   			 				;;
   			 		esac
   			 		else
   			 		  	MESA_E[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   			 		fi
   				#-------------------------------------------------------------------
   					echo -n EL JUGADOR 3 COLOCA LA CARTA
   					echo " ${JUG31[$i]} de ${JUG32[$i]}"
   					echo
   					unset JUG31[$i]
   					JUG31=("${JUG31[@]}")
   					unset JUG32[$i]
   			 		JUG32=("${JUG32[@]}")
   			 		FLAG2=1
   			 		((EXTREMOSUP_E++))
   			 		break;
   			 	fi
   			fi
   		elif test "${JUG32[$i]}" = "C"
   		then
   			if test "${JUG31[$i]}" -eq 5
   			then
   				MESA_C[4]="5C"
   				echo EL JUGADOR 3 COLOCA LA CARTA 5 de C
   				echo
   				unset JUG31[$i]
   				JUG31=("${JUG31[@]}")
   				unset JUG32[$i]
   			 	JUG32=("${JUG32[@]}")
   				EXTREMOSUP_C=5
   				EXTREMOINF_C=5
				FLAG2=1
				break;
   			else
   				if test "${JUG31[$i]}" -eq $((EXTREMOSUP_C+1))
   				then
   					#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 			if test ${JUG31[$i]} -gt 9
   		 			then
   		 			case ${JUG31[$i]} in
   		 				10)
   		 					MESA_C[7]="${JUG31[$i]}${JUG32[$i]}"
   		 					;;	
   		 				11)
   		 					MESA_C[8]="${JUG31[$i]}${JUG32[$i]}"
   		 					;;
   		 				12)
   		 					MESA_C[9]="${JUG31[$i]}${JUG32[$i]}"
   							;;
   		 			esac
   					else
   		 			  	MESA_C[${JUG31[$i]}-1]="${JUG31[$i]}${JUG32[$i]}"
   		 			fi
   		 		#-------------------------------------------------------------------
   					echo -n EL JUGADOR 3 COLOCA LA CARTA
   					echo " ${JUG31[$i]} de ${JUG32[$i]}"
   					echo
   		 			unset JUG31[$i]
   					JUG31=("${JUG31[@]}")
   					unset JUG32[$i]
   		 			JUG32=("${JUG32[@]}")
   		 			FLAG2=1
   	 				((EXTREMOSUP_C++))
   		 			break;
   		 		fi
   			fi
   		fi
   	fi
   	done
   		if test "$FLAG2" -eq 1
   		then
   			break;
   		fi
   			 
   		if test "$i" -eq "$((${#JUG31[*]}-1))"
  		then
   			echo -n EL JUGADOR 3 PASA DE  TURNO
  			echo " POR NO TENER CARTAS DISPONIBLES"
   			FLAG2=1 
  	 	fi 
   	done
}
#-----------------------------------------------------
function configuracion {
    clear
    OP_CONFIG="0"
    
    while test "$OP_CONFIG" != "V" -a "$OP_CONFIG" != "v"
    do    
   	 clear
   	 echo
   	 echo "------CONFIGURACION ACTUAL------"
   	 cat config.cfg
   	 echo "--------------------------------"
   	 echo
    
   	 echo 'J) CAMBIAR Nº JUGADORES'
   	 echo 'E) CAMBIAR ESTRATEGIA'
   	 echo 'L) CAMBIAR RUTA DEL FICHERO .LOG'
   	 echo 'V) VOLVER'
   	 echo -n 'Introduzca una opcion >> '
   	 read -n1 OP_CONFIG
   	 
   	 case $OP_CONFIG in
   	 
   		 J|j)
   			 echo
   			 TEMP=0
   			 FLAGCONFIG=0
   			 while test "$FLAGCONFIG" -eq 0
   			 do
   			 	VALIDO=0
   			 	while test "$VALIDO" -eq 0; do
   			 		echo
   				 	echo -n "Introduce el numero de jugadores: "
   				 	read -n1 TEMP
   				 	echo
   				 	
   				 	if [[ "$TEMP" =~ ^[0-9]+$ ]]
   				 	then
   				 		VALIDO=1
   				 	fi
   			 	done 
   				 if test "$TEMP" -lt 2
   				 then
   					 echo
   					 echo "El numero de jugadores debe ser mayor o igual a 2"   				 
   				 elif test "$TEMP" -gt 4
   				 then
   					 echo
   					 echo "El numero de jugares debe ser menor o igual que 4"
   				 elif test "$TEMP" -le 4 -o "$TEMP" -ge 2
   				 then
   					 FLAGCONFIG=1
   					 while IFS== read VAR1 VAR2
   					 do
   						 if test "$VAR1" = "JUGADORES"
   						 then
   							 echo JUGADORES="$TEMP" > auxiliar.cfg    
   						 elif test "$VAR1" = "ESTRATEGIA"
   						 then
   							 echo ESTRATEGIA="$VAR2" >> auxiliar.cfg  
   						 elif test "$VAR1" = "LOG"
   						 then
   							 echo LOG="$VAR2" >> auxiliar.cfg  
   						 fi
   					 done < config.cfg
   					 chmod 755 auxiliar.cfg
   					 cp auxiliar.cfg config.cfg
   					 rm auxiliar.cfg
   				 else
   					 echo
   					 echo "CARACTER NO VALIDO"
   					 echo
   				 fi
   			 done
   			 echo
   			 ;;
   			 
   		 E|e)
   			 echo
   			 TEMP=0
   			 FLAGCONFIG=0
   			 while test "$FLAGCONFIG" -eq 0
   			 do
   				VALIDO=0
   			 	while test "$VALIDO" -eq 0; do
   			 		echo
   				 	echo -n "Introduce la estrategia a implementar: "
   				 	read -n1 TEMP
   				 	echo
   				 	
   				 	if [[ "$TEMP" =~ ^[0-9]+$ ]]
   				 	then
   				 		VALIDO=1
   				 	fi
   			 	done
   				 if test "$TEMP" -lt 0
   				 then
   					 echo
   					 echo "El numero de estrategia debe ser mayor o igual a 0"
   				 elif test "$TEMP" -gt 2
   				 then
   					 echo
   					 echo "El numero de estrategia debe ser menor o igual que 2"
   				 elif test "$TEMP" -ge 0 -o "$TEMP" -le 2
   				 then
   					 FLAGCONFIG=1
   					 while IFS== read VAR1 VAR2
   					 do
   						 if test "$VAR1" = "JUGADORES"
   						 then
   							 echo JUGADORES="$VAR2" > auxiliar.cfg    
   						 elif test "$VAR1" = "ESTRATEGIA"
   						 then
   							 echo ESTRATEGIA="$TEMP" >> auxiliar.cfg  

   						 elif test "$VAR1" = "LOG"
   						 then
   							 echo LOG="$VAR2" >> auxiliar.cfg  
   						 fi
   					 done < config.cfg
   					 chmod 755 auxiliar.cfg
   					 cp auxiliar.cfg config.cfg
   					 rm auxiliar.cfg
   				 else
   					 echo
   					 echo "CARACTER NO VALIDO"
   					 echo
   				 fi
   			 done
   			 echo
   			 ;;
   		 L|l)    
   			 echo   			 
   			 TEMP="0"
   			 FLAGCONFIG=0
   			 while test "$FLAGCONFIG" -eq 0
   			 do
   				 echo
   				 echo -n "Introduce la ruta del fichero.log: "
   				 read TEMP
   				 if test ! -f "$TEMP"
   				 then
   					 echo
   					 echo "LA RUTA NO EXISTE"
   					 echo
   				 elif test ! -r "$TEMP"
   				 then
   					 echo
   					 echo "EL FICHERO NO TIENE PERMISOS DE LECTURA"
   					 echo
   				 elif test ! -w "$TEMP"
   				 then
   					 echo
   					 echo "EL FICHERO NO TIENE PERMISOS DE ESCRITURA"
   					 echo
   				 else
   					 FLAGCONFIG=1
   					 while IFS== read VAR1 VAR2
   					 do
   						 if test "$VAR1" = "JUGADORES"
   						 then
   							 echo JUGADORES="$VAR2" > auxiliar.cfg    
   						 elif test "$VAR1" = "ESTRATEGIA"
   						 then
   							 echo ESTRATEGIA="$VAR2" >> auxiliar.cfg  
   						 elif test "$VAR1" = "LOG"
   						 then
   							 echo LOG="$TEMP" >> auxiliar.cfg  
   						 fi
   					 done < config.cfg
   					 chmod 755 auxiliar.cfg
   					 cp auxiliar.cfg config.cfg
   					 rm auxiliar.cfg
   				 fi
   			 done
   			 echo
   			 ;;

   		 V|v)
   			 echo
   			 echo "-------VOLVIENDO AL MENU PRINCIPAL-------"
   			 echo
   			 return
   			 ;;
   		 *)    
   			 echo
   			 echo "-------ERROR, OPCION NO VALIDA-------"   	 
   			 echo
   			 sleep 1
   			 ;;
   	 esac   	 
    done
    
    
    
}

function estadisticas {
	clear
	echo ------------------------------------------
	echo -----------ESTADISTICAS TOTALES-----------
	echo ------------------------------------------
	echo
	#PARA CONTAR EL NUMERO TOTAL DE PARTIDAS
	TOTAL_PARTIDAS=0
	while IFS=\n read; do
   		(( TOTAL_PARTIDAS++ ))	
	done < "$RUTA"	
	echo El total de partidas es:" $TOTAL_PARTIDAS"
	echo ------------------------------------------------
	#----------------------------------------
	TIEMPOT_INV=0
	TIEMPO_MEDIO=0
	MEDIAP_GANADOR=0
	
	CONTA=0
	GANADASA=0
	CONTB=0
	GANADASB=0
	CONTC=0
	GANADASC=0
	CONTD=0
	GANADASD=0
	
   	while IFS='|' read VAR1 VAR2 VAR3 VAR4 VAR5 VAR6 VAR7 VAR8; do
   	
   		let TIEMPOT_INV=TIEMPOT_INV+"$VAR4"
   		let MEDIAP_GANADOR=MEDIAP_GANADOR+"$VAR7"
   		
   		if test "$VAR6" = 1
   		then
   			(( GANADASA++ ))
   		elif test "$VAR6" = 2
   		then
   			(( GANADASB++ ))
   		elif test "$VAR6" = 3
   		then
   			(( GANADASC++ ))
   		elif test "$VAR6" = 4
   		then
   			(( GANADASD++ ))
   		fi
   		
   		echo "$VAR8" > auxiliar
   		chmod 755 auxiliar
   		
   		while IFS='-' read VAR1 VAR2 VAR3 VAR4; do
   			if test "$VAR1" != "*"
   			then
   				(( CONTA++ ))
   			fi
   			
   			if test "$VAR2" != "*"
   			then
   				(( CONTB++ ))
   			fi
   			
   			if test "$VAR3" != "*"
   			then
   				(( CONTC++ ))
   			fi
   			
   			if test "$VAR4" != "*"
   			then
   				(( CONTD++ ))
   			fi
   			
		done < auxiliar
		
	done < "$RUTA"	
	
	rm auxiliar
   	
   	echo -n 'Media de tiempo de todas las partidas en segundos: '
   	echo "scale=2; $TIEMPOT_INV/$TOTAL_PARTIDAS" | bc
   	echo ------------------------------------------------
   	echo Tiempo total invertido en segundos: " $TIEMPOT_INV"
   	echo ------------------------------------------------
   	echo -n 'Media de puntos del ganador: '
   	echo "scale=2; $MEDIAP_GANADOR/$TOTAL_PARTIDAS" | bc
   	echo ------------------------------------------------
   	echo -n 'Porcentaje de partidas ganadas por el jugador 1: '
   	echo "scale=2; $GANADASA*100/$CONTA" | bc
   	echo ------------------------------------------------
   	echo -n 'Porcentaje de partidas ganadas por el jugador 2: '
   	echo "scale=2; $GANADASB*100/$CONTB" | bc
   	echo ------------------------------------------------
   	echo -n 'Porcentaje de partidas ganadas por el jugador 3: '
   	if test "$CONTC" -ne 0
   	then
   		echo "scale=2; $GANADASC*100/$CONTC" | bc
   	else
   		echo "NO HAY PARTIDAS DISPONIBLES PARA CALCULAR LOS DATOS"
   	fi	
   	echo ------------------------------------------------
   	echo -n 'Porcentaje de partidas ganadas por el jugador 4: '
   	if test "$CONTD" -ne 0
   	then
   		echo "scale=2; $GANADASD*100/$CONTD" | bc
   	else
   		echo "NO HAY PARTIDAS DISPONIBLES PARA CALCULAR LOS DATOS"
   	fi	
   	echo ------------------------------------------------
   	echo
	
}

function clasificacion {
	clear
	MENOR_TIEMPO=100000000000
	MAYOR_TIEMPO=0
	MENOR_RONDAS=100000000000
	MAYOR_RONDAS=0
	MAYOR_PUNTOS_GAN=0
	MAYOR_CARTAS=0
	
	echo
	echo -------------------------------------------
	echo ---------------CLASIFICACION---------------
	echo -------------------------------------------
	echo
	
   	while IFS='|' read VAR1 VAR2 VAR3 VAR4 VAR5 VAR6 VAR7 VAR8; do
   		#PARA LA DURACION DE LA PARTIDA
   		#-----------------------------
   		if test "$VAR4" -lt "$MENOR_TIEMPO"
   		then
   			MENOR_TIEMPO="$VAR4"
   		fi
   		if test "$VAR4" -gt "$MAYOR_TIEMPO"
   		then
   			MAYOR_TIEMPO="$VAR4"
   		fi
   		
   		#PARA LAS RONDAS DE LA PARTIDA
   		#-----------------------------
   		if test "$VAR5" -lt "$MENOR_RONDAS"
   		then
   			MENOR_RONDAS="$VAR5"
   		fi
   		if test "$VAR5" -gt "$MAYOR_RONDAS"
   		then
   			MAYOR_RONDAS="$VAR5"
   		fi
   		
   		#MAYOR NUMERO DE PUNTOS DEL GANADOR
   		#----------------------------------
   		if test "$VAR7" -gt "$MAYOR_PUNTOS_GAN"
   		then
   			MAYOR_PUNTOS_GAN="$VAR7"
   		fi
   		
   		#PARA VER EL JUGADOR CON MAYOR NUMERO DE CARTAS
   		#-----------------------------
   		echo "$VAR8" >> auxiliar
   		chmod 755 auxiliar
   		
   		while IFS='-' read VAR1 VAR2 VAR3 VAR4; do
   			if test "$VAR1" != "*"
   			then
   				if test "$VAR1" -gt "$MAYOR_CARTAS"
   				then
   					MAYOR_CARTAS="$VAR1"
   				fi
   			fi
   			
   			if test "$VAR2" != "*"
   			then
   				if test "$VAR2" -gt "$MAYOR_CARTAS"
   				then
   					MAYOR_CARTAS="$VAR2"
   				fi
   			fi
   			
   			if test "$VAR3" != "*"
   			then
   				if test "$VAR3" -gt "$MAYOR_CARTAS"
   				then
   					MAYOR_CARTAS="$VAR3"
   				fi
   			fi
   			
   			if test "$VAR4" != "*"
   			then
   				if test "$VAR4" -gt "$MAYOR_CARTAS"
   				then
   					MAYOR_CARTAS="$VAR4"
   				fi
   			fi
   			
		done < auxiliar
   	done < "$RUTA"
   	rm auxiliar
   	while IFS='|' read VAR1 VAR2 VAR3 VAR4 VAR5 VAR6 VAR7 VAR8; do
   		#PARA LA DURACION DE LA PARTIDA
   		if test "$VAR4" -eq "$MENOR_TIEMPO"
   		then
   			echo -n LA PARTIDA DE MENOR DURACION ES:
   			echo " $VAR1|""$VAR2|""$VAR3|""$VAR4|""$VAR5|""$VAR6|""$VAR7|""$VAR8"
   			echo ------------------------------------------------
   			break;
   		fi
   	done < "$RUTA"
   	while IFS='|' read VAR1 VAR2 VAR3 VAR4 VAR5 VAR6 VAR7 VAR8; do	
   		if test "$VAR4" -eq "$MAYOR_TIEMPO"
   		then
   			echo -n LA PARTIDA DE MAYOR DURACION ES:
   			echo " $VAR1|""$VAR2|""$VAR3|""$VAR4|""$VAR5|""$VAR6|""$VAR7|""$VAR8"
   			echo ------------------------------------------------
   			break;
   		fi
   	done < "$RUTA"
   	#-------------------------------------------------------------------------------------------
   	while IFS='|' read VAR1 VAR2 VAR3 VAR4 VAR5 VAR6 VAR7 VAR8; do
   		#PARA LAS RONDAS DE LA PARTIDA
   		if test "$VAR5" -eq "$MENOR_RONDAS"
   		then
   			echo -n LA PARTIDA CON MENOR NUMERO DE RONDAS ES:
   			echo " $VAR1|""$VAR2|""$VAR3|""$VAR4|""$VAR5|""$VAR6|""$VAR7|""$VAR8"
   			echo ------------------------------------------------
   			break;
   		fi
   	done < "$RUTA"
   	while IFS='|' read VAR1 VAR2 VAR3 VAR4 VAR5 VAR6 VAR7 VAR8; do	
   		if test "$VAR5" -eq "$MAYOR_RONDAS"
   		then
   			echo -n LA PARTIDA CON MAYOR NUMERO DE RONDAS ES:
   			echo " $VAR1|""$VAR2|""$VAR3|""$VAR4|""$VAR5|""$VAR6|""$VAR7|""$VAR8"
   			echo ------------------------------------------------
   			break;
   		fi
   	done < "$RUTA"
   	#-------------------------------------------------------------------------------------------
   	while IFS='|' read VAR1 VAR2 VAR3 VAR4 VAR5 VAR6 VAR7 VAR8; do
   		#MAYOR NUMERO DE PUNTOS DEL GANADOR
   		if test "$VAR7" -eq "$MAYOR_PUNTOS_GAN"
   		then
   			echo -n LA PARTIDA CON MAYOR NUMERO DE PUNTOS DEL GANADOR ES:
   			echo " $VAR1|""$VAR2|""$VAR3|""$VAR4|""$VAR5|""$VAR6|""$VAR7|""$VAR8"
   			echo ------------------------------------------------
   			break;
   		fi
   		
   	done < "$RUTA"
   	#-------------------------------------------------------------------------------------------
   	
   	FLAG_C=0
   	while IFS='|' read V1 V2 V3 V4 V5 V6 V7 V8; do
   		#JUGADOR CON MAYOR NUMERO DE CARTAS 
   		echo "$V8" > auxiliar
   		chmod 755 auxiliar  		
   		while IFS='-' read VAR1 VAR2 VAR3 VAR4; do
   			if test "$VAR1" != "*"
   			then
   				if test "$VAR1" -eq "$MAYOR_CARTAS"
   				then
   					FLAG_C=1
   					break;
   				fi
   			fi
   			
   			if test "$VAR2" != "*"
   			then
   				if test "$VAR2" -eq "$MAYOR_CARTAS"
   				then
   					FLAG_C=1
   					break;
   				fi
   			fi
   			
   			if test "$VAR3" != "*"
   			then
   				if test "$VAR3" -eq "$MAYOR_CARTAS"
   				then
   					FLAG_C=1
   					break;
   				fi
   			fi
   			
   			if test "$VAR4" != "*"
   			then
   				if test "$VAR4" -eq "$MAYOR_CARTAS"
   				then
   					FLAG_C=1
   					break;
   				fi
   			fi
		done < auxiliar
		
		if test "$FLAG_C" -eq 1
		then
			echo -n LA PARTIDA EN LA QUE UN JUGADOR TIENE MAYOR NUMERO DE CARTAS ES: 
			echo " $V1|""$V2|""$V3|""$V4|""$V5|""$V6|""$V7|""$V8"
   			echo ------------------------------------------------
   			break;
   			
		fi
   	done < "$RUTA"
   	rm auxiliar
}

function jugar {
    clear
    echo "-----------------------------------"
    echo "           	5ILLO           	"
    echo "-----------------------------------"
    echo
    echo "REGLAS DEL JUEGO: "
    echo "    -El jugador que posea el 5 de oros es quien dará comienzo al juego"
    echo -n  "    -Por turnos, los jugadores colocarán la carta siguiente a la que se encuentra "
    echo "en la mesa,  ya sea por arriba o por abajo"
    echo "   	 Ej: Si en la mesa se encuentra el 5 de oros, se debe colocar el 4 o el 6 de oros"
    echo -n "    -Si el jugador posee un 5 de otro palo, se deberá colocar al lado de los "
    echo "otros 5 que ya están sobre la mesa para abrir ese palo"
    echo "    -Si el jugador no posee ninguna carta que se pueda colocar, pasará el turno al siguiente"
    echo "    -Gana el jugador que se quede sin cartas primero"
    echo
    echo -n '"Pulse una tecla para continuar >> "'
    read
    clear
    
    MAZO1=( 1 1 1 1 2 2 2 2 3 3 3 3 4 4 4 4 5 5 5 5 6 6 6 6 7 7 7 7 10 10 10 10 11 11 11 11 12 12 12 12 )
    MAZO2=("O" "B" "E" "C")
    
    if test "$JUGADORES " -eq 2
    then
   	 #-------------------------------ASIGNACION DE CARTAS    
   	 JUG11=( 0 )
   	 JUG12=( "" )
   	 JUG21=( 0 )
   	 JUG22=( "" )
   	 
   	 CONTJ1=0
   	 CONTJ2=0
   	 RANDOMC=0
   	 RANDOMP=0
   	 CONT=0
   	 
   	 CARTAS=40
   	 PALOS=4
   	 
   	 #PARA IR ALMACENANDO LAS CARTAS YA ESTABLECIDAS
   	 P1=( 0 )
   	 P2=( "" )
   	 
   	 #PARA ASIGNAR CARTAS AL JUGADOR 1
   	 while test "$CONTJ1" -lt 20
   	 do    
   		 FLAG=0
   		 RANDOMC=$(( RANDOM%CARTAS ))
   		 RANDOMP=$(( RANDOM%PALOS ))

   		 JUG11[$CONTJ1]=${MAZO1[$RANDOMC]}
   		 JUG12[$CONTJ1]=${MAZO2[$RANDOMP]}
   		 
   		 VALOR1=${JUG11[$CONTJ1]}
   		 VALOR2="${JUG12[$CONTJ1]}"
   							 
   		 ((CONTJ1++))
   		 ((CARTAS--))
   		 
   		 for i in ${!P1[@]}
   		 do
   			 if [ "${P1[$i]}" -eq "$VALOR1" ]
   			 then
   				 if [ "${P2[$i]}" = "$VALOR2" ]
   				 then
   					 FLAG=1
   					 break;
   				 fi   	 
   			 fi
   		 done
   		 
   		 if test "$FLAG" -eq 0
   		 then
   			 unset MAZO1[$RANDOMC]
   			 MAZO1=("${MAZO1[@]}")
   			 P1[$CONT]=${JUG11[${#JUG11[*]}-1]}
   			 P2[$CONT]=${JUG12[${#JUG12[*]}-1]}
   			 ((CONT++))
   		 elif test "$FLAG" -eq 1
   		 then
   			 unset JUG11[${#JUG11[*]}-1]
   			 JUG11=("${JUG11[@]}")
   			 unset JUG12[${#JUG12[*]}-1]
   			 JUG12=("${JUG12[@]}")
   			 
   			 CONTJ1=$((CONTJ1-1))
   			 ((CARTAS++))
   			 
   		 fi
   	 done
   	 
   	 #PARA ASIGNAR CARTAS AL JUGADOR 2
   	 while test "$CONTJ2" -lt 20
   	 do    
   		 FLAG=0
   		 RANDOMC=$(( RANDOM%CARTAS ))
   		 RANDOMP=$(( RANDOM%PALOS ))

   		 JUG21[$CONTJ2]=${MAZO1[$RANDOMC]}
   		 JUG22[$CONTJ2]=${MAZO2[$RANDOMP]}
   		 
   		 VALOR1=${JUG21[$CONTJ2]}
   		 VALOR2="${JUG22[$CONTJ2]}"
   							 
   		 ((CONTJ2++))
   		 ((CONTJ1++))
   		 ((CARTAS--))
   		 
   		 for i in ${!P1[@]}
   		 do
   			 if test "${P1[$i]}" -eq "$VALOR1"
   			 then
   				 if [ "${P2[$i]}" = "$VALOR2" ]
   				 then
   					 FLAG=1
   					 break;
   				 fi   	 
   			 fi
   		 done
   		 
   		 if test "$FLAG" -eq 0
   		 then
   			 unset MAZO1[$RANDOMC]
   			 MAZO1=("${MAZO1[@]}")
   			 P1[$CONT]=${JUG21[${#JUG21[*]}-1]}
   			 P2[$CONT]=${JUG22[${#JUG22[*]}-1]}
   			 ((CONT++))
   		 elif test "$FLAG" -eq 1
   		 then
   			 unset JUG21[${#JUG21[*]}-1]
   			 JUG21=("${JUG21[@]}")
   			 unset JUG22[${#JUG22[*]}-1]
   			 JUG22=("${JUG22[@]}")
   			 
   			 CONTJ2=$((CONTJ2-1))
   			 ((CARTAS++))
   			 
   		 fi
   	 done
   	 #------------------------------------------------------------
   	 #----------------------CREACION DEL JUEGO--------------------
   	 
   	 MESA_O=( "--" "--" "--" "--" "--" "--" "--" "--" "--" "--" )
   	 MESA_B=( "--" "--" "--" "--" "--" "--" "--" "--" "--" "--" )
   	 MESA_E=( "--" "--" "--" "--" "--" "--" "--" "--" "--" "--" )
   	 MESA_C=( "--" "--" "--" "--" "--" "--" "--" "--" "--" "--" )
   	 
   	 EXTREMOSUP_O=-1
   	 EXTREMOINF_O=-1
   	 
   	 EXTREMOSUP_B=-1
   	 EXTREMOINF_B=-1
   	 
   	 EXTREMOSUP_E=-1
   	 EXTREMOINF_E=-1
   	 
   	 EXTREMOSUP_C=-1
   	 EXTREMOINF_C=-1

   	 #------------------------------------------------------------
   	 FIN=0
   	 TURNO=0
   	 FLAG2=0
   	 COMIENZO=0
   	 PUNTOS=0
   	 for i in ${!JUG11[*]}
   	 do
   		 if test "${JUG11[$i]}" -eq 5 -a "${JUG12[$i]}" = O
   		 then
   			 TURNO=1
   			 COMIENZO=1
   			 break;
   		 elif test "${JUG21[$i]}" -eq 5 -a "${JUG22[$i]}" = O
   		 then
   			 TURNO=2
   			 COMIENZO=2
   			 break;
   		 fi
   	 done
   	 #------------------------------------------------------------
   	 CONTR=1
   	 POSICION=0
   	 GANADOR=0
   	 INICIO=0
	 let INICIO=INICIO+$(date +"10#%H")*3600+$(date +"10#%M")*60+$(date +"10#%S")
   	 if test "$ESTRATEGIA" -eq 0
   	 then
   	 #----------------------------------------------------------
   	 while test "$FIN" -ne 1
   	 do
   	 	FLAG2=0
   	 	echo ---------------------------------
   	 	echo "RONDA:  $CONTR"
   	 	echo ---------------------------------
   	 	echo "TU MANO: "
   	 	for i in ${!JUG11[*]}
   	 	do
   			echo -n " $((i+1))". "${JUG11[$i]}""${JUG12[$i]}|"
   	 	done
   	 	echo
   	 	echo 
   	
   	 	echo "MANO DEL JUGADOR 2"
   	 	for i in ${!JUG21[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG21[$i]}""${JUG22[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   		 
   	 	echo "MESA:"
   	 	echo "${MESA_O[*]}"
   	 	echo "${MESA_B[*]}"
   	  	echo "${MESA_E[*]}"
   		echo "${MESA_C[*]}"
   	 	echo
   	 	echo
   		 	
   	 	if test "$EXTREMOSUP_O" -eq 7
   	 	then
   	 		let EXTREMOSUP_O=EXTREMOSUP_O+2
   	 	elif test "$EXTREMOSUP_B" -eq 7
   	 	then
   	 		let EXTREMOSUP_B=EXTREMOSUP_B+2
   	 	elif test "$EXTREMOSUP_E" -eq 7
   	 	then
   	 		let EXTREMOSUP_E=EXTREMOSUP_E+2
   	 	elif test "$EXTREMOSUP_C" -eq 7
   	 	then
   			let EXTREMOSUP_C=EXTREMOSUP_C+2
   		fi
   		 	
   		if test "$TURNO" -eq 1
   		then
   		 	jugador1
   	 	elif test "$TURNO" -eq 2
   	 	then
   			jugador2E0
   	 	fi
   	 	#-----------------------------------
   	 	#CAMBIO DE TURNO--------------------
   	 	if test "$TURNO" -eq 1; then
   		 	TURNO=2
   		elif test "$TURNO" -eq 2; then
   			TURNO=1
   		fi
   			
   		echo --------------------------------------
   		echo
   			
   		if test "${#JUG11[*]}" -eq 0
   		then
   			GANADOR=1
   			FIN=1			
   			break;
   		elif test "${#JUG21[*]}" -eq 0
   		then
   			GANADOR=2
   			FIN=1
   			break;
   		fi
   	 done
   	 #------------------------------------------------------------------------
   		 FINAL=0
	 	 let FINAL=FINAL+$(date +"10#%H")*3600+$(date +"10#%M")*60+$(date +"10#%S")
   		 TIEMPOTOTAL=$((FINAL-INICIO))
   		 if test "$GANADOR" -eq 1
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 1: "${#JUG21[*]}" PUNTOS
   		 	echo
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'${#JUG21[*]}'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-*-* >> "$RUTA"
   		 elif test "$GANADOR" -eq 2
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 2: "${#JUG11[*]}" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'${#JUG11[*]}'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-*-* >> "$RUTA"
   		 fi
   	 elif test "$ESTRATEGIA" -eq 1
   	 then
   	 while test "$FIN" -ne 1
   	 do
   	 	FLAG2=0
   	 	echo ---------------------------------
   	 	echo "RONDA:  $CONTR"
   	 	echo ---------------------------------
   	 	echo "TU MANO: "
   	 	for i in ${!JUG11[*]}
   	 	do
   			echo -n " $((i+1))". "${JUG11[$i]}""${JUG12[$i]}|"
   	 	done
   	 	echo
   	 	echo 
   	
   	 	echo "MANO DEL JUGADOR 2"
   	 	for i in ${!JUG21[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG21[$i]}""${JUG22[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   		 
   	 	echo "MESA:"
   	 	echo "${MESA_O[*]}"
   	 	echo "${MESA_B[*]}"
   	  	echo "${MESA_E[*]}"
   		echo "${MESA_C[*]}"
   	 	echo
   	 	echo
   		 	
   	 	if test "$EXTREMOSUP_O" -eq 7
   	 	then
   	 		let EXTREMOSUP_O=EXTREMOSUP_O+2
   	 	elif test "$EXTREMOSUP_B" -eq 7
   	 	then
   	 		let EXTREMOSUP_B=EXTREMOSUP_B+2
   	 	elif test "$EXTREMOSUP_E" -eq 7
   	 	then
   	 		let EXTREMOSUP_E=EXTREMOSUP_E+2
   	 	elif test "$EXTREMOSUP_C" -eq 7
   	 	then
   			let EXTREMOSUP_C=EXTREMOSUP_C+2
   		fi
   		 	
   		 if test "$TURNO" -eq 1
   		 then
   		 	jugador1
   	 	elif test "$TURNO" -eq 2
   	 	then
   	 		jugador2E1
   	 	fi
   	 	#-----------------------------------
   	 	#CAMBIO DE TURNO--------------------
   	 	if test "$TURNO" -eq 1; then
   		 	TURNO=2
   		elif test "$TURNO" -eq 2; then
   			TURNO=1
   		fi
   			
   		echo --------------------------------------
   		echo
   			
   		if test "${#JUG11[*]}" -eq 0
   		then
   			GANADOR=1			
   			break;
   		elif test "${#JUG21[*]}" -eq 0
   		then
   			GANADOR=2
   			break;
   		fi	
   	 done
   	 	 FINAL=0
	 	 let FINAL=FINAL+$(date +"10#%H")*3600+$(date +"10#%M")*60+$(date +"10#%S")
   		 TIEMPOTOTAL=$((FINAL-INICIO))
   		 if test "$GANADOR" -eq 1
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 1: "${#JUG21[*]}" PUNTOS
   		 	echo
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'${#JUG21[*]}'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-*-* >> "$RUTA"
   		 elif test "$GANADOR" -eq 2
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 2: "${#JUG11[*]}" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'${#JUG11[*]}'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-*-* >> "$RUTA"
   		 fi
   	 #---------------------------------------------------------------------------------
   	 elif test "$ESTRATEGIA" -eq 2
   	 then
   	 while test "$FIN" -ne 1
   	 do
   	 	FLAG2=0
   	 	echo ---------------------------------
   	 	echo "RONDA:  $CONTR"
   	 	echo ---------------------------------
   	 	echo "TU MANO: "
   	 	for i in ${!JUG11[*]}
   	 	do
   			echo -n " $((i+1))". "${JUG11[$i]}""${JUG12[$i]}|"
   	 	done
   	 	echo
   	 	echo 
   	
   	 	echo "MANO DEL JUGADOR 2"
   	 	for i in ${!JUG21[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG21[$i]}""${JUG22[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   		 
   	 	echo "MESA:"
   	 	echo "${MESA_O[*]}"
   	 	echo "${MESA_B[*]}"
   	  	echo "${MESA_E[*]}"
   		echo "${MESA_C[*]}"
   	 	echo
   	 	echo
   		 	
   	 	if test "$EXTREMOSUP_O" -eq 7
   	 	then
   	 		let EXTREMOSUP_O=EXTREMOSUP_O+2
   	 	elif test "$EXTREMOSUP_B" -eq 7
   	 	then
   	 		let EXTREMOSUP_B=EXTREMOSUP_B+2
   	 	elif test "$EXTREMOSUP_E" -eq 7
   	 	then
   	 		let EXTREMOSUP_E=EXTREMOSUP_E+2
   	 	elif test "$EXTREMOSUP_C" -eq 7
   	 	then
   			let EXTREMOSUP_C=EXTREMOSUP_C+2
   		fi
   		
   		if test "$TURNO" -eq 1
   		then
   		 	jugador1
   		elif test "$TURNO" -eq 2
   	 	then
   	 		jugador2E2
   	 	fi
   	 	#-----------------------------------
   	 	#CAMBIO DE TURNO--------------------
   	 	if test "$TURNO" -eq 1; then
   		 	TURNO=2
   		elif test "$TURNO" -eq 2; then
   			TURNO=1
   		fi
   			
   		echo --------------------------------------
   		echo
   			
   		if test "${#JUG11[*]}" -eq 0
   		then
   			GANADOR=1			
   			break;
   		elif test "${#JUG21[*]}" -eq 0
   		then
   			GANADOR=2
   			break;
   		fi
   	 done
   	 	 FINAL=0
	 	 let FINAL=FINAL+$(date +"10#%H")*3600+$(date +"10#%M")*60+$(date +"10#%S")
   		 TIEMPOTOTAL=$((FINAL-INICIO))
   		 if test "$GANADOR" -eq 1
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 1: "${#JUG21[*]}" PUNTOS
   		 	echo
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'${#JUG21[*]}'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-*-* >> "$RUTA"
   		 elif test "$GANADOR" -eq 2
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 2: "${#JUG11[*]}" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'${#JUG11[*]}'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-*-* >> "$RUTA"
   		 fi
   	 fi
	 #------------------------------------------------------------
   	 #------------------------------------------------------------   			 
    elif test "$JUGADORES" -eq 3
    then
   	 #-------------------------------ASIGNACION DE CARTAS    
   	 
   	 POSIBILIDADES=( 13 13 14 )
   	 RANDOMPOSI=0
   	 JUG11=( 0 )
   	 JUG12=( "" )
   	 JUG21=( 0 )
   	 JUG22=( "" )
   	 JUG31=( 0 )
   	 JUG32=( "" )
   	 
   	 
   	 CONTJ1=0
   	 CONTJ2=0
   	 CONTJ3=0
   	 RANDOMC=0
   	 RANDOMP=0
   	 CONT=0
   	 
   	 CARTAS=40
   	 PALOS=4
   	 JUG=3
   	 
   	 #PARA IR ALMACENANDO LAS CARTAS YA ESTABLECIDAS
   	 P1=( 0 )
   	 P2=( "" )
   	 RANDOMPOSI=$(( RANDOM%JUG ))
   	 
   	 #PARA ASIGNAR CARTAS AL JUGADOR 1
   	 while test "$CONTJ1" -lt "${POSIBILIDADES[$RANDOMPOSI]}"     	 
   	 do    
   		 FLAG=0
   		 RANDOMC=$(( RANDOM%CARTAS ))
   		 RANDOMP=$(( RANDOM%PALOS ))

   		 JUG11[$CONTJ1]=${MAZO1[$RANDOMC]}
   		 JUG12[$CONTJ1]=${MAZO2[$RANDOMP]}
   		 
   		 VALOR1=${JUG11[$CONTJ1]}
   		 VALOR2="${JUG12[$CONTJ1]}"
   							 
   		 ((CONTJ1++))
   		 ((CARTAS--))
   		 
   		 for i in ${!P1[@]}
   		 do
   			 if [ "${P1[$i]}" -eq "$VALOR1" ]
   			 then
   				 if [ "${P2[$i]}" = "$VALOR2" ]
   				 then
   					 FLAG=1
   					 break;
   				 fi   	 
   			 fi
   		 done
   		 
   		 if test "$FLAG" -eq 0
   		 then
   			 unset MAZO1[$RANDOMC]
   			 MAZO1=("${MAZO1[@]}")
   			 P1[$CONT]=${JUG11[${#JUG11[*]}-1]}
   			 P2[$CONT]=${JUG12[${#JUG12[*]}-1]}
   			 ((CONT++))
   		 elif test "$FLAG" -eq 1
   		 then
   			 unset JUG11[${#JUG11[*]}-1]
   			 JUG11=("${JUG11[@]}")
   			 unset JUG12[${#JUG12[*]}-1]
   			 JUG12=("${JUG12[@]}")
   			 
   			 CONTJ1=$((CONTJ1-1))
   			 ((CARTAS++))
   			 
   		 fi
   	 done
   	 unset POSIBILIDADES[$(( RANDOMPOSI ))]
   	 POSIBILIDADES=("${POSIBILIDADES[@]}")
   	 JUG=$((JUG-1))
   	 RANDOMPOSI=$(( RANDOM%JUG ))
   	 
   	 #PARA ASIGNAR CARTAS AL JUGADOR 2
   	 while test "$CONTJ2" -lt "${POSIBILIDADES[$RANDOMPOSI]}"     	 
   	 do    
   		 FLAG=0
   		 RANDOMC=$(( RANDOM%CARTAS ))
   		 RANDOMP=$(( RANDOM%PALOS ))

   		 JUG21[$CONTJ2]=${MAZO1[$RANDOMC]}
   		 JUG22[$CONTJ2]=${MAZO2[$RANDOMP]}
   		 
   		 VALOR1=${JUG21[$CONTJ2]}
   		 VALOR2="${JUG22[$CONTJ2]}"
   							 
   		 ((CONTJ2++))
   		 ((CARTAS--))
   		 
   		 for i in ${!P1[@]}
   		 do
   			 if [ "${P1[$i]}" -eq "$VALOR1" ]
   			 then
   				 if [ "${P2[$i]}" = "$VALOR2" ]
   				 then
   					 FLAG=1
   					 break;
   				 fi   	 
   			 fi
   		 done
   		 
   		 if test "$FLAG" -eq 0
   		 then
   			 unset MAZO1[$RANDOMC]
   			 MAZO1=("${MAZO1[@]}")
   			 P1[$CONT]=${JUG21[${#JUG21[*]}-1]}
   			 P2[$CONT]=${JUG22[${#JUG22[*]}-1]}
   			 ((CONT++))
   		 elif test "$FLAG" -eq 1
   		 then
   			 unset JUG21[${#JUG21[*]}-1]
   			 JUG21=("${JUG21[@]}")
   			 unset JUG22[${#JUG22[*]}-1]
   			 JUG22=("${JUG22[@]}")
   			 CONTJ2=$((CONTJ2-1))
   			 ((CARTAS++))
   			 
   		 fi
   	 done
   	 
   	 unset POSIBILIDADES[$(( RANDOMPOSI ))]
   	 POSIBILIDADES=("${POSIBILIDADES[@]}")
   	 JUG=$((JUG-1))
   	 RANDOMPOSI=$(( RANDOM%JUG ))
   	 
   	 #PARA ASIGNAR LAS CARTAS AL JUGADOR 3
   	 while test "$CONTJ3" -lt "${POSIBILIDADES[$RANDOMPOSI]}"     	 
   	 do    
   		 FLAG=0
   		 RANDOMC=$(( RANDOM%CARTAS ))
   		 RANDOMP=$(( RANDOM%PALOS ))

   		 JUG31[$CONTJ3]=${MAZO1[$RANDOMC]}
   		 JUG32[$CONTJ3]=${MAZO2[$RANDOMP]}
   		 
   		 VALOR1=${JUG31[$CONTJ3]}
   		 VALOR2="${JUG32[$CONTJ3]}"
   							 
   		 ((CONTJ3++))
   		 ((CARTAS--))
   		 
   		 for i in ${!P1[@]}
   		 do
   			 if [ "${P1[$i]}" -eq "$VALOR1" ]
   			 then
   				 if [ "${P2[$i]}" = "$VALOR2" ]
   				 then
   					 FLAG=1
   					 break;
   				 fi   	 
   			 fi
   		 done
   		 
   		 if test "$FLAG" -eq 0
   		 then
   			 unset MAZO1[$RANDOMC]
   			 MAZO1=("${MAZO1[@]}")
   			 P1[$CONT]=${JUG31[${#JUG31[*]}-1]}
   			 P2[$CONT]=${JUG32[${#JUG32[*]}-1]}
   			 ((CONT++))
   		 elif test "$FLAG" -eq 1
   		 then
   			 unset JUG31[${#JUG31[*]}-1]
   			 JUG31=("${JUG31[@]}")
   			 unset JUG32[${#JUG32[*]}-1]
   			 JUG32=("${JUG32[@]}")   	 
   			 CONTJ3=$((CONTJ3-1))
   			 ((CARTAS++))
   			 
   		 fi
   	 done
   	 #------------------------------------------------------------
   	 #-----------------------CREACION DEL JUEGO-------------------
   	 MESA_O=( "--" "--" "--" "--" "--" "--" "--" "--" "--" "--" )
   	 MESA_B=( "--" "--" "--" "--" "--" "--" "--" "--" "--" "--" )
   	 MESA_E=( "--" "--" "--" "--" "--" "--" "--" "--" "--" "--" )
   	 MESA_C=( "--" "--" "--" "--" "--" "--" "--" "--" "--" "--" )
   	 
   	 EXTREMOSUP_O=-1
   	 EXTREMOINF_O=-1
   	 
   	 EXTREMOSUP_B=-1
   	 EXTREMOINF_B=-1
   	 
   	 EXTREMOSUP_E=-1
   	 EXTREMOINF_E=-1
   	 
   	 EXTREMOSUP_C=-1
   	 EXTREMOINF_C=-1

   	 #------------------------------------------------------------
   	 FIN=0
   	 TURNO=0
   	 FLAG2=0
   	 COMIENZO=0
   	 PUNTOS=0
   	 #PARA VER SI EL JUGADOR 1 EMPIEZA
   	 for i in ${!JUG11[*]}
   	 do
   		 if test "${JUG11[$i]}" -eq 5 -a "${JUG12[$i]}" = O
   		 then
   			 TURNO=1
   			 COMIENZO=1
   			 break;
   		 fi
   	 done
   	 #PARA VER SI EL JUGADOR 2 EMPIEZA
   	 for i in ${!JUG21[*]}
   	 do
   	 	if test "${JUG21[$i]}" -eq 5 -a "${JUG22[$i]}" = O
   		 then
   			 TURNO=2
   			 COMIENZO=2
   			 break;
   		 fi
   	 done
   	 #PARA VER SI EL JUGADOR 3 EMPIEZA
   	 for i in ${!JUG31[*]}
   	 do
   	 	if test "${JUG31[$i]}" -eq 5 -a "${JUG32[$i]}" = O
   		 then
   			 TURNO=3
   			 COMIENZO=3
   			 break;
   		 fi
   	 done
   	 #------------------------------------------------------------
   	 CONTR=1
   	 POSICION=0
   	 GANADOR=0
   	 INICIO=0
	 let INICIO=INICIO+$(date +"10#%H")*3600+$(date +"10#%M")*60+$(date +"10#%S")
   	 if test "$ESTRATEGIA" -eq 0
   	 then
   	 while test "$FIN" -ne 1
   	 do
   	 	FLAG2=0
   	 	echo ---------------------------------
   	 	echo "RONDA:  $CONTR"
   	 	echo ---------------------------------
   	 	echo "TU MANO: "
   	 	for i in ${!JUG11[*]}
   	 	do
   			echo -n " $((i+1))". "${JUG11[$i]}""${JUG12[$i]}|"
   	 	done
   	 	echo
   	 	echo 
   	
   	 	echo "MANO DEL JUGADOR 2"
   	 	for i in ${!JUG21[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG21[$i]}""${JUG22[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   	 	
   	 	echo "MANO DEL JUGADOR 3"
   	 	for i in ${!JUG31[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG31[$i]}""${JUG32[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   		 
   	 	echo "MESA:"
   	 	echo "${MESA_O[*]}"
   	 	echo "${MESA_B[*]}"
   	  	echo "${MESA_E[*]}"
   		echo "${MESA_C[*]}"
   	 	echo
   	 	echo
   		 	
   	 	if test "$EXTREMOSUP_O" -eq 7
   	 	then
   	 		let EXTREMOSUP_O=EXTREMOSUP_O+2
   	 	elif test "$EXTREMOSUP_B" -eq 7
   	 	then
   	 		let EXTREMOSUP_B=EXTREMOSUP_B+2
   	 	elif test "$EXTREMOSUP_E" -eq 7
   	 	then
   	 		let EXTREMOSUP_E=EXTREMOSUP_E+2
   	 	elif test "$EXTREMOSUP_C" -eq 7
   	 	then
   			let EXTREMOSUP_C=EXTREMOSUP_C+2
   		fi
   		
   		if test "$TURNO" -eq 1
   		then
   			jugador1
   		elif test "$TURNO" -eq 2
   		then
   			jugador2E0
   		elif test "$TURNO" -eq 3
   		then
   			jugador3E0
   		fi
   		
   		#-----------------------------------
   	 	#CAMBIO DE TURNO--------------------
   	 	if test "$TURNO" -eq 1; then
   		 	TURNO=2
   		elif test "$TURNO" -eq 2; then
   			TURNO=3
   		elif test "$TURNO" -eq 3; then
   			TURNO=1
   		fi
   			
   		echo --------------------------------------
   		echo
   			
   		if test "${#JUG11[*]}" -eq 0
   		then
   			GANADOR=1
   			FIN=1
   			let PUNTOS=PUNTOS"${#JUG21[*]}"+"${#JUG31[*]}"			
   			break;
   		elif test "${#JUG21[*]}" -eq 0
   		then
   			GANADOR=2
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG11[*]}"+"${#JUG31[*]}"
   			break;
   		elif test "${#JUG31[*]}" -eq 0
   		then
   			GANADOR=3
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG11[*]}"+"${#JUG21[*]}"
   			break;
   		fi
   	 done
   	 	 FINAL=0
	 	 let FINAL=FINAL+$(date +"10#%H")*3600+$(date +"10#%M")*60+$(date +"10#%S")
   		 TIEMPOTOTAL=$((FINAL-INICIO))
   		 if test "$GANADOR" -eq 1
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 1: "$PUNTOS" PUNTOS
   		 	echo
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-* >> "$RUTA"
   		 elif test "$GANADOR" -eq 2
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 2: "$PUNTOS" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-* >> "$RUTA"
   		 elif test "$GANADOR" -eq 3
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 3: "$PUNTOS" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-* >> "$RUTA"
   		 fi
   	 #------------------------------------------------------------
   	 elif test "$ESTRATEGIA" -eq 1
   	 then
   	 while test "$FIN" -ne 1
   	 do
   	 	FLAG2=0
   	 	echo ---------------------------------
   	 	echo "RONDA:  $CONTR"
   	 	echo ---------------------------------
   	 	echo "TU MANO: "
   	 	for i in ${!JUG11[*]}
   	 	do
   			echo -n " $((i+1))". "${JUG11[$i]}""${JUG12[$i]}|"
   	 	done
   	 	echo
   	 	echo 
   	
   	 	echo "MANO DEL JUGADOR 2"
   	 	for i in ${!JUG21[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG21[$i]}""${JUG22[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   	 	
   	 	echo "MANO DEL JUGADOR 3"
   	 	for i in ${!JUG31[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG31[$i]}""${JUG32[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   		 
   	 	echo "MESA:"
   	 	echo "${MESA_O[*]}"
   	 	echo "${MESA_B[*]}"
   	  	echo "${MESA_E[*]}"
   		echo "${MESA_C[*]}"
   	 	echo
   	 	echo
   		 	
   	 	if test "$EXTREMOSUP_O" -eq 7
   	 	then
   	 		let EXTREMOSUP_O=EXTREMOSUP_O+2
   	 	elif test "$EXTREMOSUP_B" -eq 7
   	 	then
   	 		let EXTREMOSUP_B=EXTREMOSUP_B+2
   	 	elif test "$EXTREMOSUP_E" -eq 7
   	 	then
   	 		let EXTREMOSUP_E=EXTREMOSUP_E+2
   	 	elif test "$EXTREMOSUP_C" -eq 7
   	 	then
   			let EXTREMOSUP_C=EXTREMOSUP_C+2
   		fi
   		
   		if test "$TURNO" -eq 1
   		then
   			jugador1
   		elif test "$TURNO" -eq 2
   		then
   			jugador2E1
   		elif test "$TURNO" -eq 3
   		then
   			jugador3E1
   		fi
   		#-----------------------------------
   	 	#CAMBIO DE TURNO--------------------
   	 	if test "$TURNO" -eq 1; then
   		 	TURNO=2
   		elif test "$TURNO" -eq 2; then
   			TURNO=3
   		elif test "$TURNO" -eq 3; then
   			TURNO=1
   		fi
   			
   		echo --------------------------------------
   		echo
   			
   		if test "${#JUG11[*]}" -eq 0
   		then
   			GANADOR=1
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG21[*]}"+"${#JUG31[*]}"			
   			break;
   		elif test "${#JUG21[*]}" -eq 0
   		then
   			GANADOR=2
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG11[*]}"+"${#JUG31[*]}"
   			break;
   		elif test "${#JUG31[*]}" -eq 0
   		then
   			GANADOR=3
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG11[*]}"+"${#JUG21[*]}"
   			break;
   		fi
   	 done
   	 	 FINAL=0
	 	 let FINAL=FINAL+$(date +"10#%H")*3600+$(date +"10#%M")*60+$(date +"10#%S")
   		 TIEMPOTOTAL=$((FINAL-INICIO))
   		 if test "$GANADOR" -eq 1
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 1: "$PUNTOS" PUNTOS
   		 	echo
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-* >> "$RUTA"
   		 elif test "$GANADOR" -eq 2
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 2: "$PUNTOS" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-* >> "$RUTA"
   		 elif test "$GANADOR" -eq 3
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 3: "$PUNTOS" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-* >> "$RUTA"
   		 fi
   	 #------------------------------------------------------------
   	 elif test "$ESTRATEGIA" -eq 2
   	 then
   	 while test "$FIN" -ne 1
   	 do
   	 	FLAG2=0
   	 	echo ---------------------------------
   	 	echo "RONDA:  $CONTR"
   	 	echo ---------------------------------
   	 	echo "TU MANO: "
   	 	for i in ${!JUG11[*]}
   	 	do
   			echo -n " $((i+1))". "${JUG11[$i]}""${JUG12[$i]}|"
   	 	done
   	 	echo
   	 	echo 
   	
   	 	echo "MANO DEL JUGADOR 2"
   	 	for i in ${!JUG21[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG21[$i]}""${JUG22[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   	 	
   	 	echo "MANO DEL JUGADOR 3"
   	 	for i in ${!JUG31[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG31[$i]}""${JUG32[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   		 
   	 	echo "MESA:"
   	 	echo "${MESA_O[*]}"
   	 	echo "${MESA_B[*]}"
   	  	echo "${MESA_E[*]}"
   		echo "${MESA_C[*]}"
   	 	echo
   	 	echo
   		 	
   	 	if test "$EXTREMOSUP_O" -eq 7
   	 	then
   	 		let EXTREMOSUP_O=EXTREMOSUP_O+2
   	 	elif test "$EXTREMOSUP_B" -eq 7
   	 	then
   	 		let EXTREMOSUP_B=EXTREMOSUP_B+2
   	 	elif test "$EXTREMOSUP_E" -eq 7
   	 	then
   	 		let EXTREMOSUP_E=EXTREMOSUP_E+2
   	 	elif test "$EXTREMOSUP_C" -eq 7
   	 	then
   			let EXTREMOSUP_C=EXTREMOSUP_C+2
   		fi
   		
   	 	if test "$TURNO" -eq 1
   	 	then
   	 		jugador1
   	 	elif test "$TURNO" -eq 2
   	 	then
   	 		jugador2E2
   	 	elif test "$TURNO" -eq 3
   	 	then
   	 		jugador3E2
   	 	fi
   	 	
   	 	#-----------------------------------
   	 	#CAMBIO DE TURNO--------------------
   	 	if test "$TURNO" -eq 1; then
   		 	TURNO=2
   		elif test "$TURNO" -eq 2; then
   			TURNO=3
   		elif test "$TURNO" -eq 3; then
   			TURNO=1
   		fi
   			
   		echo --------------------------------------
   		echo
   			
   		if test "${#JUG11[*]}" -eq 0
   		then
   			GANADOR=1
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG21[*]}"+"${#JUG31[*]}"			
   			break;
   		elif test "${#JUG21[*]}" -eq 0
   		then
   			GANADOR=2
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG11[*]}"+"${#JUG31[*]}"
   			break;
   		elif test "${#JUG31[*]}" -eq 0
   		then
   			GANADOR=3
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG11[*]}"+"${#JUG21[*]}"
   			break;
   		fi
   	 done
   	 	 FINAL=0
	 	 let FINAL=FINAL+$(date +"10#%H")*3600+$(date +"10#%M")*60+$(date +"10#%S")
   		 TIEMPOTOTAL=$((FINAL-INICIO))
   		 if test "$GANADOR" -eq 1
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 1: "$PUNTOS" PUNTOS
   		 	echo
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-* >> "$RUTA"
   		 elif test "$GANADOR" -eq 2
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 2: "$PUNTOS" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-* >> "$RUTA"
   		 elif test "$GANADOR" -eq 3
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 3: "$PUNTOS" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-* >> "$RUTA"
   		 fi
   	 fi
   	 #------------------------------------------------------------
   	 #------------------------------------------------------------
    elif test "$JUGADORES" -eq 4
    then
   	 #-------------------------------ASIGNACION DE CARTAS    
   	 
   	 JUG11=( 0 )
   	 JUG12=( "" )
   	 JUG21=( 0 )
   	 JUG22=( "" )
   	 JUG31=( 0 )
   	 JUG32=( "" )
   	 JUG41=( 0 )
   	 JUG42=( "" )
   	 
   	 
   	 CONTJ1=0
   	 CONTJ2=0
   	 CONTJ3=0
   	 CONTJ4=0
   	 RANDOMC=0
   	 RANDOMP=0
   	 CONT=0
   	 
   	 CARTAS=40
   	 PALOS=4
   	 
   	 #PARA IR ALMACENANDO LAS CARTAS YA ESTABLECIDAS
   	 P1=( 0 )
   	 P2=( "" )
   	 
   	 #PARA ASIGNAR CARTAS AL JUGADOR 1
   	 while test "$CONTJ1" -lt 10     	 
   	 do    
   		 FLAG=0
   		 RANDOMC=$(( RANDOM%CARTAS ))
   		 RANDOMP=$(( RANDOM%PALOS ))

   		 JUG11[$CONTJ1]=${MAZO1[$RANDOMC]}
   		 JUG12[$CONTJ1]=${MAZO2[$RANDOMP]}
   		 
   		 VALOR1=${JUG11[$CONTJ1]}
   		 VALOR2="${JUG12[$CONTJ1]}"
   							 
   		 ((CONTJ1++))
   		 ((CARTAS--))
   		 
   		 for i in ${!P1[@]}
   		 do
   			 if [ "${P1[$i]}" -eq "$VALOR1" ]
   			 then
   				 if [ "${P2[$i]}" = "$VALOR2" ]
   				 then
   					 FLAG=1
   					 break;
   				 fi   	 
   			 fi
   		 done
   		 
   		 if test "$FLAG" -eq 0
   		 then
   			 unset MAZO1[$RANDOMC]
   			 MAZO1=("${MAZO1[@]}")
   			 P1[$CONT]=${JUG11[${#JUG11[*]}-1]}
   			 P2[$CONT]=${JUG12[${#JUG12[*]}-1]}
   			 ((CONT++))
   		 elif test "$FLAG" -eq 1
   		 then
   			 unset JUG11[${#JUG11[*]}-1]
   			 JUG11=("${JUG11[@]}")
   			 unset JUG12[${#JUG12[*]}-1]
   			 JUG12=("${JUG12[@]}")
   			 
   			 CONTJ1=$((CONTJ1-1))
   			 ((CARTAS++))
   			 
   		 fi
   	 done
   	 #PARA ASIGNAR CARTAS JUGADOR 2
   	 
   	 while test "$CONTJ2" -lt 10     	 
   	 do    
   		 FLAG=0
   		 RANDOMC=$(( RANDOM%CARTAS ))
   		 RANDOMP=$(( RANDOM%PALOS ))

   		 JUG21[$CONTJ2]=${MAZO1[$RANDOMC]}
   		 JUG22[$CONTJ2]=${MAZO2[$RANDOMP]}
   		 
   		 VALOR1=${JUG21[$CONTJ2]}
   		 VALOR2="${JUG22[$CONTJ2]}"
   							 
   		 ((CONTJ2++))
   		 ((CARTAS--))
   		 
   		 for i in ${!P1[@]}
   		 do
   			 if [ "${P1[$i]}" -eq "$VALOR1" ]
   			 then
   				 if [ "${P2[$i]}" = "$VALOR2" ]
   				 then
   					 FLAG=1
   					 break;
   				 fi   	 
   			 fi
   		 done
   		 
   		 if test "$FLAG" -eq 0
   		 then
   			 unset MAZO1[$RANDOMC]
   			 MAZO1=("${MAZO1[@]}")
   			 P1[$CONT]=${JUG21[${#JUG21[*]}-1]}
   			 P2[$CONT]=${JUG22[${#JUG22[*]}-1]}
   			 ((CONT++))
   		 elif test "$FLAG" -eq 1
   		 then
   			 unset JUG21[${#JUG21[*]}-1]
   			 JUG21=("${JUG21[@]}")
   			 unset JUG22[${#JUG22[*]}-1]
   			 JUG22=("${JUG22[@]}")
   			 CONTJ2=$((CONTJ2-1))
   			 ((CARTAS++))
   			 
   		 fi
   	 done
   	 #PARA ASIGNAR LAS CARTAS AL JUGADOR 3
   	 while test "$CONTJ3" -lt 10     	 
   	 do    
   		 FLAG=0
   		 RANDOMC=$(( RANDOM%CARTAS ))
   		 RANDOMP=$(( RANDOM%PALOS ))

   		 JUG31[$CONTJ3]=${MAZO1[$RANDOMC]}
   		 JUG32[$CONTJ3]=${MAZO2[$RANDOMP]}
   		 
   		 VALOR1=${JUG31[$CONTJ3]}
   		 VALOR2="${JUG32[$CONTJ3]}"
   							 
   		 ((CONTJ3++))
   		 ((CARTAS--))
   		 
   		 for i in ${!P1[@]}
   		 do
   			 if [ "${P1[$i]}" -eq "$VALOR1" ]
   			 then
   				 if [ "${P2[$i]}" = "$VALOR2" ]
   				 then
   					 FLAG=1
   					 break;
   				 fi   	 
   			 fi
   		 done
   		 
   		 if test "$FLAG" -eq 0
   		 then
   			 unset MAZO1[$RANDOMC]
   			 MAZO1=("${MAZO1[@]}")
   			 P1[$CONT]=${JUG31[${#JUG31[*]}-1]}
   			 P2[$CONT]=${JUG32[${#JUG32[*]}-1]}
   			 ((CONT++))
   		 elif test "$FLAG" -eq 1
   		 then
   			 unset JUG31[${#JUG31[*]}-1]
   			 JUG31=("${JUG31[@]}")
   			 unset JUG32[${#JUG32[*]}-1]
   			 JUG32=("${JUG32[@]}")   	 
   			 CONTJ3=$((CONTJ3-1))
   			 ((CARTAS++))	 
   		 fi
   	 done
   	 #PARA ASIGNAR LAS CARTAS AL JUGADOR 4
   	 while test "$CONTJ4" -lt 10     	 
   	 do    
   		 FLAG=0
   		 RANDOMC=$(( RANDOM%CARTAS ))
   		 RANDOMP=$(( RANDOM%PALOS ))

   		 JUG41[$CONTJ4]=${MAZO1[$RANDOMC]}
   		 JUG42[$CONTJ4]=${MAZO2[$RANDOMP]}
   		 
   		 VALOR1=${JUG41[$CONTJ4]}
   		 VALOR2="${JUG42[$CONTJ4]}"
   							 
   		 ((CONTJ4++))
   		 ((CARTAS--))
   		 
   		 for i in ${!P1[@]}
   		 do
   			 if [ "${P1[$i]}" -eq "$VALOR1" ]
   			 then
   				 if [ "${P2[$i]}" = "$VALOR2" ]
   				 then
   					 FLAG=1
   					 break;
   				 fi   	 
   			 fi
   		 done
   		 
   		 if test "$FLAG" -eq 0
   		 then
   			 unset MAZO1[$RANDOMC]
   			 MAZO1=("${MAZO1[@]}")
   			 P1[$CONT]=${JUG41[${#JUG41[*]}-1]}
   			 P2[$CONT]=${JUG42[${#JUG42[*]}-1]}
   			 ((CONT++))
   		 elif test "$FLAG" -eq 1
   		 then
   			 unset JUG41[${#JUG41[*]}-1]
   			 JUG41=("${JUG41[@]}")
   			 unset JUG42[${#JUG42[*]}-1]
   			 JUG42=("${JUG42[@]}")   	 
   			 CONTJ4=$((CONTJ4-1))
   			 ((CARTAS++))
   			 
   		 fi
   	 done
   	 #------------------------------------------------------------
   	 #-----------------------CREACION DEL JUEGO-------------------
   	 MESA_O=( "--" "--" "--" "--" "--" "--" "--" "--" "--" "--" )
   	 MESA_B=( "--" "--" "--" "--" "--" "--" "--" "--" "--" "--" )
   	 MESA_E=( "--" "--" "--" "--" "--" "--" "--" "--" "--" "--" )
   	 MESA_C=( "--" "--" "--" "--" "--" "--" "--" "--" "--" "--" )
   	 
   	 EXTREMOSUP_O=-1
   	 EXTREMOINF_O=-1
   	 
   	 EXTREMOSUP_B=-1
   	 EXTREMOINF_B=-1
   	 
   	 EXTREMOSUP_E=-1
   	 EXTREMOINF_E=-1
   	 
   	 EXTREMOSUP_C=-1
   	 EXTREMOINF_C=-1

   	 #------------------------------------------------------------
   	 FIN=0
   	 TURNO=0
   	 FLAG2=0
   	 COMIENZO=0
   	 PUNTOS=0
   	 for i in ${!JUG11[*]}
   	 do
   		 if test "${JUG11[$i]}" -eq 5 -a "${JUG12[$i]}" = O
   		 then
   			 TURNO=1
   			 COMIENZO=1
   			 break;
   		 elif test "${JUG21[$i]}" -eq 5 -a "${JUG22[$i]}" = O
   		 then
   			 TURNO=2
   			 COMIENZO=2
   			 break;
   		 elif test "${JUG31[$i]}" -eq 5 -a "${JUG32[$i]}" = O
   		 then
   			 TURNO=3
   			 COMIENZO=3
   			 break;
   		 elif test "${JUG41[$i]}" -eq 5 -a "${JUG42[$i]}" = O
   		 then
   			 TURNO=4
   			 COMIENZO=4
   			 break;
   		 fi
   	 done
   	 #------------------------------------------------------------
   	 CONTR=1
   	 POSICION=0
   	 GANADOR=0
   	 INICIO=0
	 let INICIO=INICIO+$(date +"10#%H")*3600+$(date +"10#%M")*60+$(date +"10#%S")
	 
   	 if test "$ESTRATEGIA" -eq 0
   	 then
   	 while test "$FIN" -ne 1
   	 do
   	 	FLAG2=0
   	 	echo ---------------------------------
   	 	echo "RONDA:  $CONTR"
   	 	echo ---------------------------------
   	 	echo "TU MANO: "
   	 	for i in ${!JUG11[*]}
   	 	do
   			echo -n " $((i+1))". "${JUG11[$i]}""${JUG12[$i]}|"
   	 	done
   	 	echo
   	 	echo 
   	
   	 	echo "MANO DEL JUGADOR 2"
   	 	for i in ${!JUG21[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG21[$i]}""${JUG22[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   	 	
   	 	echo "MANO DEL JUGADOR 3"
   	 	for i in ${!JUG31[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG31[$i]}""${JUG32[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   	 	
   	 	echo "MANO DEL JUGADOR 4"
   	 	for i in ${!JUG41[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG41[$i]}""${JUG42[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   		 
   	 	echo "MESA:"
   	 	echo "${MESA_O[*]}"
   	 	echo "${MESA_B[*]}"
   	  	echo "${MESA_E[*]}"
   		echo "${MESA_C[*]}"
   	 	echo
   	 	echo
   		 	
   	 	if test "$EXTREMOSUP_O" -eq 7
   	 	then
   	 		let EXTREMOSUP_O=EXTREMOSUP_O+2
   	 	elif test "$EXTREMOSUP_B" -eq 7
   	 	then
   	 		let EXTREMOSUP_B=EXTREMOSUP_B+2
   	 	elif test "$EXTREMOSUP_E" -eq 7
   	 	then
   	 		let EXTREMOSUP_E=EXTREMOSUP_E+2
   	 	elif test "$EXTREMOSUP_C" -eq 7
   	 	then
   			let EXTREMOSUP_C=EXTREMOSUP_C+2
   		fi
   		
   		if test "$TURNO" -eq 1
   		then
   			jugador1
   		elif test "$TURNO" -eq 2
   		then
   			jugador2E0
   		elif test "$TURNO" -eq 3
   		then
   			jugador3E0
   		elif test "$TURNO" -eq 4
   		then
   			((CONTR++))
   			echo
   			echo -------------TURNO DEL JUGADOR 4-------------
   			echo
   		 	if test "$COMIENZO" -eq 4
   			then
   			 	for i in ${!JUG41[*]}; do
   			 		if test "${JUG41[$i]}" -eq 5 -a "${JUG42[$i]}" = "O"
   			 		then
   			 			MESA_O[4]="5O"
   			 			echo EL JUGADOR 4 COLOCA LA CARTA 5 de O
   						echo
   			 			unset JUG41[$i]
   						JUG41=("${JUG41[@]}")
   						unset JUG42[$i]
   		 				JUG42=("${JUG42[@]}")
   		 				EXTREMOSUP_O=5
   	 					EXTREMOINF_O=5
						FLAG2=1
						COMIENZO=0
						break;
   			 		fi
   			 	done
   			fi
   			while test "$FLAG2" -eq 0; do
   				for i in ${!JUG41[*]}; do
   					if test "${JUG42[$i]}" = "O"
   					then
   						if test "${JUG41[$i]}" -eq $((EXTREMOSUP_O+1))
   						then
   					#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 				if test ${JUG41[$i]} -gt 9
   			 				then
   			 				case ${JUG41[$i]} in
   			 					10)
   			 					MESA_O[7]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;	
   			 					11)
   			 					MESA_O[8]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;
   			 					12)
   			 					MESA_O[9]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;
   			 				esac
   			 			else
   			 		  		MESA_O[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   			 			fi
   			 		#-------------------------------------------------------------------
   							echo -n EL JUGADOR 4 COLOCA LA CARTA
   							echo " ${JUG41[$i]} de ${JUG42[$i]}"
   							echo
   							unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   			 				FLAG2=1
   			 				((EXTREMOSUP_O++))
   			 				break;
   						elif test "${JUG41[$i]}" -eq $((EXTREMOINF_O-1))
   						then
   							MESA_O[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   							echo -n EL JUGADOR 4 COLOCA LA CARTA
   							echo " ${JUG41[$i]} de ${JUG42[$i]}"
   							echo
   			 				unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   			 				FLAG2=1
   			 				((EXTREMOINF_O--))
   			 				break;
   						fi
   					elif test "${JUG42[$i]}" = "B"
   					then
   						if test "${JUG41[$i]}" -eq 5
   						then
   							MESA_B[4]="5B"
   							echo EL JUGADOR 4 COLOCA LA CARTA 5 de B
   							echo
   							unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   							EXTREMOSUP_B=5
   							EXTREMOINF_B=5
							FLAG2=1
							break;
   						else
   							if test "${JUG41[$i]}" -eq $((EXTREMOSUP_B+1))
   							then
   					#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 					if test ${JUG41[$i]} -gt 9
   		 					then
   		 					case ${JUG41[$i]} in
   		 						10)
   		 						MESA_B[7]="${JUG41[$i]}${JUG42[$i]}"
   		 						;;	
   								11)
   		 						MESA_B[8]="${JUG41[$i]}${JUG42[$i]}"
   		 						;;
   		 						12)
   		 						MESA_B[9]="${JUG41[$i]}${JUG42[$i]}"
   		 						;;
   		 					esac
   		 				else
   		 			  		MESA_B[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   		 				fi
   		 			#-------------------------------------------------------------------
   								echo -n EL JUGADOR 4 COLOCA LA CARTA
   								echo " ${JUG41[$i]} de ${JUG42[$i]}"
   								echo
   								unset JUG41[$i]
   								JUG41=("${JUG41[@]}")
   								unset JUG42[$i]
   			 					JUG42=("${JUG42[@]}")
   			 					FLAG2=1
   			 					((EXTREMOSUP_B++))
   			 					break;
   							elif test "${JUG41[$i]}" -eq $((EXTREMOINF_B-1))
   							then
   								MESA_B[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   								echo -n EL JUGADOR 4 COLOCA LA CARTA
   								echo " ${JUG41[$i]} de ${JUG42[$i]}"
   								echo
   			 					unset JUG41[$i]
   								JUG41=("${JUG41[@]}")
   								unset JUG42[$i]
   			 					JUG42=("${JUG42[@]}")
   								FLAG2=1
   								((EXTREMOINF_B--))
   								break; 
   							fi
   						fi
   					elif test "${JUG42[$i]}" = "E"
   					then
   						if test "${JUG41[$i]}" -eq 5
   						then
   							MESA_E[4]="5E"
   							echo EL JUGADOR 4 COLOCA LA CARTA 5 de E
   							echo
   							unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   			 				EXTREMOSUP_E=5
   	 						EXTREMOINF_E=5
							FLAG2=1
							break;
   						else
   							if test "${JUG41[$i]}" -eq $((EXTREMOSUP_E+1))
   							then
   					#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 				if test ${JUG41[$i]} -gt 9
   			 				then
   			 				case ${JUG41[$i]} in
   			 					10)
   			 					MESA_E[7]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;	
   			 					11)
   			 					MESA_E[8]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;
   			 					12)
   			 					MESA_E[9]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;
   			 				esac
   			 			else
   			 		  		MESA_E[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   			 			fi
   					#-------------------------------------------------------------------
   								echo -n EL JUGADOR 4 COLOCA LA CARTA
   								echo " ${JUG41[$i]} de ${JUG42[$i]}"
   								echo
   								unset JUG41[$i]
   								JUG41=("${JUG41[@]}")
   								unset JUG42[$i]
   			 					JUG42=("${JUG42[@]}")
   			 					FLAG2=1
   			 					((EXTREMOSUP_E++))
   			 					break;
   							elif test "${JUG41[$i]}" -eq $((EXTREMOINF_E-1))
   							then
   								MESA_E[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   								echo -n EL JUGADOR 4 COLOCA LA CARTA
   								echo " ${JUG41[$i]} de ${JUG42[$i]}"
   								echo
   			 					unset JUG41[$i]
   								JUG41=("${JUG41[@]}")
   								unset JUG42[$i]
   								JUG42=("${JUG42[@]}")
   		 						FLAG2=1
   		 						((EXTREMOINF_E--))
   		 						break; 
   							fi
   						fi
   					elif test "${JUG42[$i]}" = "C"
   					then
   						if test "${JUG41[$i]}" -eq 5
   						then
   							MESA_C[4]="5C"
   							echo EL JUGADOR 4 COLOCA LA CARTA 5 de C
   							echo
   							unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   		 					JUG42=("${JUG42[@]}")
   		 					EXTREMOSUP_C=5
   	 						EXTREMOINF_C=5
							FLAG2=1
							break;
   						else
   							if test "${JUG41[$i]}" -eq $((EXTREMOSUP_C+1))
   							then
   					#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 					if test ${JUG41[$i]} -gt 9
   		 					then
   		 					case ${JUG41[$i]} in
   		 						10)
   		 						MESA_C[7]="${JUG41[$i]}${JUG42[$i]}"
   		 						;;	
   		 						11)
   		 						MESA_C[8]="${JUG41[$i]}${JUG42[$i]}"
   		 						;;
   		 						12)
   		 						MESA_C[9]="${JUG41[$i]}${JUG42[$i]}"
   								;;
   		 					esac
   						else
   		 			  		MESA_C[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   		 				fi
   		 			#-------------------------------------------------------------------
   								echo -n EL JUGADOR 4 COLOCA LA CARTA
   								echo " ${JUG41[$i]} de ${JUG42[$i]}"
   								echo
   		 						unset JUG41[$i]
   								JUG41=("${JUG41[@]}")
   								unset JUG42[$i]
   		 						JUG42=("${JUG42[@]}")
   		 						FLAG2=1
   	 							((EXTREMOSUP_C++))
   		 						break;
   							elif test "${JUG41[$i]}" -eq $((EXTREMOINF_C-1))
   							then
   								MESA_C[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   								echo -n EL JUGADOR 4 COLOCA LA CARTA
   								echo " ${JUG41[$i]} de ${JUG42[$i]}"
   								echo
   		 						unset JUG41[$i]
   								JUG41=("${JUG41[@]}")
   								unset JUG42[$i]
   		 						JUG42=("${JUG42[@]}")
   		 						FLAG2=1
   		 						((EXTREMOINF_C--))
   		 						break;
   							fi
   						fi
  					fi
   				if test "$i" -eq "$((${#JUG41[*]}-1))"
  		 		then
   		 			echo -n EL JUGADOR 4 PASA DE  TURNO
  		 			echo " POR NO TENER CARTAS DISPONIBLES"
   		 			FLAG2=1 
  	 	 		fi 						
   				done
   				
   			done
   		fi
   		#-----------------------------------
   	 	#CAMBIO DE TURNO--------------------
   	 	if test "$TURNO" -eq 1; then
   		 	TURNO=2
   		elif test "$TURNO" -eq 2; then
   			TURNO=3
   		elif test "$TURNO" -eq 3; then
   			TURNO=4
   		elif test "$TURNO" -eq 4; then
   			TURNO=1
   		fi
   			
   		echo --------------------------------------
   		echo
   			
   		if test "${#JUG11[*]}" -eq 0
   		then
   			GANADOR=1
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG21[*]}"+"${#JUG31[*]}"+"${#JUG41[*]}"			
   			break;
   		elif test "${#JUG21[*]}" -eq 0
   		then
   			GANADOR=2
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG11[*]}"+"${#JUG31[*]}"+"${#JUG41[*]}"
   			break;
   		elif test "${#JUG31[*]}" -eq 0
   		then
   			GANADOR=3
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG11[*]}"+"${#JUG21[*]}"+"${#JUG41[*]}"
   			break;
   		elif test "${#JUG41[*]}" -eq 0
   		then
   			GANADOR=4
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG11[*]}"+"${#JUG21[*]}"+"${#JUG31[*]}"
   			break;
   		fi
   	 done	
   	 	 FINAL=0
		 let FINAL=FINAL+$(date +"10#%H")*3600+$(date +"10#%M")*60+$(date +"10#%S")
   		 TIEMPOTOTAL=$((FINAL-INICIO))
   		 if test "$GANADOR" -eq 1
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 1: "$PUNTOS" PUNTOS
   		 	echo
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-${#JUG41[*]} >> "$RUTA"
   		 elif test "$GANADOR" -eq 2
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 2: "$PUNTOS" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-${#JUG41[*]} >> "$RUTA"
   		 elif test "$GANADOR" -eq 3
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 3: "$PUNTOS" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-${#JUG41[*]} >> "$RUTA"
   		 elif test "$GANADOR" -eq 4
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 4: "$PUNTOS" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-${#JUG41[*]} >> "$RUTA"
   		 fi
   	 elif test "$ESTRATEGIA" -eq 1
   	 then
   	 while test "$FIN" -ne 1
   	 do
   	 	FLAG2=0
   	 	echo ---------------------------------
   	 	echo "RONDA:  $CONTR"
   	 	echo ---------------------------------
   	 	echo "TU MANO: "
   	 	for i in ${!JUG11[*]}
   	 	do
   			echo -n " $((i+1))". "${JUG11[$i]}""${JUG12[$i]}|"
   	 	done
   	 	echo
   	 	echo 
   	
   	 	echo "MANO DEL JUGADOR 2"
   	 	for i in ${!JUG21[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG21[$i]}""${JUG22[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   	 	
   	 	echo "MANO DEL JUGADOR 3"
   	 	for i in ${!JUG31[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG31[$i]}""${JUG32[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   	 	
   	 	echo "MANO DEL JUGADOR 4"
   	 	for i in ${!JUG41[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG41[$i]}""${JUG42[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   		 
   	 	echo "MESA:"
   	 	echo "${MESA_O[*]}"
   	 	echo "${MESA_B[*]}"
   	  	echo "${MESA_E[*]}"
   		echo "${MESA_C[*]}"
   	 	echo
   	 	echo
   		 	
   	 	if test "$EXTREMOSUP_O" -eq 7
   	 	then
   	 		let EXTREMOSUP_O=EXTREMOSUP_O+2
   	 	elif test "$EXTREMOSUP_B" -eq 7
   	 	then
   	 		let EXTREMOSUP_B=EXTREMOSUP_B+2
   	 	elif test "$EXTREMOSUP_E" -eq 7
   	 	then
   	 		let EXTREMOSUP_E=EXTREMOSUP_E+2
   	 	elif test "$EXTREMOSUP_C" -eq 7
   	 	then
   			let EXTREMOSUP_C=EXTREMOSUP_C+2
   		fi
   		
   		if test "$TURNO" -eq 1
   		then
   			jugador1
   		elif test "$TURNO" -eq 2
   		then
   			jugador2E1
   		elif test "$TURNO" -eq 3
   		then
   			jugador3E1
   		elif test "$TURNO" -eq 4
   		then
   			((CONTR++))
   			echo
   			echo -------------TURNO DEL JUGADOR 4-------------
   			echo
   		 	if test "$COMIENZO" -eq 4
   			then
   			 	for i in ${!JUG41[*]}; do
   			 		if test "${JUG41[$i]}" -eq 5 -a "${JUG42[$i]}" = "O"
   			 		then
   			 			MESA_O[4]="5O"
   			 			echo EL JUGADOR 4 COLOCA LA CARTA 5 de O
   						echo
   			 			unset JUG41[$i]
   						JUG41=("${JUG41[@]}")
   						unset JUG42[$i]
   		 				JUG42=("${JUG42[@]}")
   		 				EXTREMOSUP_O=5
   	 					EXTREMOINF_O=5
						FLAG2=1
						COMIENZO=0
						break;
   			 		fi
   			 	done
   			fi
   			while test "$FLAG2" -eq 0; do
   				MAYORV=0
   				MAYORP="0"
   				for i in ${!JUG41[*]}; do
   				if test "${JUG41[$i]}" -gt 5
   			 	then
   			 		if test "${JUG42[$i]}" = "O"
   			 		then
   			 			if test "${JUG41[$i]}" -eq $((EXTREMOSUP_O+1))
   						then
   							#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 				if test ${JUG41[$i]} -gt 9
   			 				then
   			 				case ${JUG41[$i]} in
   			 					10)
   			 					MESA_O[7]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;	
   			 					11)
   			 					MESA_O[8]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;
   			 					12)
   			 					MESA_O[9]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;
   			 				esac
   			 				else
   			 		  			MESA_O[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   			 				fi
   			 		#-------------------------------------------------------------------
   							echo -n EL JUGADOR 4 COLOCA LA CARTA
   							echo " ${JUG41[$i]} de ${JUG42[$i]}"
   							echo
   							unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   			 				FLAG2=1
   			 				((EXTREMOSUP_O++))
   			 				break;
   						fi
   			 		elif test "${JUG42[$i]}" = "B"
   			 		then
   			 			if test "${JUG41[$i]}" -eq $((EXTREMOSUP_B+1))
   							then
   						#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 					if test ${JUG41[$i]} -gt 9
   		 					then
   		 					case ${JUG41[$i]} in
   		 						10)
   		 						MESA_B[7]="${JUG41[$i]}${JUG42[$i]}"
   		 						;;	
   								11)
   		 						MESA_B[8]="${JUG41[$i]}${JUG42[$i]}"
   		 						;;
   		 						12)
   		 						MESA_B[9]="${JUG41[$i]}${JUG42[$i]}"
   		 						;;
   		 					esac
   		 					else
   		 			  			MESA_B[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   		 					fi
   		 			#-------------------------------------------------------------------
   								echo -n EL JUGADOR 4 COLOCA LA CARTA
   								echo " ${JUG41[$i]} de ${JUG42[$i]}"
   								echo
   								unset JUG41[$i]
   								JUG41=("${JUG41[@]}")
   								unset JUG42[$i]
   			 					JUG42=("${JUG42[@]}")
   			 					FLAG2=1
   			 					((EXTREMOSUP_B++))
   			 					break;
   			 			fi
   			 		elif test "${JUG42[$i]}" = "E"
   			 		then
   			 			if test "${JUG41[$i]}" -eq $((EXTREMOSUP_E+1))
   							then
   					#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 				if test ${JUG41[$i]} -gt 9
   			 				then
   			 				case ${JUG41[$i]} in
   			 					10)
   			 					MESA_E[7]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;	
   			 					11)
   			 					MESA_E[8]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;
   			 					12)
   			 					MESA_E[9]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;
   			 				esac
   			 				else
   			 		  			MESA_E[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   			 				fi
   					#-------------------------------------------------------------------
   								echo -n EL JUGADOR 4 COLOCA LA CARTA
   								echo " ${JUG41[$i]} de ${JUG42[$i]}"
   								echo
   								unset JUG41[$i]
   								JUG41=("${JUG41[@]}")
   								unset JUG42[$i]
   			 					JUG42=("${JUG42[@]}")
   			 					FLAG2=1
   			 					((EXTREMOSUP_E++))
   			 					break;
   			 			fi
   			 		elif test "${JUG42[$i]}" = "C"
   			 		then
   			 			if test "${JUG41[$i]}" -eq $((EXTREMOSUP_C+1))
   							then
   					#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 					if test ${JUG41[$i]} -gt 9
   		 					then
   		 					case ${JUG41[$i]} in
   		 						10)
   		 						MESA_C[7]="${JUG41[$i]}${JUG42[$i]}"
   		 						;;	
   		 						11)
   		 						MESA_C[8]="${JUG41[$i]}${JUG42[$i]}"
   		 						;;
   		 						12)
   		 						MESA_C[9]="${JUG41[$i]}${JUG42[$i]}"
   								;;
   		 					esac
   							else
   		 			  			MESA_C[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   		 					fi
   		 			#-------------------------------------------------------------------
   								echo -n EL JUGADOR 4 COLOCA LA CARTA
   								echo " ${JUG41[$i]} de ${JUG42[$i]}"
   								echo
   		 						unset JUG41[$i]
   								JUG41=("${JUG41[@]}")
   								unset JUG42[$i]
   		 						JUG42=("${JUG42[@]}")
   		 						FLAG2=1
   	 							((EXTREMOSUP_C++))
   		 						break;
   		 				fi
   			 		fi	
   			 	fi
   				done
   				if test "$FLAG2" -eq 1
   				then
   					break;
   				fi
   				for i in ${!JUG41[*]}; do
   				if test "${JUG41[$i]}" -le 5
   			 	then
   			 		if test "${JUG42[$i]}" = "O"
   					then
   						if test "${JUG41[$i]}" -eq $((EXTREMOINF_O-1))
   						then
   							MESA_O[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   							echo -n EL JUGADOR 4 COLOCA LA CARTA
   							echo " ${JUG41[$i]} de ${JUG42[$i]}"
   							echo
   			 				unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   			 				FLAG2=1
   			 				((EXTREMOINF_O--))
   			 				break;
   						fi
   					elif test "${JUG42[$i]}" = "B"
   					then
   						if test "${JUG41[$i]}" -eq 5
   						then
   							MESA_B[4]="5B"
   							echo EL JUGADOR 4 COLOCA LA CARTA 5 de B
   							echo
   							unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   							EXTREMOSUP_B=5
   							EXTREMOINF_B=5
							FLAG2=1
							break;
   						else
   							if test "${JUG41[$i]}" -eq $((EXTREMOINF_B-1))
   							then
   								MESA_B[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   								echo -n EL JUGADOR 4 COLOCA LA CARTA
   								echo " ${JUG41[$i]} de ${JUG42[$i]}"
   								echo
   			 					unset JUG41[$i]
   								JUG41=("${JUG41[@]}")
   								unset JUG42[$i]
   			 					JUG42=("${JUG42[@]}")
   								FLAG2=1
   								((EXTREMOINF_B--))
   								break;  			 					
   							fi
   						fi
   					elif test "${JUG42[$i]}" = "E"
   					then
   						if test "${JUG41[$i]}" -eq 5
   						then
   							MESA_E[4]="5E"
   							echo EL JUGADOR 4 COLOCA LA CARTA 5 de E
   							echo
   							unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   							EXTREMOSUP_E=5
   							EXTREMOINF_E=5
							FLAG2=1
							break;
   						else
   							if test "${JUG41[$i]}" -eq $((EXTREMOINF_E-1))
   							then
   								MESA_E[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   								echo -n EL JUGADOR 4 COLOCA LA CARTA
   								echo " ${JUG41[$i]} de ${JUG42[$i]}"
   								echo
   			 					unset JUG41[$i]
   								JUG41=("${JUG41[@]}")
   								unset JUG42[$i]
   			 					JUG42=("${JUG42[@]}")
   								FLAG2=1
   								((EXTREMOINF_E--))
   								break;  			 					
   							fi
   						fi
   					elif test "${JUG42[$i]}" = "C"
   					then
   						if test "${JUG41[$i]}" -eq 5
   						then
   							MESA_C[4]="5C"
   							echo EL JUGADOR 4 COLOCA LA CARTA 5 de C
   							echo
   							unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   							EXTREMOSUP_C=5
   							EXTREMOINF_C=5
							FLAG2=1
							break;
   						else
   							if test "${JUG41[$i]}" -eq $((EXTREMOINF_C-1))
   							then
   								MESA_C[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   								echo -n EL JUGADOR 4 COLOCA LA CARTA
   								echo " ${JUG41[$i]} de ${JUG42[$i]}"
   								echo
   			 					unset JUG41[$i]
   								JUG41=("${JUG41[@]}")
   								unset JUG42[$i]
   			 					JUG42=("${JUG42[@]}")
   								FLAG2=1
   								((EXTREMOINF_C--))
   								break;  			 					
   							fi
   						fi
   					fi 
   			 	fi	
   				done
   				if test "$FLAG2" -eq 1
   				then
   					break;
   				fi
   			if test "$i" -eq "$((${#JUG41[*]}-1))"
  		 	then
   		 		echo -n EL JUGADOR 4 PASA DE  TURNO
  		 		echo " POR NO TENER CARTAS DISPONIBLES"
   		 		FLAG2=1 
  	 	 	fi 
   			done
   		fi
   		#-----------------------------------
   	 	#CAMBIO DE TURNO--------------------
   	 	if test "$TURNO" -eq 1; then
   		 	TURNO=2
   		elif test "$TURNO" -eq 2; then
   			TURNO=3
   		elif test "$TURNO" -eq 3; then
   			TURNO=4
   		elif test "$TURNO" -eq 4; then
   			TURNO=1
   		fi
   			
   		echo --------------------------------------
   		echo
   			
   		if test "${#JUG11[*]}" -eq 0
   		then
   			GANADOR=1
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG21[*]}"+"${#JUG31[*]}"+"${#JUG41[*]}"		
   			break;
   		elif test "${#JUG21[*]}" -eq 0
   		then
   			GANADOR=2
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG11[*]}"+"${#JUG31[*]}"+"${#JUG41[*]}"
   			break;
   		elif test "${#JUG31[*]}" -eq 0
   		then
   			GANADOR=3
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG11[*]}"+"${#JUG21[*]}"+"${#JUG41[*]}"
   			break;
   		elif test "${#JUG41[*]}" -eq 0
   		then
   			GANADOR=4
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG11[*]}"+"${#JUG21[*]}"+"${#JUG31[*]}"
   			break;
   		fi
   	 done
   	 	 FINAL=0
		 let FINAL=FINAL+$(date +"10#%H")*3600+$(date +"10#%M")*60+$(date +"10#%S")
   		 TIEMPOTOTAL=$((FINAL-INICIO))
   		 if test "$GANADOR" -eq 1
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 1: "$PUNTOS" PUNTOS
   		 	echo
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-${#JUG41[*]} >> "$RUTA"
   		 elif test "$GANADOR" -eq 2
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 2: "$PUNTOS" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-${#JUG41[*]} >> "$RUTA"
   		 elif test "$GANADOR" -eq 3
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 3: "$PUNTOS" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-${#JUG41[*]} >> "$RUTA"
   		 elif test "$GANADOR" -eq 4
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 4: "$PUNTOS" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-${#JUG41[*]} >> "$RUTA"
   		 fi
   	 elif test "$ESTRATEGIA" -eq 2
   	 then
   	 while test "$FIN" -ne 1
   	 do
   	 	FLAG2=0
   	 	echo ---------------------------------
   	 	echo "RONDA:  $CONTR"
   	 	echo ---------------------------------
   	 	echo "TU MANO: "
   	 	for i in ${!JUG11[*]}
   	 	do
   			echo -n " $((i+1))". "${JUG11[$i]}""${JUG12[$i]}|"
   	 	done
   	 	echo
   	 	echo 
   	
   	 	echo "MANO DEL JUGADOR 2"
   	 	for i in ${!JUG21[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG21[$i]}""${JUG22[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   	 	
   	 	echo "MANO DEL JUGADOR 3"
   	 	for i in ${!JUG31[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG31[$i]}""${JUG32[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   	 	
   	 	echo "MANO DEL JUGADOR 4"
   	 	for i in ${!JUG41[*]}
   	 	do
   		 	echo -n " $((i+1))". "${JUG41[$i]}""${JUG42[$i]}|"
   	 	done 
   	 	echo
   	 	echo
   		 
   	 	echo "MESA:"
   	 	echo "${MESA_O[*]}"
   	 	echo "${MESA_B[*]}"
   	  	echo "${MESA_E[*]}"
   		echo "${MESA_C[*]}"
   	 	echo
   	 	echo
   		 	
   	 	if test "$EXTREMOSUP_O" -eq 7
   	 	then
   	 		let EXTREMOSUP_O=EXTREMOSUP_O+2
   	 	elif test "$EXTREMOSUP_B" -eq 7
   	 	then
   	 		let EXTREMOSUP_B=EXTREMOSUP_B+2
   	 	elif test "$EXTREMOSUP_E" -eq 7
   	 	then
   	 		let EXTREMOSUP_E=EXTREMOSUP_E+2
   	 	elif test "$EXTREMOSUP_C" -eq 7
   	 	then
   			let EXTREMOSUP_C=EXTREMOSUP_C+2
   		fi
   		
   		if test "$TURNO" -eq 1
   		then
   			jugador1
   		elif test "$TURNO" -eq 2
   		then
   			jugador2E2
   		elif test "$TURNO" -eq 3
   		then
   			jugador3E2
   		elif test "$TURNO" -eq 4
   		then
   			((CONTR++))
   			echo
   			echo -------------TURNO DEL JUGADOR 4-------------
   			echo
   		 	if test "$COMIENZO" -eq 4
   			then
   			 	for i in ${!JUG41[*]}; do
   			 		if test "${JUG41[$i]}" -eq 5 -a "${JUG42[$i]}" = "O"
   			 		then
   			 			MESA_O[4]="5O"
   			 			echo EL JUGADOR 4 COLOCA LA CARTA 5 de O
   						echo
   			 			unset JUG41[$i]
   						JUG41=("${JUG41[@]}")
   						unset JUG42[$i]
   		 				JUG42=("${JUG42[@]}")
   		 				EXTREMOSUP_O=5
   	 					EXTREMOINF_O=5
						FLAG2=1
						COMIENZO=0
						break;
   			 		fi
   			 	done
   			fi
   			while test "$FLAG2" -eq 0; do
   				for i in ${!JUG41[*]}; do
   				if test "${JUG41[$i]}" -lt 5
   			 	then
   			 		if test "${JUG42[$i]}" = "O"
   					then
   						if test "${JUG41[$i]}" -eq $((EXTREMOINF_O-1))
   						then
   							MESA_O[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   							echo -n EL JUGADOR 4 COLOCA LA CARTA
   							echo " ${JUG41[$i]} de ${JUG42[$i]}"
   							echo
   			 				unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   			 				FLAG2=1
   			 				((EXTREMOINF_O--))
   			 				break;
   						fi
   					elif test "${JUG42[$i]}" = "B"
   					then
   						if test "${JUG41[$i]}" -eq $((EXTREMOINF_B-1))
   						then
   							MESA_B[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   							echo -n EL JUGADOR 4 COLOCA LA CARTA
   							echo " ${JUG41[$i]} de ${JUG42[$i]}"
   							echo
   			 				unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   							FLAG2=1
   							((EXTREMOINF_B--))
   							break;  			 					
   						fi
   					elif test "${JUG42[$i]}" = "E"
   					then
   						if test "${JUG41[$i]}" -eq $((EXTREMOINF_E-1))
   						then
   							MESA_E[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   							echo -n EL JUGADOR 4 COLOCA LA CARTA
   							echo " ${JUG41[$i]} de ${JUG42[$i]}"
   							echo
   			 				unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   							FLAG2=1
   							((EXTREMOINF_E--))
   							break;  			 					
   						fi
   					elif test "${JUG42[$i]}" = "C"
   					then
   						if test "${JUG41[$i]}" -eq $((EXTREMOINF_C-1))
   						then
   							MESA_C[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   							echo -n EL JUGADOR 4 COLOCA LA CARTA
   							echo " ${JUG41[$i]} de ${JUG42[$i]}"
   							echo
   			 				unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   							FLAG2=1
   							((EXTREMOINF_C--))
   							break;  			 					
   						fi
   					fi
   			 	fi
   			 	done
   			 	
   			 	if test "$FLAG2" -eq 1
   				then
   					break;
   				fi
   				
   				for i in ${!JUG41[*]}; do
   				if test "${JUG41[$i]}" -ge 5
   			 	then
   			 		if test "${JUG42[$i]}" = "O"
   					then
   						if test "${JUG41[$i]}" -eq $((EXTREMOSUP_O+1))
   						then
   							#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 				if test ${JUG41[$i]} -gt 9
   			 				then
   			 				case ${JUG41[$i]} in
   			 					10)
   			 					MESA_O[7]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;	
   			 					11)
   			 					MESA_O[8]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;
   			 					12)
   			 					MESA_O[9]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;
   			 				esac
   			 				else
   			 		  			MESA_O[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   			 				fi
   			 		#-------------------------------------------------------------------
   							echo -n EL JUGADOR 4 COLOCA LA CARTA
   							echo " ${JUG41[$i]} de ${JUG42[$i]}"
   							echo
   							unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   			 				FLAG2=1
   			 				((EXTREMOSUP_O++))
   			 				break;
   						fi
   					elif test "${JUG42[$i]}" = "B"
   					then
   						if test "${JUG41[$i]}" -eq 5
   						then
   							MESA_B[4]="5B"
   							echo EL JUGADOR 4 COLOCA LA CARTA 5 de B
   							echo
   							unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   							EXTREMOSUP_B=5
   							EXTREMOINF_B=5
							FLAG2=1
							break;
   						else
   						    if test "${JUG41[$i]}" -eq $((EXTREMOSUP_B+1))
   						    then
   						#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 					   if test ${JUG41[$i]} -gt 9
   		 					   then
   		 					   case ${JUG41[$i]} in
   		 						10)
   		 						MESA_B[7]="${JUG41[$i]}${JUG42[$i]}"
   		 						;;	
   								11)
   		 						MESA_B[8]="${JUG41[$i]}${JUG42[$i]}"
   		 						;;
   		 						12)
   		 						MESA_B[9]="${JUG41[$i]}${JUG42[$i]}"
   		 						;;
   		 					   esac
   		 					   else
   		 			  			MESA_B[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   		 					   fi
   		 			#-------------------------------------------------------------------
   								echo -n EL JUGADOR 4 COLOCA LA CARTA
   								echo " ${JUG41[$i]} de ${JUG42[$i]}"
   								echo
   								unset JUG41[$i]
   								JUG41=("${JUG41[@]}")
   								unset JUG42[$i]
   			 					JUG42=("${JUG42[@]}")
   			 					FLAG2=1
   			 					((EXTREMOSUP_B++))
   			 					break;
   			 			    fi
   						fi
   					elif test "${JUG42[$i]}" = "E"
   					then
   						if test "${JUG41[$i]}" -eq 5
   						then
   							MESA_E[4]="5E"
   							echo EL JUGADOR 4 COLOCA LA CARTA 5 de E
   							echo
   							unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   							EXTREMOSUP_E=5
   							EXTREMOINF_E=5
							FLAG2=1
							break;
   						else
   						   if test "${JUG41[$i]}" -eq $((EXTREMOSUP_E+1))
   						   then
   					#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   			 				if test ${JUG41[$i]} -gt 9
   			 				then
   			 				case ${JUG41[$i]} in
   			 					10)
   			 					MESA_E[7]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;	
   			 					11)
   			 					MESA_E[8]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;
   			 					12)
   			 					MESA_E[9]="${JUG41[$i]}${JUG42[$i]}"
   			 					;;
   			 				esac
   			 				else
   			 		  			MESA_E[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   			 				fi
   					#-------------------------------------------------------------------
   								echo -n EL JUGADOR 4 COLOCA LA CARTA
   								echo " ${JUG41[$i]} de ${JUG42[$i]}"
   								echo
   								unset JUG41[$i]
   								JUG41=("${JUG41[@]}")
   								unset JUG42[$i]
   			 					JUG42=("${JUG42[@]}")
   			 					FLAG2=1
   			 					((EXTREMOSUP_E++))
   			 					break;
   			 			   fi
   						fi
   					elif test "${JUG42[$i]}" = "C"
   					then
   						if test "${JUG41[$i]}" -eq 5
   						then
   							MESA_C[4]="5C"
   							echo EL JUGADOR 4 COLOCA LA CARTA 5 de C
   							echo
   							unset JUG41[$i]
   							JUG41=("${JUG41[@]}")
   							unset JUG42[$i]
   			 				JUG42=("${JUG42[@]}")
   							EXTREMOSUP_C=5
   							EXTREMOINF_C=5
							FLAG2=1
							break;
   						else
   						   if test "${JUG41[$i]}" -eq $((EXTREMOSUP_C+1))
   						   then
   					#COMPROBACION POR SI NOS PASAMOS DE POSICION EN EL ARRAY DE LA MESA
   		 					if test ${JUG41[$i]} -gt 9
   		 					then
   		 					case ${JUG41[$i]} in
   		 						10)
   		 						MESA_C[7]="${JUG41[$i]}${JUG42[$i]}"
   		 						;;	
   		 						11)
   		 						MESA_C[8]="${JUG41[$i]}${JUG42[$i]}"
   		 						;;
   		 						12)
   		 						MESA_C[9]="${JUG41[$i]}${JUG42[$i]}"
   								;;
   		 					esac
   							else
   		 			  			MESA_C[${JUG41[$i]}-1]="${JUG41[$i]}${JUG42[$i]}"
   		 					fi
   		 			#-------------------------------------------------------------------
   								echo -n EL JUGADOR 4 COLOCA LA CARTA
   								echo " ${JUG41[$i]} de ${JUG42[$i]}"
   								echo
   		 						unset JUG41[$i]
   								JUG41=("${JUG41[@]}")
   								unset JUG42[$i]
   		 						JUG42=("${JUG42[@]}")
   		 						FLAG2=1
   	 							((EXTREMOSUP_C++))
   		 						break;
   		 				     fi
   						fi
   					fi
   			 	fi
   			 	done
   			 if test "$FLAG2" -eq 1
   			 then
   				 break;
   			 fi
   			 
   			if test "$i" -eq "$((${#JUG41[*]}-1))"
  		 	then
   		 		echo -n EL JUGADOR 4 PASA DE  TURNO
  		 		echo " POR NO TENER CARTAS DISPONIBLES"
   		 		FLAG2=1 
  	 	 	fi 
   			done
   		fi
   		#-----------------------------------
   	 	#CAMBIO DE TURNO--------------------
   	 	if test "$TURNO" -eq 1; then
   		 	TURNO=2
   		elif test "$TURNO" -eq 2; then
   			TURNO=3
   		elif test "$TURNO" -eq 3; then
   			TURNO=4
   		elif test "$TURNO" -eq 4; then
   			TURNO=1
   		fi
   			
   		echo --------------------------------------
   		echo
   			
   		if test "${#JUG11[*]}" -eq 0
   		then
   			GANADOR=1
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG21[*]}"+"${#JUG31[*]}"+"${#JUG41[*]}"		
   			break;
   		elif test "${#JUG21[*]}" -eq 0
   		then
   			GANADOR=2
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG11[*]}"+"${#JUG31[*]}"+"${#JUG41[*]}"
   			break;
   		elif test "${#JUG31[*]}" -eq 0
   		then
   			GANADOR=3
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG11[*]}"+"${#JUG21[*]}"+"${#JUG41[*]}"
   			break;
   		elif test "${#JUG41[*]}" -eq 0
   		then
   			GANADOR=4
   			FIN=1
   			let PUNTOS=PUNTOS+"${#JUG11[*]}"+"${#JUG21[*]}"+"${#JUG31[*]}"
   			break;
   		fi
   	 done
   	 	 FINAL=0
		 let FINAL=FINAL+$(date +"10#%H")*3600+$(date +"10#%M")*60+$(date +"10#%S")
   		 TIEMPOTOTAL=$((FINAL-INICIO))
   		 if test "$GANADOR" -eq 1
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 1: "$PUNTOS" PUNTOS
   		 	echo
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-${#JUG41[*]} >> "$RUTA"
   		 elif test "$GANADOR" -eq 2
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 2: "$PUNTOS" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-${#JUG41[*]} >> "$RUTA"
   		 elif test "$GANADOR" -eq 3
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 3: "$PUNTOS" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-${#JUG41[*]} >> "$RUTA"
   		 elif test "$GANADOR" -eq 4
   		 then
   		 	echo EL GANADOR ES EL JUGADOR 4: "$PUNTOS" PUNTOS
   		 	echo -n $(date +"%d%m%y")'|'$(date +"%H:%M:%S")'|'$JUGADORES'|'$TIEMPOTOTAL'|' >> "$RUTA"
   		 	echo -n $CONTR'|'$GANADOR'|'$PUNTOS'|' >> "$RUTA"
   		 	echo ${#JUG11[*]}-${#JUG21[*]}-${#JUG31[*]}-${#JUG41[*]} >> "$RUTA"
   		 fi
   	 fi
   	 #------------------------------------------------------------
    fi
}

function comprobacion {

    if test ! -f "./config.cfg"
    then
   	 echo
   	 echo "------------------------------------------------------------------------"
   	 echo "      EL FICHERO CONFIG.CFG DEBE EXISTIR ANTES DE EJECUTAR EL PROGRAMA"
   	 echo "      Y ESTAR EN EL MISMO DIRECTORIO"
   	 echo "      SALIENDO DEL PROGRAMA"
   	 echo "------------------------------------------------------------------------"
   	 exit 0
   	 
    elif test ! -r "./config.cfg"
    then
   	 echo
   	 echo "------------------------------------------------------------------------"
   	 echo "      EL FICHERO CONFIG.CFG NO TIENE LOS PERMISOS DE LECTURA NECESARIOS"
   	 echo "      SALIENDO DEL PROGRAMA"
   	 echo "------------------------------------------------------------------------"
   	 echo
   	 exit 0
    
    elif test ! -w "./config.cfg"
    then
   	 echo
   	 echo "------------------------------------------------------------------------"
   	 echo "      EL FICHERO CONFIG.CFG NO TIENE LOS PERMISOS DE ESCRITURA NECESARIOS"
   	 echo "      SALIENDO DEL PROGRAMA"
   	 echo "------------------------------------------------------------------------"
   	 echo
   	 exit 0    
    elif [ ! -s "./config.cfg" ]
    then
    	echo
    	echo "------------------------------------------------------------------------"
    	echo EL FICHERO CONFIG NO PUEDE ESTAR VACIO
    	echo "------------------------------------------------------------------------"
    	echo
    	exit 0
    fi

}

#///////////////////////////PROGRAMA PRINCIPAL
clear
comprobacion

if test "$#" -gt "1"
then
echo
echo "------------------------------------------------------------------"
echo "ERROR, NO SE PUEDE PASAR MAS DE UN ARGUMENTO:"
echo "  -Ejecuta el programa sin argumentos"
echo "  -Ejecuta con el argumento [-g] para ver informacion adicional"
echo "------------------------------------------------------------------"
echo
exit 0
fi

if test -n "$1"
then
    	if test "$1" = "-g"
    	then
   		 echo
   		 echo "---------------------------------------------------------"
   		 echo "INTEGRANTES DEL GRUPO: "
   		 echo "Izan Jiménez Chaves, DNI: 71049459K"
   		 echo "Ekaitz Hernández Morán, DNI: 71046906K"
   		 echo
   		 echo "INFORMACION SOBRE LAS ESTRATEGIAS IMPLEMENTADAS: "
   		 echo "---------------------------------------------------------"
   		 echo "    -Estretegia 0: los jugadores colocaran la primera carta disponible sin seguir un patrón"
 		 echo -n "    -Estrategia 1: los jugadores priorizaran colocar las cartas de menor valor "
 		 echo "y guardan las de mayor valor para el final"
 		 echo -n "    -Estrategia 2: los jugadores priorizaran colocar las cartas de mayor valor "
 		 echo "y guardan las de menor valor para el final"
   		 echo
   		 exit 0
    	else
   		 echo
   		 echo "--------------------------------------------------------------------------------"
   		 echo "ARGUMENTO MAL FORMULADO O NO DISPONIBLE"
   		 echo "   -Prueba ejecutando el programa sin argumentos"
   		 echo "   -Prueba a ejecutarlo con el argumento [-g] para ver informacion adicional"
   		 echo "--------------------------------------------------------------------------------"
   		 echo
   		 exit 0
    	fi
fi

OP_MENU="0"
JUGADORES=0
ESTRATEGIA=0
RUTA="0"
SEGURO=1
while IFS== read VAR1 VAR2
do
    if test "$VAR1" = "JUGADORES" -a "$SEGURO" -eq 1
    then
   	 JUGADORES=$VAR2    
   	 SEGURO=2
    elif test "$VAR1" = "ESTRATEGIA" -a "$SEGURO" -eq 2
    then
   	 ESTRATEGIA=$VAR2
   	 SEGURO=3
    elif test "$VAR1" = "LOG" -a "$SEGURO" -eq 3
    then
   	 RUTA=$VAR2
    else
    	 echo
    	 echo EL FICHERO CONFIG NO TIENE LA ESTRUCTURA NECESARIA
    	 echo
    	 exit 0
    fi
done < config.cfg
#------------------------------------------COMPROBACION FICHERO.LOG
if test ! -f "$RUTA"
then
    echo
    echo "LA RUTA DEL FICHERO.LOG NO EXISTE"
    echo
    exit 0
elif test ! -r "$RUTA"
then
    echo
    echo "ATENCION: EL FICHERO NO TIENE PERMISOS DE LECTURA"
    echo
    exit 0
elif test ! -w "$RUTA"
then
    echo
    echo "EL FICHERO NO TIENE PERMISOS DE ESCRITURA"
    echo
    exit 0
fi
#-------------------------------------------------------------------
   					 
while test "$OP_MENU" != "S" -a "$OP_MENU" != "s"
do    
    
    clear
    echo
    echo '--------MENU PRINCIPAL--------'
    echo 'C) CONFIGURACION'
    echo 'J) JUGAR'
    echo 'E) ESTADISTICAS'
    echo 'F) CLASIFICACION'
    echo 'S) SALIR'
    echo -n '"5illo". Introduzca una opcion >>  '
    read -n1 OP_MENU
    
    case $OP_MENU in
   	 
   	 C|c)
   		 echo
   		 configuracion
   		 while IFS== read VAR1 VAR2
		 do
   		 	if test "$VAR1" = "JUGADORES"
    			then
   	 			JUGADORES=$VAR2    
   	 			CONTADOR=2
    			elif test "$VAR1" = "ESTRATEGIA"
    			then
   	 			ESTRATEGIA=$VAR2
   	 			CONTADOR=3
    			elif test "$VAR1" = "LOG"
    			then
   	 			RUTA=$VAR2  
    			fi
		 done < config.cfg
   		 echo -n "Pulse intro para continuar >> "
   		 read
   		 echo
   		 ;;
   		 
   	 J|j)
   		 echo
   		 jugar
   		 echo -n "Pulse intro para continuar >> "
   		 read
   		 echo
   		 ;;
   	 E|e)    
   		 echo
   		 if [[ -s "$RUTA" ]]
		 then
		 	estadisticas
		 else
			clear
		 	echo
		 	echo -------------------------------------------------------------------------------
			echo EL FICHERO NO TIENE CONTENIDO POR TANTO NO SE PUEDEN MOSTRAR LAS ESTADISTICAS
			echo -------------------------------------------------------------------------------
			echo
		 fi	 
   		 echo -n "Pulse intro para continuar >> "
   		 read
   		 echo
   		 ;;
   	 F|f)
   		 echo
   		 if [[ -s "$RUTA" ]]
		 then
		 	clasificacion
		 	
		 else
			clear
		 	echo
		 	echo -------------------------------------------------------------------------------
			echo EL FICHERO NO TIENE CONTENIDO POR TANTO NO SE PUEDEN MOSTRAR LA CLASIFICACION
			echo -------------------------------------------------------------------------------
			echo
		 fi			 
   		 echo -n "Pulse intro para continuar >> "
   		 read
   		 echo
   		 ;;
   	 S|s)
   		 echo
   		 echo "-------SALIENDO DEL PROGRAMA-------"
   		 echo
   		 
   		 ;;
   	 *)    
   		 echo
   		 echo "-------ERROR, OPCION NO VALIDA-------"
   		 sleep 1
   		 ;;
    esac    
   	 
done
exit 0

