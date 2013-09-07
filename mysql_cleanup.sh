#!/bin/bash
#
# This script will turn single-line INSERT statements in the SQL dumps
# into readable multi-line statements.
#
# The primary purpose of this script is to avoid huge single line inserts,
# since they will not be editable in most text editors.

# - Prepare required variables -----------------------------------------------
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TMP_FOLDER=${TMPDIR-/tmp}
# ----------------------------------------------------------------------------

# - Replace VALUES ( by VALUES\n( --------------------------------------------
find ${DIR} -name '*.sql' -type f -exec perl -pi -e 's/VALUES \(/VALUES\n\(/g' {} \;

# - Replace huge insert by multi-line inserts --------------------------------
find ${DIR} -name '*.sql' -type f -exec perl -pi -e 's/\),\(/\),\n\(/g' {} \;
