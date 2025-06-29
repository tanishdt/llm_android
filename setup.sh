#!/bin/bash

echo
echo "🛠️  [STEP 1] Updating packages..."
sudo apt update && sudo apt upgrade -y

echo
echo "📦 [STEP 2] Installing dependencies..."
sudo apt install -y git cmake clang build-essential

echo
echo "📁 [STEP 3] Creating working folders..."
mkdir -p ~/llm
mkdir -p ~/llama.cpp

echo
echo "⬇️  [STEP 4] Cloning llama.cpp..."
cd ~
git clone https://github.com/ggerganov/llama.cpp || { echo "❌ Git clone failed!"; exit 1; }

echo
echo "🏗️  [STEP 5] Building llama.cpp with CMake..."
cd ~/llama.cpp
mkdir -p build
cd build
cmake ..
cmake --build . --config Release

echo
echo "✅ Llama.cpp build complete!"
echo
echo "🚀 NEXT STEPS:"
echo "1️⃣ Move or download your .gguf model file into:"
echo "    ~/llm/"
echo
echo "2️⃣ Run it with:"
echo '    ~/llama.cpp/build/main -m ~/llm/your-model.gguf -p "You are a helpful assistant."'
echo
echo "3️⃣ For chat mode:"
echo '    ~/llama.cpp/build/main -m ~/llm/your-model.gguf -i'
