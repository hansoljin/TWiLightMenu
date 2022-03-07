#! /bin/sh
LAST_TAG=$(git describe --tags --abbrev=0)
LAST_COMMIT=$(git rev-list -n 1 $LAST_TAG)
git diff --name-only $LAST_COMMIT HEAD > files_changed.txt

MAKE_BOOTER=false
MAKE_BOOTER_FC=false
MAKE_GBAPATCHER=false
MAKE_MANUAL=false
MAKE_QUICKMENU=false
MAKE_DSIMENU=false
MAKE_R4MENU=false
MAKE_RUNGAME=false
MAKE_SETTINGS=false
MAKE_SLOT1LAUNCH=false
MAKE_TITLE=false
MAKE_ALL=false

if grep -q "universal/" files_changed.txt; then
    MAKE_ALL=true
else
    if grep -q "booter/" files_changed.txt; then
        MAKE_BOOTER=true
    fi
    if grep -q "booter_fc/" files_changed.txt; then
        MAKE_BOOTER_FC=true
    fi
    if grep -q "gbapatcher/" files_changed.txt; then
        MAKE_BOOTER_FC=true
    fi
    if grep -q "manual/" files_changed.txt; then
        MAKE_MANUAL=true
    fi
    if grep -q "quickmenu/" files_changed.txt; then
        MAKE_QUICKMENU=true
    fi
    if grep -q "romsel_dsimenutheme/" files_changed.txt; then
        MAKE_DSIMENU=true
    fi
    if grep -q "romsel_r4theme/" files_changed.txt; then
        MAKE_R4MENU=true
    fi
    if grep -q "rungame/" files_changed.txt; then
        MAKE_RUNGAME=true
    fi
    if grep -q "settings/" files_changed.txt; then
        MAKE_SETTINGS=true
    fi
    if grep -q "slot1launch/" files_changed.txt; then
        MAKE_SLOT1LAUNCH=true
    fi
    if grep -q "title/" files_changed.txt; then
        MAKE_TITLE=true
    fi
    if grep -q "resources/" files_changed.txt; then
        MAKE_RESOURCES=true
    fi
fi

if [ "${MAKE_ALL}" = true ]; then
    make package
else
    if [ "${MAKE_BOOTER}" = true ]; then
        make -C booter dist
    fi
    if [ "${MAKE_BOOTER_FC}" = true ]; then
        make -C booter_fc dist
    fi
    if [ "${MAKE_GBAPATCHER}" = true ]; then
        make -C gbapatcher dist
    fi
    if [ "${MAKE_MANUAL}" = true ]; then
        make -C manual dist
    fi
    if [ "${MAKE_QUICKMENU}" = true ]; then
        make -C quickmenu dist
    fi
    if [ "${MAKE_DSIMENU}" = true ]; then
        make -C romsel_dsimenutheme dist
    fi
    if [ "${MAKE_R4MENU}" = true ]; then
        make -C romsel_r4theme dist
    fi
    if [ "${MAKE_RUNGAME}" = true ]; then
        make -C rungame dist
    fi
    if [ "${MAKE_SETTINGS}" = true ]; then
        make -C settings dist
    fi
    if [ "${MAKE_SLOT1LAUNCH}" = true ]; then
        make -C slot1launch dist
    fi
    if [ "${MAKE_TITLE}" = true ]; then
        make -C title dist
    fi
    if [ "${MAKE_RESOURCES}" = true ]; then
        make -C resources dist
    fi
fi

rm -rf files_changed.txt
echo Done.

