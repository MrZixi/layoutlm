#!/bin/bash
#wget https://guillaumejaume.github.io/FUNSD/dataset.zip

#unzip dataset.zip && mv dataset data && rm -rf dataset.zip __MACOSX

#python preprocess.py --data_dir /datatop_2/Shikha/docie/DocVQA/val/ocr_results \
#                                    --data_split val \
#                                    --output_dir /datatop_2/Shikha/docie/DocVQA \
#                                    --model_name_or_path bert-base-uncased \
#                                    --max_len 510

#python preprocess.py --data_dir /datatop_2/Shikha/docie/DocVQA/test/ocr_results \
#                                    --data_split test \
#                                    --output_dir /datatop_2/Shikha/docie/DocVQA \
#                                    --model_name_or_path bert-base-uncased \
#                                    --max_len 510

python preprocess.py --data_dir /workspace/layoutlm/data/training_data/annotations \
                                    --data_split train \
                                    --output_dir /workspace/layoutlm/data/FunSD \
                                    --model_name_or_path bert-base-uncased \
                                    --max_len 510

python preprocess.py --data_dir /workspace/layoutlm/data/testing_data/annotations \
                                    --data_split test \
                                    --output_dir /workspace/layoutlm/data/FunSD \
                                    --model_name_or_path bert-base-uncased \
                                    --max_len 510

cat /workspace/layoutlm/data/FunSD/train.txt | cut -d$'\t' -f 2 | grep -v "^$"| sort | uniq > /workspace/layoutlm/data/FunSD/labels.txt