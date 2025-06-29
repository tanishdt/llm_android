# 🤖 LLM on Android using llama.cpp (UserLAnd Setup)

Run powerful **open-source LLMs like Mistral, LLaMA, TinyLLaMA, MythoMax, etc.** entirely on your **Android phone**, using [llama.cpp](https://github.com/ggerganov/llama.cpp) inside [UserLAnd](https://play.google.com/store/apps/details?id=tech.ula).

This setup works **completely offline** after model download and is ideal for:
- Privacy-focused users
- Developers and students
- Offline assistants
- On-the-go LLM demos

---

## 🚀 What This Repo Does

This repo contains a single script: `setup.sh` that:

✅ Installs all dependencies  
✅ Clones and builds `llama.cpp` via CMake  
✅ Prepares a clean `~/llm` folder for your `.gguf` models  
✅ Generates a `howtorun` helper script for easy reference  

---

## 📲 Requirements

- Android phone (2GB+ RAM recommended, 6GB+ ideal)
- [UserLAnd app](https://play.google.com/store/apps/details?id=tech.ula)
- Active Ubuntu session inside UserLAnd (18.04+ or 22.04 preferred)
- 4–8 GB storage free for models

---

## ⚙️ Installation Steps

### 1. Install UserLAnd from Play Store

Launch it, create a new Ubuntu session, and set up a user+password.

---

### 2. Open terminal inside Ubuntu in UserLAnd

Now run:

```bash
sudo apt update && sudo apt install wget -y
wget https://raw.githubusercontent.com/tanish.dt/llm_android/main/setup.sh
chmod +x setup.sh
./setup.sh
```

This will:
- Install packages
- Clone llama.cpp
- Build it with CMake
- Create `~/llm` folder for your model(s)
- Add a `howtorun` help script

---

## 📁 Folder Structure

| Folder                | Purpose                            |
|------------------------|------------------------------------|
| `~/llama.cpp/`         | llama.cpp source code              |
| `~/llama.cpp/build/`   | Compiled binary (`main`) here      |
| `~/llm/`               | Drop your `.gguf` model here       |
| `~/howtorun`           | Script that explains how to run    |

---

## 🔻 How to Get a Model

### A. Recommended: Hugging Face download via `aria2c`

Example for Mistral 7B:

```bash
cd ~/llm
aria2c -x 16 "https://huggingface.co/TheBloke/Mistral-7B-Instruct-v0.1-GGUF/resolve/main/mistral-7b-instruct-v0.1.Q4_K_S.gguf"
```

### B. If you already have the model on Android:

Use `scp`, `Termius`, or `X-plore` with SFTP to copy the `.gguf` into `/home/userland/llm/`

---

## 🧠 Run the Model

Make sure you’re in your home directory:

```bash
cd ~
./howtorun
```

This will echo all necessary usage instructions.

---

## 🔁 Quick Reference: Commands

### Single Prompt (one-shot):

```bash
~/llama.cpp/build/main -m ~/llm/your-model.gguf -p "You are a helpful assistant."
```

### Interactive Chat Mode:

```bash
~/llama.cpp/build/main -m ~/llm/your-model.gguf -i
```

---

## ⚙️ Optional Parameters

| Flag                | Description                                  |
|---------------------|----------------------------------------------|
| `--ctx-size 2048`   | Increases memory context window              |
| `--temp 0.7`        | Adjusts creativity/randomness of responses   |
| `--repeat_penalty`  | Penalizes repetition for coherence           |
| `--color`           | Enables colored chat output                  |

---

## 🛠 Troubleshooting

### DNS not resolving (aria2/wget fails)?

```bash
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf
```

### “main: No such file or directory”?

Make sure you've:
```bash
cd ~/llama.cpp/build
cmake ..
cmake --build . --config Release
```

---

## 📌 Tips

- Try quantized models like `Q4_K_S.gguf` or `Q2_K.gguf` for low RAM
- You can alias the run command in `.bashrc` for faster access
- If you want a simple menu-based `run.sh`, you can add it to this project

---

## 📄 License

MIT License — free to modify, fork, or integrate elsewhere.

---

## ✨ Credits

Maintained by [@tanish.dt](https://github.com/tanish.dt)  
Based on [llama.cpp](https://github.com/ggerganov/llama.cpp)
