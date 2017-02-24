#!/bin/bash
#auto git push every 30 minutes

seconds=1800

for i in {1..100}
do
    echo Time $i ---------------------------------------
    date
    aws s3 cp ~/py-R-FCN/experiments s3://disneydsy/py-R-FCN/experiments --recursive
    aws s3 cp ~/py-R-FCN/output s3://disneydsy/py-R-FCN/output --recursive
    #aws s3 sync ~/Kaggle_NCFM s3://disneydsy/Kaggle_NCFM --exclude "data/*"
    git add .
    git commit -m "auto_period"
    git push
    sleep ${seconds}
done

#nohup  ~/py-R-FCN/period_gitpush.sh &
