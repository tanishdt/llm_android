#!/data/data/com.termux/files/usr/bin/bash

echo
echo "[*] Updating Termux packages..."
pkg update -y && pkg upgrade -y

echo
echo "[*] Installing required packages..."
pkg install -y git cmake clang build-essential termux-api aria2

echo
echo "[*] Creating ~/llm directory..."
mkdir -p ~/llm
cd ~/llm || exit

echo
echo "[*] Creating ram_fix.sh..."
cat <<'EOF' > ram_fix.sh
#!/data/data/com.termux/files/usr/bin/bash
cd ~/llama.cpp
make LLAMA_CUBLAS=0 LLAMA_METAL=0 -j4
EOF
chmod +x ram_fix.sh

echo
echo "[*] Creating install_mistral.sh (for manual model download)..."
cat <<'EOF' > install_mistral.sh
#!/data/data/com.termux/files/usr/bin/bash
mkdir -p ~/llama.cpp/models
cd ~/llama.cpp/models || exit
aria2c -x 16 "https://huggingface.co/TheBloke/Mistral-7B-GGUF/resolve/main/mistral-7b.Q4_K_M.gguf"
EOF
chmod +x install_mistral.sh

echo
echo "[*] Cloning llama.cpp..."
cd ~
git clone https://github.com/ggerganov/llama.cpp

echo
echo "[*] Building llama.cpp using RAM-optimized flags..."
bash ~/llm/ram_fix.sh

echo
echo "🎉 Setup complete!"
echo "────────────────────────────────────────────"
echo "📦 llama.cpp is cloned and built at: ~/llama.cpp"
echo "📁 Utility scripts are available in:  ~/llm"
echo
echo "📥 To download the Mistral-7B GGUF model (~4GB), run:"
echo "     bash ~/llm/install_mistral.sh"
echo
echo "🚀 To run the model after downloading:"
echo "     cd ~/llama.cpp"
echo '     ./main -m ./models/mistral-7b.Q4_K_M.gguf -p "Your prompt here"'
echo
echo "💬 To enter interactive chat mode:"
echo '     ./main -m ./models/mistral-7b.Q4_K_M.gguf -i'
echo
echo "📌 Tip: Use Q4 quantized models for better performance on phones."
echo "────────────────────────────────────────────"
