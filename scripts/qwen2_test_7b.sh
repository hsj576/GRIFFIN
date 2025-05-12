#!/bin/bash 

LOG_FILE="output-qwen2-7b-griffin.log" 
MODEL="/your-model-paths/GRIFFIN-qwen2-instruct-7B"
BASE_PATH="/your-model-paths/Qwen2-7b-Instruct"

for bench_name in "mt_bench" "humaneval" "gsm8k"  
do  
    echo "bench name: $bench_name"
    for temp in 0.0 1.0
    do
        echo "temp: $temp"
        CUDA_VISIBLE_DEVICES=0 python -m evaluation.gen_ea_answer_qwen2chat_griffin --ea-model-path $MODEL --base-model-path $BASE_PATH --bench-name $bench_name --temperature $temp >> $LOG_FILE 2>&1
    done  
done  