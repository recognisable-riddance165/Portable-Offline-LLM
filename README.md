# 🖥️ Portable Offline LLM on a USB Drive

> Run a fully private, offline AI assistant from a USB flash drive — no installation, no internet, no admin rights required.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform: Windows](https://img.shields.io/badge/Platform-Windows-blue.svg)](https://www.microsoft.com/windows)
[![Powered by Llamafile](https://img.shields.io/badge/Powered%20by-Llamafile-orange.svg)](https://github.com/Mozilla-Ocho/llamafile)
[![Models: GGUF](https://img.shields.io/badge/Models-GGUF%20%7C%20HuggingFace-brightgreen.svg)](https://huggingface.co/models?library=gguf)

---

## 📖 Overview

This project shows you how to set up a portable Large Language Model (LLM) environment that lives entirely on a USB flash drive. Powered by [Llamafile](https://github.com/Mozilla-Ocho/llamafile), you can carry your own AI assistant in your pocket and run it on any Windows PC — no cloud, no data leaks, no setup headaches.

### ✨ Why This Is Useful

| Feature | Description |
|---|---|
| 🔌 **Plug & Play** | Works on any Windows PC without installing anything |
| 🔒 **Fully Private** | Your data never leaves your hardware |
| ✈️ **Offline** | Works in air-gapped or restricted network environments |
| 🛡️ **No Admin Rights** | Runs as a standard user executable |
| 🧳 **Portable** | Your entire AI lives on one USB drive |

---

## 🛠️ Requirements

- **USB Flash Drive** — 64 GB or larger (USB 3.0 recommended)
- **Windows PC** — Any modern Windows machine with a USB 3.0 port
- **RAM** — More is better; 16 GB+ recommended for smooth performance

> 💡 **Performance Note:** Benchmarks in this guide were recorded on a Ryzen 7 5800X with 128 GB DDR4. Results will vary by machine.

---

## 🚀 Setup Guide

### Step 1 — Format the USB Drive

1. Plug your USB drive into a **USB 3.0** port.
2. Open **File Explorer**, right-click the drive, and select **Format**.
3. Set the **File System** to **exFAT** (required for large files and faster loading).
4. Click **Start** to format.

> ⚠️ **Warning:** Formatting erases all data on the drive. Back up anything important first.

---

### Step 2 — Download Llamafile

1. Go to the [Llamafile GitHub Releases page](https://github.com/Mozilla-Ocho/llamafile/releases).
2. Open the **Assets** section of the latest release.
3. Download the file named `llamafile-x.x.x` (e.g., `llamafile-0.9.3`).
4. Rename it to **`llamafile.exe`** and move it to the **root of your USB drive**.

---

### Step 3 — Download an AI Model

1. Visit [Hugging Face Models](https://huggingface.co/models?library=gguf).
2. Filter by **GGUF** under the Libraries section.
3. Choose a model that fits your hardware:

| Model Type | Recommended Max Size |
|---|---|
| Dense Models | 14B parameters or smaller |
| MoE (Mixture of Experts) | 30B parameters or smaller |

4. Click your chosen model → go to the **Files and versions** tab.
5. Download a **Q4 or Q4_K_M quantized** `.gguf` file.
6. Move the `.gguf` file to the **root of your USB drive**.

> 💡 **Suggestion:** [Qwen 3 8B Q4_K_M](https://huggingface.co/models?search=qwen3+8b+gguf) is a great starting point.

---

### Step 4 — Create a Startup Script

1. Open **Notepad**.
2. Type the following command, replacing the filename with your actual model name:

```bat
llamafile.exe -m your_model_name.gguf
```

3. Go to **File → Save As**.
4. Set **Save as type** to **All Files**.
5. Name the file something like `run_qwen_3_8b.bat` and save it to the **root of your USB drive**.

---

### Step 5 — Run Your AI

1. Double-click your `.bat` file.
2. A command prompt window will open and the model will load into system memory (this may take 30–90 seconds).
3. Once loaded, the **Llamafile web UI** will automatically open in your browser.
4. Optionally configure:
   - **System Prompt** — Define the AI's persona
   - **Username** — Your display name
   - **Bot Name** — The AI's display name
5. Type your first message and start chatting! 🎉

---

## 📁 USB Drive File Structure

Your finished USB drive should look like this:

```
📁 USB Drive (exFAT)
├── 📄 llamafile.exe
├── 📄 your_model_name.gguf
├── 📄 run_model.bat
└── 📄 (optional) another_model.gguf
     └── run_another_model.bat
```

> 💡 You can store multiple models and create a separate `.bat` file for each one!

---

## 📊 Performance Benchmarks

Tested on: **Ryzen 7 5800X / 128 GB DDR4**

| Model | Architecture | Speed |
|---|---|---|
| Qwen 3 8B Q4 | Dense | 7.15 t/s |
| Qwen 3 30B A3B Q4 | MoE | 15.67 t/s |

> **Why is the 30B MoE faster?** Mixture of Experts models only activate a fraction of their parameters per inference pass. This means a 30B MoE model can outperform a smaller dense model while still running efficiently on consumer hardware.

---

## 🔧 Troubleshooting

| Problem | Solution |
|---|---|
| The `.bat` file doesn't run | Make sure the file is saved with the `.bat` extension, not `.bat.txt` |
| Model loads slowly | Ensure the drive is in a USB **3.0** port (not USB 2.0) |
| Browser doesn't open | Wait a bit longer; try manually navigating to `http://localhost:8080` |
| Out of memory error | Try a smaller model or a lower quantization (e.g., Q3 instead of Q4) |

---

## 📚 Resources

- [Llamafile GitHub](https://github.com/Mozilla-Ocho/llamafile) — The engine powering this project
- [Hugging Face GGUF Models](https://huggingface.co/models?library=gguf) — Browse and download models
- [GGUF Format Explained](https://huggingface.co/docs/hub/gguf) — Learn about the model format

---

## 🤝 Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request if you have:
- Tested other models and want to share benchmarks
- Found a bug or improvement
- Want to add Linux/macOS support

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

<p align="center">Made with ❤️ — Carry your AI everywhere.</p>
