property _msg : "dateLib"

on myDate()
	copy (current date) to today
	
	set Y to year of today
	set M to month of today
	set D to day of today
	
	if D ≤ 9 then set D to "0" & D
	
	if M is January then set M to "01"
	if M is February then set M to "02"
	if M is March then set M to "03"
	if M is April then set M to "04"
	if M is May then set M to "05"
	if M is June then set M to "06"
	if M is July then set M to "07"
	if M is August then set M to "08"
	if M is September then set M to "09"
	if M is October then set M to "10"
	if M is November then set M to "11"
	if M is December then set M to "12"
	
	return (Y as string) & "-" & (M as string) & "-" & (D as string)
end myDate
