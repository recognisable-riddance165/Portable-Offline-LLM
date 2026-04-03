<div align="center">

![Portable AI Hero](assets/hero.png)

# 🖥️ Portable Offline LLM on a USB Drive

> **Run a fully private, elite AI assistant from your pocket — Zero installation. Zero cloud. Zero traces.**

[![License: MIT](https://img.shields.io/badge/License-MIT-f39c12.svg?style=for-the-badge&logo=opensourceinitiative&logoColor=white)](https://opensource.org/licenses/MIT)
[![Platform: Windows](https://img.shields.io/badge/Windows-0078D4.svg?style=for-the-badge&logo=windows&logoColor=white)](https://www.microsoft.com/windows)
[![Platform: Unix](https://img.shields.io/badge/Linux%20%7C%20macOS-FCC624.svg?style=for-the-badge&logo=linux&logoColor=black)](https://www.linux.org/)
[![Powered by Llamafile](https://img.shields.io/badge/Powered%20By-Llamafile-ff6b6b.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Mozilla-Ocho/llamafile)

---

### **[Explore the Docs](#-setup-guide)** • **[Download Models](#-step-3--download-an-ai-model)** • **[Performance Tuning](#-performance-tuning)**

</div>

## 🌌 Overview

This project transforms any high-speed USB Drive into a **Sovereign AI Workstation**. Powered by **Llamafile**, it allows you to carry state-of-the-art Large Language Models (LLMs) and run them on any machine without hardware setup, internet access, or administrator privileges.

### 🌟 Premium Features

| **🔌 Zero-Footprint** | **🔒 Hardened Privacy** | **⚡ High Performance** |
| :--- | :--- | :--- |
| No registry changes or local installs. Plug in, run, and pull out. | Your data never transit through the cloud. Total air-gap safety. | Native speed via TinyBLAS and GPU offloading support. |

---

## 🔄 Visual Workflow

The "Plug & Chat" experience, visualized:

```mermaid
graph LR
    A[fa:fa-usb USB Plugged] --> B{fa:fa-desktop OS Detection}
    B -- Windows --> C[fa:fa-terminal launch_ai.bat]
    B -- Unix --> D[fa:fa-terminal launch_ai.sh]
    C --> E[fa:fa-list Model Selector]
    D --> E
    E --> F[fa:fa-bolt AI Engine Engine]
    F --> G[fa:fa-globe Browser UI]
    G --> H[fa:fa-commenting Private Chat]
    
    style A fill:#2c3e50,stroke:#3498db,stroke-width:2px,color:#fff
    style H fill:#27ae60,stroke:#2ecc71,stroke-width:2px,color:#fff
    style F fill:#e67e22,stroke:#d35400,stroke-width:2px,color:#fff
```

---

## 🚀 Setup Guide

### Step 1 — Hardware Preparation
1. Connect your **USB 3.0+** drive to a high-speed port (Blue/Red).
2. Format as **exFAT** (Required for files >4GB).

### Step 2 — The Engine
1. Download the latest **Llamafile** binary from [GitHub Releases](https://github.com/Mozilla-Ocho/llamafile/releases).
2. Place it in the root directory and rename it to **`llamafile.exe`**.

### Step 3 — The Intelligence
1. Pick a GGUF model from [Hugging Face](https://huggingface.co/models?library=gguf).
2. **Move it into the `📂 models/` folder.**
    - *Recommended:* Qwen 3 8B (Q4_K_M) or Llama 3 8B.

### Step 4 — Launch
- **Windows**: Double-click `launch_ai.bat`.
- **Linux/macOS**: Run `sh launch_ai.sh` in the terminal.

---

## 📁 Elite File Structure

A professionally organized USB drive ensures maximum speed and ease of use:

```bash
📁 USB DRIVE (exFAT)
├── 📄 llamafile.exe        # The core engine
├── 📄 launch_ai.bat        # Windows entry point
├── 📄 launch_ai.sh         # Unix entry point
├── 📁 models/              # Your brain library (.gguf files)
│    └── 📄 qwen_3_8b.gguf
├── 📁 system_prompts/      # Persona templates (.txt)
│    ├── 📄 Code_Architect.txt
│    └── 📄 ...
├── 📁 scripts/
│    └── 📄 update_llamafile.ps1 # Auto-update tool
└── 📁 assets/              # documentation visuals
```

---

## ⚡ Performance Tuning

> [!IMPORTANT]
> To achieve the best inference speed, always use a **USB 3.1 Gen 2** port or a portable NVMe SSD.

### GPU Acceleration
Llamafile automatically attempts to use your GPU. If you have an NVIDIA GPU, inference will be up to **10x faster**. No drivers needed beyond standard OS defaults.

### Advanced Flags
You can edit the `launch_ai` scripts to include:
- `--threads 8`: Optimize for your specific CPU core count.
- `-c N` | Context window size | Default is 512; increase for longer conversations (consumes more RAM) |

---

## 🔒 Privacy Hardening

To ensure no trace is left on the host computer:

### Private Browsing
The `launch_ai.bat` script now supports launching in **Incognito/Private** mode for Chrome, Edge, and Firefox. This prevents the browser from saving:
- Chat history in cache.
- Session cookies.
- Form data.

### Anti-Forensics
Always use the **"Clear All"** option in the Llamafile UI before unplugging your drive to wipe the current session from the system's memory.

---

## 🛠️ Maintenance

### Auto-Updates
Keep your AI engine up-to-date without manually visiting GitHub:
1. Open PowerShell.
2. Run the update script:
   ```powershell
   .\scripts\update_llamafile.ps1
   ```
3. The script will automatically fetch the latest `llamafile.exe` from the official repository.

---

## 🎭 System Prompts

Inject "Experience" into your AI. Copy templates from `📁 system_prompts/` directly into the UI:
- **Code Architect**: For deep technical builds.
- **Security Auditor**: For pessimistic code reviews.
- **Creative Writer**: For vivid storytelling.

---

## 🔧 Troubleshooting

<details>
<summary><b>Click to expand common fixes</b></summary>

- **"Permission Denied" (Linux/macOS)**: Run `chmod +x llamafile.exe launch_ai.sh`.
- **Extremely Slow Loading**: verify you are not using a USB 2.0 (Black) port.
- **Out of Memory**: Try a smaller model (e.g., 3B or 1.5B parameters).
</details>

---

<div align="center">

### Built for Privacy. Designed for Portability.

[**Back to Top**](#️-portable-offline-llm-on-a-usb-drive)

*Made with ❤️ by Gg — Carry your AI everywhere.*

</div>
