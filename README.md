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
6. Create a folder named **`models`** on your USB drive and move the `.gguf` file into it.

> 💡 **Suggestion:** [Qwen 3 8B Q4_K_M](https://huggingface.co/models?search=qwen3+8b+gguf) is a great starting point.

---

### Step 4 — Use the Unified Launcher

This project includes a **`launch_ai.bat`** script that automatically detects any models you've placed in the `models/` folder.

1. Ensure **`llamafile.exe`** is in the root of your USB drive.
2. Ensure your `.gguf` models are inside the **`models/`** folder.
3. Double-click **`launch_ai.bat`**.

---

### Step 5 — Run Your AI

1. When you run `launch_ai.bat`, a menu will appear listing all available models.
2. **Type the number** of the model you want to load and press **Enter**.
3. A command prompt window will open and the model will load (this may take 30–90 seconds).
4. Once loaded, the **Llamafile web UI** will automatically open in your browser.
5. Optionally configure:
   - **System Prompt** — Define the AI's persona
   - **Username** — Your display name
   - **Bot Name** — The AI's display name
6. Type your first message and start chatting! 🎉

---

## 🐧 Linux & macOS Setup

Llamafile is natively cross-platform. To run on Unix-based systems:

1. Open a **Terminal**.
2. Navigate to your USB drive:
   ```bash
   cd /media/your_user/your_usb_drive
   ```
3. Make the launcher and binary executable:
   ```bash
   chmod +x llamafile.exe launch_ai.sh
   ```
4. Run the launcher:
   ```bash
   ./launch_ai.sh
   ```

> 💡 **Note:** Even on Linux/macOS, the Llamafile binary typically keeps the `.exe` extension from the download.

---

## 📁 USB Drive File Structure

Your finished USB drive should look like this:

```
📁 USB Drive (exFAT)
├── 📄 llamafile.exe
├── 📄 launch_ai.bat
├── 📄 launch_ai.sh
├── 📁 models/
│    └── 📄 your_model_name.gguf
├── 📁 system_prompts/
│    ├── 📄 Code_Architect.txt
│    └── 📄 ...
└── 📁 scripts/
     └── (future scripts)
```

> 💡 Simply drop more `.gguf` files into the `models/` folder to add them to your launcher!

---

## ⚡ Performance Tuning

To get the most out of your hardware, you can modify the launcher scripts or manually pass flags:

| Flag | Description | Recommendation |
|---|---|---|
| `--threads N` | Number of CPU threads to use | Set to `Physical Cores minus 1` for best stability |
| `-ngl N` | Number of layers to offload to GPU | If you have a dedicated GPU (NVIDIA/AMD), increase this for speed |
| `-c N` | Context window size | Default is 512; increase for longer conversations (consumes more RAM) |

---

## 🏗️ Hardware Recommendations

For the best experience, use hardware that matches these specifications:

### 🚀 Recommended USB Drives
- **SanDisk Extreme Pro** (USB 3.2 Gen 1) — High sustained read/write speeds.
- **Samsung T7 Shield** (Portable SSD) — Drastically faster loading than a standard flash drive.
- **Kingston DataTraveler Max** — Excellent Performance-to-price ratio.

### 💻 Host PC Specs
- **USB Port**: Always use a **USB 3.0/3.1** blue or red port. Avoid black ports (USB 2.0) as they are 10x slower.
- **RAM**: 16 GB for 7B-14B models; 32 GB+ for larger models.
- **GPU**: Llamafile automatically uses TinyBLAS for CPU, but will leverage CUDA/Vulkan if available for much faster inference.

---

## 🎭 System Prompts

This project includes a `system_prompts/` directory with templates to change the AI's behavior. To use them:

1. Open a file in `system_prompts/` (e.g., `Code_Architect.txt`).
2. Copy the text.
3. Paste it into the **System Prompt** field in the Llamafile Web UI.
4. Click **Apply Changes**.

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
