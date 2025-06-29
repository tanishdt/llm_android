#!/bin/bash

echo
echo "🛠️  [STEP 1] Updating packages..."
sudo apt update && sudo apt upgrade -y

echo
echo "📦 [STEP 2] Installing dependencies..."
sudo apt install -y git cmake clang build-essential aria2

echo
echo "📁 [STEP 3] Creating ~/llm folder..."
mkdir -p ~/llm
cd ~/llm || { echo "❌ Failed to create ~/llm"; exit 1; }

echo
echo "⬇️  [STEP 4] Creating install_mistral.sh..."
cat <<'EOF' > install_mistral.sh
#!/bin/bash
mkdir -p ~/llama.cpp/models
cd ~/llama.cpp/models || exit
aria2c -x 16 "https://huggingface.co/TheBloke/Mistral-7B-GGUF/resolve/main/mistral-7b.Q4_K_M.gguf"
EOF
chmod +x install_mistral.sh

echo
echo "🌐 [STEP 5] Cloning llama.cpp..."
cd ~
git clone https://github.com/ggerganov/llama.cpp || { echo "❌ Git clone failed!"; exit 1; }

echo
echo "⚙️  [STEP 6] Building llama.cpp with RAM-optimized flags..."
cd ~/llama.cpp
make LLAMA_CUBLAS=0 LLAMA_METAL=0 -j4

echo
echo "✅ Setup complete!"
echo
echo "🚀 NEXT STEPS:"
echo "1️⃣ Download the model:"
echo "    bash ~/llm/install_mistral.sh"
echo
echo "2️⃣ Run a single prompt:"
echo '    ./main -m ./models/mistral-7b.Q4_K_M.gguf -p "Hello!"'
echo
echo "3️⃣ Interactive mode:"
echo '    ./main -m ./models/mistral-7b.Q4_K_M.gguf -i'
echo
echo "📁 llama.cpp location:  ~/llama.cpp"
echo "📂 Model downloader:    ~/llm/install_mistral.sh"
