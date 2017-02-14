# ************************************************************
#
# This step will use Python anlayzer Pep8 to check files
#
#   Variables used:
#
#   Outputs:
#     $FLOW_PEP8_WARN_COUNT
#     $FLOW_PEP8_CHECKED_FILE_COUNT
#     $FLOW_PEP8_LOG_PATH
#
# ************************************************************

set +e
cd $FLOW_CURRENT_PROJECT_PATH
pip install pep8
FLOW_PEP8_LOG_PATH="${FLOW_WORKSPACE}/output/pep8_pylint.log"
pep8 . --format pylint > $FLOW_PEP8_LOG_PATH
FLOW_PEP8_WARN_COUNT=$(cat $FLOW_PEP8_LOG_PATH | wc -l | tr -d ' ')
FLOW_PEP8_CHECKED_FILE_COUNT=$(cat $FLOW_PEP8_LOG_PATH | awk -F ':' '{print $1}' | uniq | wc -l | tr -d ' ')
echo "CHECK FILE COUNT $FLOW_PEP8_WARN_COUNT"
echo "CHECK WARN COUNT $FLOW_PEP8_CHECKED_FILE_COUNT"
