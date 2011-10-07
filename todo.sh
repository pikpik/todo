todolist="$HOME/.reminders"

todobase () {

	if [ -f $todolist ]

	then
		# Exists
	else
		touch $todolist
	fi	

}

todo () {

	todobase


	if [ "$@" ]

	then
		echo "$@" >> $todolist
	else
		echo

		echo "To do  ( `cat $todolist | wc -l | sed 's/ //g'` )"

		echo

		cat $todolist | {

			while read l; do echo "$l"; echo; done;

		}
	fi
}

did () {

	todobase


	if [ "$@" ]

	then
		sed "/${1}/d" $todolist > ${todolist}.new

		mv ${todolist}.new $todolist
	else
		echo
		echo "What have you finished?"
		echo
	fi

}
