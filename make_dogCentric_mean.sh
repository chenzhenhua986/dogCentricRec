TOOLS=/u/chen478/caffe/build/tools

for i in /nobackup/chen478/dogCentric_dataset/ImageSequence/*;do
    for j in $i/*;do 
        echo "Computing image mean from directory: "$j
        $TOOLS/compute_image_mean \
        $j/train_lmdb \
        $j/mean.binaryproto
    done
done

echo "done"
