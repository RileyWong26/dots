startline="0"
logowidth="25"
c1="#FFFFFF"
fulloutput=(
'                ..ooo.                    %s'
'             .888888888.                  %s'
'           88"P""T"T888 8o                %s'
'         o8o 8.8"8 88o."8o 8o             %s'
'       88 . o88o8 8 88."8 88P"o           %s' 
'      88 o8 88 oo.8 888 8 888 88          %s' 
'      88 88 88o888" 88"  o888 88          %s'
'      88."8o."T88P.88". 88888 88          %s'
'      888."888."88P".o8 8888 888          %s'
'      "888o"8888oo8888 o888 o8P"          %s'    
'       "8888.""888P"P.888".88P            %s'
'        "88888ooo  888P".o888             %s'
'          ""8P"".oooooo8888P              %s'
' .oo888ooo.    88NICK888P8                %s'
'o88888"888"88o.  "8888"".88   .oo888oo..   %s'
'8888" "88 88888.       88".o88888888"888. %s'
'"8888o.""o 88"88o.    o8".888"888"88 "88P %s'
' T888C.oo. "8."8"8   o8"o888 o88" ".=888" %s'
'  88888888o "8 8 8  .8 .8"88 8"".o888o8P  %s'
'   "8888C.o8o  8 8  8" 8 o" ...o"""8888   %s'
'     "88888888 " 8 .8  8   88888888888"   %s'
'        "8888888o  .8o=" o8o..o(8oo88"    %s'
'           "888" 88"    888888888""       %s'
'               o8P       "888"""          %s'
'         ...oo88                          %s'
'"8oo...oo888""                            %s'
'   ""888""                                %s'
) 
myhostname=$(echo -e "${labelcolor} ${hostname}"); out_array=( "${out_array[@]}" "$myhostname" )
		mydistro=$(echo -e "$labelcolor OS:$textcolor $distro $distro_ver"); out_array=( "${out_array[@]}" "$mydistro" )
		mydevice=$(echo -e "$labelcolor Device:$textcolor $device"); out_array=( "${out_array[@]}" "$mydevice" )
		myrom=$(echo -e "$labelcolor ROM:$textcolor $rom"); out_array=( "${out_array[@]}" "$myrom" )
		mybaseband=$(echo -e "$labelcolor Baseband:$textcolor $baseband"); out_array=( "${out_array[@]}" "$mybaseband" )
		mykernel=$(echo -e "$labelcolor Kernel:$textcolor $kernel"); out_array=( "${out_array[@]}" "$mykernel" )
		myuptime=$(echo -e "$labelcolor Uptime:$textcolor $uptime"); out_array=( "${out_array[@]}" "$myuptime" )
		mycpu=$(echo -e "$labelcolor CPU:$textcolor $cpu"); out_array=( "${out_array[@]}" "$mycpu" )
		mygpu=$(echo -e "$labelcolor GPU:$textcolor $cpu"); out_array=( "${out_array[@]}" "$mygpu" )
		mymem=$(echo -e "$labelcolor RAM:$textcolor $mem"); out_array=( "${out_array[@]}" "$mymem" )
# fulloutput={
# "                o8888888o.                                        
#            88;;     *88o   o8888888o                        +    
#           o88OOo;     *8888*      *88o                     ##    
#         o88*  *OO;;;;OO    OOo;    OO88o                  ###+   
#        88;;;;;;OO]]OO*   OO *OO;;Oo   *88o              +#####   
#        88;;;;OO;;;;;;;;OOOO  OOOOOO      88o          +#######+  
#       o88]];;OO;;;;;;OOOO* OO  OO;;       *88      +###########  
#     o88OOOO;;;;OO]]OOOO*   OO   *Oo;;       88  +##########;;##+ 
#    88]]]]OO]];;OOOO;;      OO    OO;;        ############*;;;##+ 
#   o88]]OO]]OO]];;;;;;;;OOOO;;;;  *Oo;;;      ###########*::##### 
#  88]]]]OO]]]]OOOOOO;;OOOO;;;;;;    OO;;     +##############**;;#+
#  88;;]]OO]];;;;;;;*OOOO]];;;;;;    OO;;    +#############*::*####
#  88;;]]OO;;;;;;;;      *OOo;;;;  OO*;;;   +############::*##*;;##
#   *88;;]]OO;;;;;;;;;;;;   *OOOOOO*;;;   +################*::*++##
#     *88OO]]OO;;;;;oOOOOOOOO]];;;;;;;; +################*::*######
#      88]];;]]OOOOOO*;;;;; *OO;;;;;;  ## +##############::##*:####
#      88;;;;;;;;;;;;;;;;;;  OO;;;;;+##+   ############::##*::*####
#      88;;;;;;;;;;;;;;;;;; oOO######+      +############*::*######
#      88o;;;;;;;;;;;;;;; +########LL#+      +###########::##*:++#+
#       *88o;;;;;;;;;;; +##########BBLL#+      +#######::##*:++##+ 
#         *8888o;;;  .+##+   +###BBBBBB##+    +  +#######*:++##+   
#              +###########+     +#########+ ##    +########+      
#            +################+       +######GG##+     ##          
#           +####################+      +######GG##+   #+          
#         +###############################+   +#GG##+ ##          
#        +#################;;###;;#####+         +#######+         
#       +############::##:::##;;####                +###GG#+      
#      +###########::###:::##;;####                      ##GG#+    
#     +########::##::##::##;;;;##+                       ####GG##+ 
#    #####;;#::##::###:;###;;###+                     +########GG##
#   ####;;###;;##;;##;;##;;###+                               +####
#  +####frank behnsen#####+                                     +##

# "
# }