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
cmake .. -DLLAMA_BUILD_MAIN=ON
cmake --build . --config Release

echo
echo "📜 [STEP 6] Creating howtorun script..."
cat <<'EOF' > ~/howtorun
#!/bin/bash

echo ""
echo "📱 HOW TO RUN LLaMA MODELS ON ANDROID (UserLAnd Edition)"
echo "────────────────────────────────────────────────────────"
echo ""
echo "📁 Step 1: Place your .gguf model file in:"
echo "    ~/llm/"
echo ""
echo "🧠 Step 2: Run the model with a single prompt:"
echo '    ~/llama.cpp/build/main -m ~/llm/your-model.gguf -p "You are a helpful assistant."'
echo ""
echo "💬 Step 3: To run in interactive chat mode:"
echo '    ~/llama.cpp/build/main -m ~/llm/your-model.gguf -i'
echo ""
echo "📊 Optional flags:"
echo "    --ctx-size 2048     # Increase context memory"
echo "    --temp 0.7          # Control randomness"
echo "    --repeat_penalty 1.1  # Improve coherence"
echo ""
echo "🛠 Troubleshooting:"
echo "• DNS issue? Run:"
echo '    echo \"nameserver 8.8.8.8\" | sudo tee /etc/resolv.conf'
echo ""
echo "• Memory error? Try a smaller model like Q2 or Q3."
echo ""
echo "────────────────────────────────────────────────────────"
echo "🔥 You’re all set. Run your local LLM like a boss!"
echo ""
EOF

chmod +x ~/howtorun

echo
echo "✅ Setup complete!"
echo
echo "🚀 NEXT STEPS:"
echo "1️⃣ Drop your .gguf model in:  ~/llm/"
echo "2️⃣ Run ./howtorun to see usage instructions"
echo
