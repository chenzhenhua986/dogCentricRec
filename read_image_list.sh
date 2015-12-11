for i in /nobackup/chen478/dogCentric_dataset/ImageSequence/*;do
  for j in $i/*; do
    for k in $j/*; do
      rm $j/train.txt
      rm -rf $j/train_lmdb 
    done
  done
done

for i in /nobackup/chen478/dogCentric_dataset/ImageSequence/*;do
  for j in $i/*; do
    for k in $j/*; do
       
      echo $(echo $k| cut -d'/' -f 8) 0  >> $j/train.txt
    done
  done
done

