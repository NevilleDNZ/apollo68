#!/bin/sh
all="book bug120901_vec_slice_plusab_vec count_FPA root_find
gaussian_elimination Gaussian_elimination gen_html_gen graph2d matrix
ode_solve torrix"

if [ $# == 0 ]; then
    echo "Usage: $0 test_QQQ.a68" 1>&2
    # exit 1
    #set -- test/test_book.a68
    set -- `echo *test/test_*.a68`
#else
#    all="$(for f in "$@"; do echo "$f"; done | grep 'test_.*[.]a68$' | sed -e 's/.*test_//g' -e 's/[.]a68$//')"
fi

# Colour variables you can define as follows:
i=0
for color in black red green yellow blue purple cyan white; do
  eval fg_$color='"$(tput setaf $i)"'
  eval bg_$color='"$(tput setab $i)"'
  ((i=i+1))
done
reset=$(tput sgr0) # Text reset.

OK="$bg_green$fg_black[OK]$reset"
SKIP="$bg_yellow$fg_black[SKIP]$reset"
DISABLED="$bg_yellow$fg_black[DISABLED]$reset"
FAIL="$bg_red[FAIL]$reset"

ignore_n_errors=9 # 3

n_errors=0
count_OK=0
count_SKIP=0
count_FAIL=0
count_DISABLED=0

for test_a68 in "$@"; do
    shift
    case "$test_a68" in
        (*test/test_*.a68)
            test_src_dir="$(dirname "$test_a68")"
            test_benchmark_dir="$(dirname "$test_src_dir")/test_benchmark"
            test_base="$(basename "$test_a68" .a68)"
            test_benchmark="$test_benchmark_dir/$test_base"
        ;;
        (*)
            echo "Error: ignoring file: $test_a68" 1>&2
            test_benchmark=""
        ;;
    esac     
    
    if [ -z "$test_benchmark" ]; then
        echo "$0: ignoring $test_a68 - invalid test file name $SKIP" 1>&2
        ((count_SKIP++))
    elif [ ! -x "$test_a68" ]; then
        echo "$0: ignoring $test_a68 - not executable $DISABLED" 1>&2
        ((count_DISABLED++))
    else
        echo -n "$test_a68: "
        "$test_a68" > "$test_benchmark"_candidate.lst
        new_benchmark="$(echo cp "$test_benchmark"_{candidate,benchmark}.lst)"
# uncomment the following line to generate a new benchmark #
        # $new_benchmark
        if diff --ignore-space-change "$test_benchmark"_{benchmark,candidate}.lst > "$test_benchmark"_diff.lst; then
            echo "$0: $test_a68 $OK"
            ((count_OK++))
            rm "$test_benchmark"_diff.lst
        else
            echo "$0: $test_a68 $FAIL"
            ls -l "$test_benchmark"_{benchmark,candidate}.lst
            echo -n head:; head "$test_benchmark"_diff.lst
            echo -n tail:; tail "$test_benchmark"_diff.lst
            echo -n Hint: try "$new_benchmark" 
            echo -n Hint: try "$new_benchmark" >> "$test_benchmark"_diff.lst
            echo "  OR" vim "$test_benchmark"_candidate.lst 
            echo "  OR" vim "$test_benchmark"_diff.lst 
            echo "  OR" vimdiff "$test_benchmark"_{candidate,benchmark}.lst
            echo "  OR" chmod a-x "$test_a68" to SKIP test
            echo "  OR" a68g "$test_a68" to rerun
            echo "  OR" vim "$test_a68" >> "$test_benchmark"_diff.lst
            echo
            echo >> "$test_benchmark"_diff.lst
            ((n_errors = n_errors + 1))
            ((count_FAIL++))
            if [ "$n_errors" -ge "$ignore_n_errors" ]; then 
                echo "$0: $SKIP" "$@"
                ((count_SKIP+=$#))
                break; # exit 1; 
            fi
        fi
    fi
done
echo "$OK:$count_OK, $SKIP:$count_SKIP, $DISABLED:$count_DISABLED, $FAIL:$count_FAIL"
