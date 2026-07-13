# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.8.4-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail cg-use-everywhere@7.8.0 --mode remote || (echo "WARN: cg-use-everywhere@7.8.0 unavailable in registry, falling back to latest" >&2 && comfy node install --exit-on-fail cg-use-everywhere --mode remote)
RUN comfy node install --exit-on-fail comfyui_essentials@1.1.0 || (echo "WARN: comfyui_essentials@1.1.0 unavailable in registry, falling back to latest" >&2 && comfy node install --exit-on-fail comfyui_essentials)
RUN comfy node install --exit-on-fail rgthree-comfy@1.0.2605082257 || (echo "WARN: rgthree-comfy@1.0.2605082257 unavailable in registry, falling back to latest" >&2 && comfy node install --exit-on-fail rgthree-comfy)
