# 🦙 LLM on Android via Termux – Mistral with llama.cpp

This project by [@tanish.dt](https://github.com/tanish.dt) helps you set up and run a **quantized LLM** (like Mistral-7B) on your **Android device** using **Termux** and [`llama.cpp`](https://github.com/ggerganov/llama.cpp).

---

## 📦 What's Included?

- ✅ `setup.sh`: Initializes the environment and creates two scripts in `~/llm`:
  - `ram_fix.sh`: Builds `llama.cpp` using RAM-optimized flags.
  - `install_mistral.sh`: Downloads Mistral-7B GGUF quantized model using `aria2`.

---

## ⚙️ Setup Instructions

### 1. Clone this repository
```bash
git clone https://github.com/tanish.dt/llm_android.git
cd llm_android
```

### 2. Run the setup script
```bash
bash setup.sh
```

This will:
- Update & install required packages
- Create `~/llm/`
- Generate:
  - `ram_fix.sh` – llama.cpp build script for low RAM
  - `install_mistral.sh` – downloads quantized Mistral model

---

## 🛠️ After Setup

### 3. Clone llama.cpp
```bash
cd ~
git clone https://github.com/ggerganov/llama.cpp
```

### 4. Build with RAM-friendly flags
```bash
bash ~/llm/ram_fix.sh
```

### 5. Download Mistral-7B model
```bash
bash ~/llm/install_mistral.sh
```

---

## 🚀 Run the Model

```bash
cd ~/llama.cpp
./main -m ./models/mistral-7b.Q4_K_M.gguf -p "What's the capital of India?"
```

For interactive chat:
```bash
./main -m ./models/mistral-7b.Q4_K_M.gguf -i
```

---

## 💾 Model Info

- Downloads Mistral-7B Q4_K_M in GGUF format from [TheBloke on Hugging Face](https://huggingface.co/TheBloke/Mistral-7B-GGUF)
- ~4.2 GB download size
- You can replace the URL in `install_mistral.sh` to use other quant levels

---

## 📂 Folder Structure

```
llm_android/
├── setup.sh                 # Main setup script
├── README.md                # You’re here
└── llm/
    ├── ram_fix.sh           # llama.cpp low-RAM build script
    └── install_mistral.sh   # Downloads Mistral-7B model
```

---

## 🧠 Credits

- [llama.cpp](https://github.com/ggerganov/llama.cpp) by Georgi Gerganov  
- [TheBloke GGUF Models](https://huggingface.co/TheBloke)  
- Script written by [@tanish.dt](https://github.com/tanish.dt)

---

## 📝 License

MIT – Use it, fork it, hack it.
