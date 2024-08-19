# Tutorial Setup

## Overview

This tutorial utilizes Docker to provide the user a simplified method of setting up the necessary software to run FATES on a user's local machine, such as a laptop.  Typically, FATES development and usage is conducted on large high performance computing clusters or supercomputers to enable global simulations.  However, FATES can also be run regionally and for specific sites, the latter of which is tractable on smaller machines.  This tutorial will orient new users to the FATES terminology and usage through simulation of individual sites.

Given that FATES must be run as one of many components within the context of a larger earth system model, it is necessary for the user to become familiar with this "host" model and the infrastructure that accompanies it.  Setting up such a large "host" land model can be daunting given the number of required software libraries and packages that the model has as dependencies for building and running simulations.  Such an effort is further complicated by the variety of operating and hardware systems that the model could be deployed upon.  As such, we have developed this tutorial to be portable with the minimum amount of necessary setup as possible and to provide for portability to the greatest extent possible.  This is accomplised by the use of software containers.

## Introduction to containers

### Docker Tutorial Environment Orientation

We have designed the materials to use two main Docker images, one for running the ELM model, which is built on a precursor container where all of the required libraries for ELM are compiled (e.g. netCDF, HDF5, Python), and a second that is used to analyze ELM simulation output in Jupyter-Lab, as well as to configure custom parameter experiments. You can think about this as a "stack" of two different containers that can either be run in sequential order (i.e. run the ELM container, once complete run the jupyter-lab container to analyze the output) or can be used at the same time on a single computer. This allows a user to be running ELM simulations while also exploring the output of a previous simulation in Jupyter notebooks. Below we provide instructions for setting up and running ELM simulations in Docker as well as starting and using the Jupyter-Lab environment. Note: because we are using Docker, users do not need to install Python or any special libraries on their computers. Everything needed to run the model or launch jupyter-lab is contained within the two containers that you download when following the instructions below for setting up your Docker environment.

### Why containers?

## Docker environment setup

### 1. Download and install Docker Desktop

Go to the Docker website quick start guide and follow the instructions: https://docs.docker.com/docker-hub/quickstart/

The quick start guide will instruct you to create a Docker ID and sign up for [DockerHub](https://hub.docker.com/) in the first step.  The NGEE-Tropics FATES tutorial team uses the DockerHub registry to hold the images necessary to run the tutorial containers.  It will also provide a link with instructions to download [Docker Desktop](https://docs.docker.com/desktop/), which is available for MacOS, Windows, and Linux operating systems.  Make certain to pull and run the "Hello World" container to make certain that the installation was successful and that you can pull images from the DockerHub registry.  You do not need to complete step 5 in the quick start which teaches you how to build and push a container.  This capability will not be necessary for this tutorial.

### 2. Download the [FATES tutorial repository](https://github.com/NGEET/fates-tutorial/)

In this tutorial, we provide a repository with can be downloaded to your local machine, with a recommended directory structure provide ahead of time to streamline the setup.  All activities for the tutorial will take place within directory.

From the [fates-tutorial](https://github.com/NGEET/fates-tutorial/) github website, find the link to download the repository under the green "code" button as shown below:

![github-tutorial-download](images/Github-download.png)

This can either be done by downloading the repository or using `git` to clone the respository.  This tutorial will not make use of `git` so you do not have to be familiar with its usage.

### 3. Create a `.env` file from the template file

The Docker setup for this tutorial makes use of a file to set environment variables necessary for running the containers.  Specifically, the container needs to know where the inventory data for your site is stored on your local machine.  The repository contains a template file named `env-template`, which has the following contents:

```
# Instructions
# 1. Add the local directory corresponding to where you have located your input data.  Leave "jovyan" as NB_USER.
# 2. Save the file and rename the file to ".env"
INPUT_DATA=
NB_USER=jovyan
```

Using a text editor of your choice, open the file and follow the instructions within updating its contents as approprite, making sure to save a copy of your changes as a new file named `.env`.

### 4. Test start the tutorial containers

1. *Start Docker Desktop and login*

   Logging into Docker Desktop will provide you access with downloading the necessary images from DockerHub.

2. *In a terminal, change directory to the top of* `fates-tutorial`

   The `fates-tutorial` directory contains a file called `docker-compose.yml` that provides the Docker application with instructions on what docker images to download from DockerHub and how to coordinate which local directories are mapped inside the container when run.

3. *To start the tutorial containers, run the command* `docker compose up -d`

   Upon running `docker compose up -d` you should see something similar to the following:
   ```
   loaner@eesaloaner-m53 fates-tutorial % docker compose up -d
   [+] Running 64/22
    ✔ landmodel 21 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                             12.3s 
    ✔ notebook 33 layers [⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]      0B/0B      Pulled                                   1.7s 
    ✔ elmdata 3 layers [⣿⣿⣿]      0B/0B      Pulled                                                                   1.7s 
    ✔ sitedata 3 layers [⣿⣿⣿]      0B/0B      Pulled                                                                  3.3s 
    ```
    Here docker is downloading, or "pulling", the necessary images from DockerHub to run the containers. Upon successfully pulling the images, the containers will start running:
    ```
   [+] Running 4/9
    ⠦ Network fates-tutorial_default         Created                                                                  3.6s 
    ⠦ Volume "fates-tutorial_modeloutput"    Created                                                                  3.6s 
    ⠦ Volume "fates-tutorial_elm-inputdata"  Created                                                                  3.6s 
    ⠦ Volume "fates-tutorial_site_data"      Created                                                                  3.6s 
    ⠦ Volume "fates-tutorial_bci_inventory"  Created                                                                  3.6s 
    ✔ Container elm-fates                    Started                                                                  3.4s 
    ✔ Container data-elm-default             Started                                                                  3.3s 
    ✔ Container data-met_forcing-domains     Started                                                                  3.3s 
    ✔ Container tutorial-notebook            Started                                                                  3.5s 
   loaner@eesaloaner-m53 fates-tutorial % 
   ```
   From this output you can see that Docker has successfully started up four containers:
   
   - `elm-fates`: this container holds the host land model and fates
   - `data-elm-default`: this container provides a set of necessary files that the host land model requires by default
   - `data-met_forcing-domains`: this container provides meterological forcing data, domain and surface data sets necessary for the tutorial
   - `tutorial-notebook`: this container holds the jupyter notebook to run the lessons associated with the tutorial

   You can confirm that the containers are running by looking at the Docker Desktop GUI container pane:
   ![docker-container-pane](images/docker-container-pane.png)


4. *To teardown the tutorial containers, run the command* `docker compose down`

   This command will make sure to cleanly shutdown the running containers and remove them.  Typically, the `elm-fates` container takes the longest to shut down. You should see the terminal return something like:
   ```
   loaner@eesaloaner-m53 fates-tutorial % docker compose down
   [+] Running 5/5
   ✔ Container data-met_forcing-domains  Removed                                                                     0.0s 
   ✔ Container elm-fates                 Removed                                                                    10.1s 
   ✔ Container data-elm-default          Removed                                                                     0.0s 
   ✔ Container tutorial-notebook         Removed                                                                     0.3s 
   ✔ Network fates-tutorial_default      Removed                                                                     0.1s 
   loaner@eesaloaner-m53 fates-tutorial % 
   ```
   Note that the images downloaded to run the containers are still available and have not been removed so they will not need to be pulled again the next time the `docker compose up -d` command is run.  This can be confirmed if you go to the Docker Desktop user interface and select the "Images" section in the left side bar.
   ![docker-images-pane](images/docker-images-pane.png)

Congratulations, the Docker fates tutorial environment has been successfully set up! 
