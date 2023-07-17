#!/bin/sh

Application=$1
LogFileName="$Application"ClosingTimes.log

[ -n  `pgrep -i $Application` ] && pkill -i $Application && echo `date` >> $HOME/.cache/$LogFileName
