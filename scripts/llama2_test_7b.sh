#!/bin/bash 

LOG_FILE="output-llama2-7b-griffin.log" 
MODEL="/your-model-paths/GRIFFIN-llama2-chat-7B"
BASE_PATH="/your-model-paths/Llama-2-7b-chat-hf"

for bench_name in "mt_bench" "humaneval" "gsm8k"  
do  
    echo "bench name: $bench_name"
    for temp in 0.0 1.0
    do
        echo "temp: $temp"
        CUDA_VISIBLE_DEVICES=0 python -m evaluation.gen_ea_answer_llama2chat_griffin --ea-model-path $MODEL --base-model-path $BASE_PATH --bench-name $bench_name --temperature $temp >> $LOG_FILE 2>&1
    done  
done  