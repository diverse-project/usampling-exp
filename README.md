# Uniform, random sampling: what's the current status?

 Large study and results of different SAT-based samplers:
 * KUS https://github.com/meelgroup/KUS (new!)
 * SPUR https://github.com/ZaydH/spur (new!) 
 * Unigen2 and QuickSampler https://github.com/diverse-project/samplingfm/
 * SMARCH https://github.com/jeho-oh/Kclause_Smarch/tree/master/Smarch (new!)
 * other: Unigen3, CMS, STS (new!)
 
 over different data:
 * https://github.com/diverse-project/samplingfm/ (including SAT formulas and hard feature models)
 * https://github.com/PettTo/Feature-Model-History-of-Linux (new!)

Pre-built Docker image: 
 * available here https://cloud.docker.com/repository/docker/macher/usampling
 * docker pull macher/usampling
 * contains all scripts, tools, and dataset (not feature model history)
 * `docker run -it macher/usampling /bin/bash` and then `python3 /home/usampling-exp/usampling-experiments.py` 
 * we're planning to provide the script to build the Docker image
 
 Requirements:
  * Docker image with Python 3, pandas, numpy, setuptools, pycoSAT, anytree 
  * solvers above and a proper installation 
  * time and resources ;) 

## Usage

`docker run -it -v $(pwd):/home/usampling-exp:z -v $(pwd)/usampling-data/:/home/usampling-data/:z macher/usampling /bin/bash -c 'cd /home/usampling-exp/; echo STARTING; python3 usampling-experiments.py --kus -t 1 --resume /home/usampling-data/results-timeout90/; echo END'`

is calling KUS sampler, with a timeout of 1 second, and in resume mode (formulas that previously lead to timeout are processed again)

## Architecture

 * all samplers are in `samplers` directory (and all utilities/dependencies are also in this folder)
 * `usampling-experiments.py` pilots the scalability study of samplers over different datasets 
 * `barbarik.py` pilots the uniformity checking of samplers over different datasets
 * Docker image is up to date with the current git

