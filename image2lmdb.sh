TOOLS=/u/chen478/caffe/build/tools

RESIZE=true
if $RESIZE; then
  RESIZE_HEIGHT=256
  RESIZE_WIDTH=256
else
  RESIZE_HEIGHT=0
  RESIZE_WIDTH=0
fi

for i in /nobackup/chen478/dogCentric_dataset/ImageSequence/*;do
    for j in $i/*;do 
	#for k in $j/*;do
	    rm -rf $j/train_lmdb 
	    echo "Creating train lmdb from directory: "$j
	    GLOG_logtostderr=1  $TOOLS/convert_imageset \
            --resize_height=$RESIZE_HEIGHT \
    	    --resize_width=$RESIZE_WIDTH \
    	    $j/ \
    	    $j/train.txt \
    	    $j/train_lmdb
	#done
    done
done

echo "Done."
