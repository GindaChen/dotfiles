env_root=$HOME/envs
mkdir -p $env_root

# Install vllm
# env_prefix="--python $env_root/vllm"
# uv venv -p 3.12 $env_root/vllm 
# uv pip install $env_prefix vllm

# Install dynasor
# env_prefix="--python $env_root/dynasor"
# uv venv -p 3.12 $env_root/dynasor 
# uv pip install $env_prefix vllm

# Install distserve
# env_prefix="--python $env_root/distserve"
# uv venv -p 3.12 $env_root/distserve 
# echo "Installing vllm"
# uv pip install $env_prefix 'vllm==0.7.3'
# if [ ! -d /root/projects/distserve ]; then
#     echo "Installing distserve"
#     cd /root/projects/distserve && uv pip install $env_prefix -e .
# fi

# Install sglang
# env_prefix="--python $env_root/sglang"
# uv venv -p 3.12 $env_root/sglang
# uv pip install $env_prefix sgl-kernel --force-reinstall --no-deps
# uv pip install $env_prefix "sglang[all]>=0.4.3" --find-links https://flashinfer.ai/whl/cu124/torch2.5/flashinfer-python


# Install necessary packages
if command -v nvidia-smi &> /dev/null; then
    # NVIDIA platform detected
    pip install nvitop gpustat
else
    echo "Skipping nvitop/gpustat installation: Not an NVIDIA platform"
fi
