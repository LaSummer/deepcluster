#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH -t10:00:00
#SBATCH --mem=10GB
#SBATCH --mail-type=END
#SBATCH --mail-user=zl2521@nyu.edu
#SBATCH --job-name=unsupervised
#SBATCH --gres=gpu:1
#SBATCH --output=slurm_%j.out

module purge
source activate ssl-framework

DIR="/scratch/zl2521/cv/fair-sslime/data/dc_unsupervised_test"
ARCH="vgg16"
LR=0.05
WD=-5
K=10
WORKERS=4
EXP="/scratch/zl2521/deepcluster/train_output"
BATCHSIZE=256
#python tools/train.py --config_file extra_scripts/no_unsupervised.yaml
#python tools/train.py --config_file extra_scripts/unsupervised_vgg_a_rotation_stl_10.yaml
#python tools/train.py --config_file extra_scripts/eval_vgg_a_rotation_stl_10.yaml
python main.py  ${DIR} --exp ${EXP} --batch ${BATCHSIZE} --arch ${ARCH} --lr ${LR} --wd ${WD} --k ${K} --sobel --verbose --workers ${WORKERS}
