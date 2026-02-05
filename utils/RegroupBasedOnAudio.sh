#This script regroups the nifti files by adding the specific audio that the subject listened to during
#the run to the folder name. This will later act as anchors for separate data analyses due to the slight
#differences in the audio recordings.
#Code written by Yuchao Wang, Jul 3, 2019. Do-whatever-you-want-with-it License. 

#loop over total subject number
for i in `seq -w 1 60`; do
#if odd number subject, run 1 is Mexicaanse Hond 1st person, run 2 is De Muur 3rd person.
  if [ $((10#$i % 2)) == 1 ]; then
    echo "$i is odd number. Processing runs from subject $i.";
      if [[ -e S$i/session1 ]]; then
        cd S${i}/session1;
        mv run1/ MH1st_run1/;
        mv run2/ DM3rd_run2/;
        cd ../..;
      else
        echo "=======> S$i/session1 does not exist.";
      fi

#if even number subject, run 1 is De Muur 1st person, run 2 is Mexicaanse Hond 3rd person.
  else
    echo "$i is even number. Processing runs from subject $i.";
      if [[ -e S$i/session1 ]]; then
        cd S${i}/session1;
        mv run1/ DM1st_run1/;
        mv run2/ MH3rd_run2/;
        cd ../..;
      else
        echo "=======> S$i/session1 does not exist.";
      fi
  fi
done
