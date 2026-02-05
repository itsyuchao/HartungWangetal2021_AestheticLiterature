# This script will calculate the durations of all labeled segments in a TextGrid object.
# The results will be save in a text file, each line containing the label text, onset, and the
# duration of the corresponding segment.
# A TextGrid object needs to be selected in the Object list.
#
# This script is distributed under the GNU General Public License.
# Copyright 12.3.2002 Mietta Lennes, modified by Yuchao Wang, June 2019.

# ask the user for the tier number
form Calculate durations of labeled segments
	comment Which tier of the TextGrid object would you like to analyse?
	integer tier 1
	comment Where do you want to save the results?
	text textfile default_output.txt
endform

# check how many intervals there are in the selected tier:
numberOfIntervals = Get number of intervals: tier
writeInfoLine: "For all", numberOfIntervals, " intervals:", newline$, "Label	Onset	Duration", newline$
nonEmptyInterval = 0

# loop through all the intervals
for interval from 1 to numberOfIntervals
	label$ = Get label of interval: tier, interval
	# if the interval has some text as a label, then calculate the duration.
	if label$ <> ""
		start = Get start point: tier, interval
		end = Get end point: tier, interval
		duration = end - start
		# append the label and the duration to the end of the text file, separated with a tab:
		resultline$ = "'label$'	'start'	'duration'	'newline$'"
		fileappend "'textfile$'" 'resultline$'
#the following part did not work for some reason.
		nonEmptyInternal = nonEmptyInterval + 1
	endif
endfor

appendInfoLine: "Non empty interval: ", nonEmptyInterval
