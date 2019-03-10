if [ -f ./out/target/product/${DEVICE}/system/lib/libaudioflingerglue.so ]; then 
    DROIDLIB=lib
elif [ -f ./out/target/product/${DEVICE}/system/lib64/libaudioflingerglue.so ]; then
    DROIDLIB=lib64
else
    echo "Please build audioflingerglue as per HADK instructions"
    exit 1
fi

pkg=audioflingerglue-0.0.1
fold=hybris/mw/$pkg
rm -rf $fold
mkdir $fold

mkdir -p $fold/out/target/product/${DEVICE}/system/${DROIDLIB}
mkdir -p $fold/out/target/product/${DEVICE}/system/bin
mkdir -p $fold/external/audioflingerglue

cp ./external/audioflingerglue/*.h $fold/external/audioflingerglue/
cp ./external/audioflingerglue/hybris.c.in $fold/external/audioflingerglue/
cp ./out/target/product/${DEVICE}/system/${DROIDLIB}/libaudioflingerglue.so $fold/out/target/product/${DEVICE}/system/${DROIDLIB}/
cp ./out/target/product/${DEVICE}/system/bin/miniafservice $fold/out/target/product/${DEVICE}/system/bin/

tar -cjvf $fold.tgz -C $(dirname $fold) $pkg

rm -rf $fold

