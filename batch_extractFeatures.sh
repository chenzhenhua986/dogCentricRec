DES=/u/chen478/dogCentric

nu = 0
for i in /nobackup/chen478/dogCentric_dataset/ImageSequence/*;do
    IFS='/' read -r -a array <<< "$i"
    #echo "${array[-1]}"
    for j in $i/*;do
        echo "Copying lmdb file from directory: "$j
        cp -R $j/train_lmdb $DES/
	echo "Copying mean file from directory: "$j
	cp $j/mean.binaryproto $DES/
	echo "Extracting features: "
	touch /nobackup/chen478/features/${array[-1]}_result${nu}.csv
	python $DES/extractFeatures.py ${array[-1]}_result${nu}.csv
	nu=$((nu+1))
    done
done

echo "done"


