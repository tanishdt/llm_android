# 🧠 LLM on Android via UserLAnd – Mistral with llama.cpp

This project by [@tanish.dt](https://github.com/tanishdt) helps you set up and run a **quantized LLM** (like Mistral-7B) directly on your **Android device** using **UserLAnd** and [llama.cpp](https://github.com/ggerganov/llama.cpp).

---

## 📦 What's Included?

The `setup.sh` script will:
- Install all required packages (git, cmake, clang, build-essential, aria2)
- Clone `llama.cpp` into your home directory
- Create a `~/llm` folder containing:
  - `ram_fix.sh` — optimized build script for low RAM
  - `install_mistral.sh` — downloads Mistral-7B GGUF quantized model

---

## ⚙️ Setup Instructions

### 1. Launch UserLAnd (Ubuntu/Debian)

Make sure you have a working internet connection and have installed the Ubuntu session.

---

### 2. Run this command inside your UserLAnd terminal:

```bash
wget https://raw.githubusercontent.com/tanishdt/llm_android/main/setup.sh -O setup.sh && bash setup.sh
