<a href="https://rcsb.ai/logmd/3d090180" target="_blank"><img src='demo.gif'></a>

# LogMD: View/Share MD While It Runs 
<a href='https://colab.research.google.com/drive/12adhXXF1MQIzh_vEwKX9r_iF6jV-CNHE#scrollTo=N2_uubn_2qGM' target='_blank'>Try in Google Colab: <br/>
![image](https://github.com/user-attachments/assets/fd572272-83da-4ba0-a206-b4cf9b3dfb55)
</a>

## Install
```
pip install logmd
```
Try with [demo.py](https://github.com/log-md/logmd/blob/main/demo.py), [this colab](https://colab.research.google.com/drive/12adhXXF1MQIzh_vEwKX9r_iF6jV-CNHE#scrollTo=N2_uubn_2qGM) or from terminal `>logmd 1crn.pdb`. 

We currently only support [Atomic Simulation Environment (ASE)](https://wiki.fysik.dtu.dk/ase/) - [vote here](https://github.com/log-md/logmd/issues/1) for other backends 

Doesn't solve your problem? <a href="https://calendly.com/alexander-mathiasen/vchat">Let us know!</a> Like it? Buy us a <a href="https://studio.buymeacoffee.com/auth/oauth_callback?is_signup=" target="_blank">coffee!</a>

## Use-cases
We built `logmd` for the two use-cases below. If there's a use-case we're missing, [let's chat!](https://calendly.com/alexander-mathiasen/vchat) 

### Case 1: 
Inspect/share trajectory while simulation runs - just click/share the link `logmd` prints. 
```
from logmd import LogMD
logmd = LogMD(num_workers=2)
dyn.attach(lambda: logmd(atoms), interval=4)
dyn.run(steps)
```

### Case 2: 
Document/visualize fixing of pdb before running simulation. Example: I want to simulate '1crn.pdb' but need to add missing residues, hydrogens, water, pH and so on. To document everything, I run `logmd watch 1crn.pdb` which stores all versions of `1crn.pdb` as a trajectory.  
```
>logmd watch 1crn.pdb # from terminal
```


## Docker

You can also run the model using Docker:

1. Build the Docker image locally:

   ```bash
   docker build -t logmd .
   ```

   Or pull the pre-built image from Docker Hub:

   ```bash
   docker pull cford38/logmd:latest
   ```

2. Run the Docker container:

   ```bash
   docker run --gpus all --rm --name logmd -it logmd /bin/bash
   # docker run --gpus all --rm --name logmd -it cford38/logmd:latest /bin/bash
   ```

> [!NOTE]
> This image does not include all of the model weights, which will be downloaded the first time you run the Python library inside in the container.