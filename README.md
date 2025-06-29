# 🧠 LLM on Android via UserLAnd – Run Mistral-7B with llama.cpp

This project by [@tanishdt](https://github.com/tanishdt) lets you install and run a quantized LLM (like Mistral-7B) locally on your Android device using **UserLAnd** and [llama.cpp](https://github.com/ggerganov/llama.cpp).

---

## 📦 Features

- Automatic install of dependencies (clang, cmake, git, etc.)
- Clones and builds `llama.cpp` with RAM-optimized flags
- Includes a helper script to download the Mistral-7B quantized model (Q4_K_M)

---

## ⚙️ Setup

### Run this one-liner inside your UserLAnd terminal:

```bash
wget https://raw.githubusercontent.com/tanishdt/llm_android/main/setup.sh -O setup.sh && bash setup.sh
```

---

## ✅ After Setup

### 1. Download the model (Mistral 7B - Q4_K_M)

```bash
bash ~/llm/install_mistral.sh
```

> If DNS fails, fix it with:
```bash
sudo rm -f /etc/resolv.conf
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
```

---

### 2. Run the model

#### 🔹 Run a single prompt:

```bash
cd ~/llama.cpp
./main -m ./models/mistral-7b.Q4_K_M.gguf -p "Hello!"
```

#### 🔹 Run in interactive mode:

```bash
./main -m ./models/mistral-7b.Q4_K_M.gguf -i
```

---

## 📁 Folder Structure

```
~/
├── llama.cpp/
│   └── models/
│       └── mistral-7b.Q4_K_M.gguf
├── llm/
│   └── install_mistral.sh
└── setup.sh
```

---

## 🧠 Requirements

- Android phone with **4 GB+ RAM** (6–8 GB recommended)
- [UserLAnd app](https://play.google.com/store/apps/details?id=tech.ula)
- Ubuntu or Debian session inside UserLAnd
- 6+ GB free storage

---

## 👤 Author

**Tanish Vijay**  
GitHub: [@tanishdt](https://github.com/tanishdt)
