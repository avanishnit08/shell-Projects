#In the given directory if you find the files more than a given size ex. 20MB or files older than given days ex. 10days.

#Compress those files and move in a archive folder.
# steps of script:
#!/bin/bash
#1.Provide the path of directory.
#variables
BASE=/home/avanish/find_command
DAYS=10
DEPTH=1
RUN=0

#2.Check if the directory is present in the path or not.
if [! -d $BASE]
then
	echo "directory doesn't exist: $BASE"
	exit 1
fi

#3.create archive folder if not already present.
if [! -d $BASE/archive]
then
	mkdir $BASE/archive
fi

#4.Find all the files with size more than 20MB.
for i in 'find $BASE -maxdepth $DEPTH -type f -size +20MB'
do
	if [$RUN -eq 0]
	then
		echo "[$(date "+%Y-%m-%d %H:%M:%S")] archive $1 ==> $BASE/archive"
		gzip $1 || exit 1
		mv $1.gz $BASE/archive || exist 1
	fi
done
#5.compress each files 
#6.Move the compressed files in archive folder.
#7.Make A cron Job to run the script every day at given time

