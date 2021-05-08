#This script helps to copy or zip each subfolder in batch
#Code written by Yuchao Wang, 9/23/2020. Do-whatever-you-want-with-it License.

#loop over existing subject number in pwd
#%*/ removes the trailing /
for d in */ ; do
  cp -R -n /Volumes/YWangWork/ChatLab/narrativefMRIdata/${d%*/}/session1 ~/Desktop/AesLit\ Manuscript/OSF\ folder/data/fMRI\ group/MRI\ data/${d%*/}
  echo "${d%*/} done"
done

for d in */ ; do
  zip -rm ${d%*/} ${d%*/}
  echo "${d%*/} done"
done

for i in `seq -w 1 60`; do
  mkdir S${i}
done

#doing it again to get rid of run7
for d in */ ; do
  cp -R -n /Volumes/YWangWork/ChatLab/narrativefMRIdata/${d%*/}/session1 /Volumes/YWangWork/MRIdataNoRun7/${d%*/}
  echo "${d%*/} done"
done

for d in */ ; do
  rm -R /Volumes/YWangWork/MRIdataNoRun7/${d%*/}/session1/run7
  echo "${d%*/} done"
done
