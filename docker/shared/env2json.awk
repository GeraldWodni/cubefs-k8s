#!/usr/bin/awk -f
# Create a JSON document from environment variables

BEGIN {
    print "{"
    SEP=" "
}

/^K8S_CSV_/ {
    match($0, /K8S_CSV_(.*)=(.*)/, arr)
    print " " SEP "\"" arr[1] "\": [\"" gensub( /,/, "\",\"", "g", arr[2] ) "\"]"
    SEP=","
    next
}

/^K8S_/ {
    match($0, /K8S_(.*)=(.*)/, arr)
    print " " SEP "\"" arr[1] "\": \"" arr[2] "\""
    SEP=","
}

END {
    print "}"
}
