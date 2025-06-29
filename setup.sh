#!/bin/bash

echo
echo "🛠️  [STEP 1] Updating packages..."
sudo apt update && sudo apt upgrade -y

echo
echo "📦 [STEP 2] Installing dependencies..."
sudo apt install -y git cmake clang build-essential aria2

echo
echo "📁 [STEP 3] Creating helper folder at ~/llm..."
mkdir -p ~/llm
cd ~/llm || { echo "❌ Failed to create ~/llm"; exit 1; }

echo
echo "🔧 [STEP 4] Creating ram_fix.sh..."
cat <<'EOF' > ram_fix.sh
#!/bin/bash
cd ~/llama.cpp || exit
make LLAMA_CUBLAS=0 LLAMA_METAL=0 -j4
EOF
chmod +x ram_fix.sh

echo
echo "⬇️  [STEP 5] Creating install_mistral.sh (model download helper)..."
cat <<'EOF' > install_mistral.sh
#!/bin/bash
mkdir -p ~/llama.cpp/models
cd ~/llama.cpp/models || exit
aria2c -x 16 "https://huggingface.co/TheBloke/Mistral-7B-GGUF/resolve/main/mistral-7b.Q4_K_M.gguf"
EOF
chmod +x install_mistral.sh

echo
echo "🌐 [STEP 6] Cloning llama.cpp..."
cd ~
git clone https://github.com/ggerganov/llama.cpp || { echo "❌ Git clone failed! Check your internet."; exit 1; }

echo
echo "✅ Setup completed successfully!"
echo
echo "🚀 NEXT STEPS:"
echo "1️⃣  Build llama.cpp with:"
echo "    bash ~/llm/ram_fix.sh"
echo
echo "2️⃣  Download Mistral model (Q4) with:"
echo "    bash ~/llm/install_mistral.sh"
echo
echo "3️⃣  Run the model with:"
echo '    ./main -m ./models/mistral-7b.Q4_K_M.gguf -p "Hello!"'
echo
echo "💬  Or run in interactive chat mode:"
echo '    ./main -m ./models/mistral-7b.Q4_K_M.gguf -i'
echo
echo "📁  llama.cpp is at: ~/llama.cpp"
echo "🛠️  Helper scripts at: ~/llm/"
echo
