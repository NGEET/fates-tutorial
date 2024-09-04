JUPYTER_URL=$(docker logs tutorial-notebook 2>&1 | grep "127" | grep -iv serverapp | xargs)
open $JUPYTER_URL
