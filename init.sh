#!/bin/bash
echo "Starting Stable Diffusion Trainer"
if [ ! -d "/trainer" ] || [ ! "$(ls -A "/trainer")" ]; then
  echo "Files not found, cloning..."
  mkdir -p /trainer
  if [ "$FORK" = "jelosus" ]; then
    echo "Using Jelosus2's fork"
    git clone https://github.com/Jelosus2/LoRA_Easy_Training_scripts_Backend.git /trainer
  else
    echo "Using derrian-distro"
    git clone https://github.com/derrian-distro/LoRA_Easy_Training_scripts_Backend.git /trainer
  fi
  cd /trainer
  python3.10 /trainer/installer.py local
  chmod +x /trainer/run.sh
  exec /trainer/run.sh $ARGS
else
  echo "Files found, starting..."
  cd /trainer
  git pull
  chmod +x /trainer/run.sh
  exec /trainer/run.sh $ARGS
fi
