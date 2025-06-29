#!/data/data/com.termux/files/usr/bin/bash

# Step 1: Update Termux & Install tools
pkg update -y && pkg upgrade -y
pkg install -y git cmake clang build-essential termux-api

# Step 2: Create project directory
cd ~
mkdir -p llm
cd llm

# Step 3: Create ram_fix.sh for low RAM build
cat <<EOF > ram_fix.sh
#!/data/data/com.termux/files/usr/bin/bash
cd ~/llama.cpp
make LLAMA_CUBLAS=0 LLAMA_METAL=0 -j4
EOF

chmod +x ram_fix.sh

# Step 4: Create install_mistral.sh to download Mistral GGUF
cat <<EOF > install_mistral.sh
#!/data/data/com.termux/files/usr/bin/bash
pkg install -y aria2
mkdir -p ~/llama.cpp/models
cd ~/llama.cpp/models
aria2c -x 16 "https://huggingface.co/TheBloke/Mistral-7B-GGUF/resolve/main/mistral-7b.Q4_K_M.gguf"
EOF

chmod +x install_mistral.sh

echo -e "\n✅ Environment ready. Now clone llama.cpp and run ram_fix.sh from ~/llm"
