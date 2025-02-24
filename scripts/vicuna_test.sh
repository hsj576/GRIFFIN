#!/bin/bash 

LOG_FILE="output-vicuna-7b-griffin.log" 
MODEL="/your-model-paths/GRIFFIN-vicuna-7b"
BASE_PATH="/your-model-paths/vicuna-7b-v1.5"

for bench_name in "mt_bench" "humaneval" "gsm8k"  
do  
    echo "bench name: $bench_name"
    for temp in 0.0 1.0
    do
        echo "temp: $temp"
        CUDA_VISIBLE_DEVICES=0 python -m evaluation.gen_ea_answer_vicuna_griffin --ea-model-path $MODEL --base-model-path $BASE_PATH --bench-name $bench_name --temperature $temp >> $LOG_FILE 2>&1
    done  
done  