haxe \
    -p haxe_src \
    -p libs \
    -D libnx \
    -L ammer \
    -D ammer.lib.nx.headers=switch.h \
    -D static_link \
    -D HXCPP_VERBOSE \
    --main Main \
    --cpp build.haxe
