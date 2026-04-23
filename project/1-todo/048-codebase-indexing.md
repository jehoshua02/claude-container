# Codebase indexing

## Abstract

Ship the agent container with built-in codebase indexing and search tooling so the agent can navigate code efficiently without burning tokens reading every file.

## Priority: 048

- Value: 8/10 — directly reduces token waste, core concern
- Momentum: 3/10 — fresh capture, no related work done
- Effort: 7/10 — research + implement LSP framework + per-language installers
- Risk: 3/10 — additive feature, doesn't break existing setup

## Timeline

- Captured: 2026-04-22
- Refined: 2026-04-22

## Details

- Agent needs to understand codebases without brute-force file reading.
- Options: LSP servers, embedding/RAG, pre-built codebase maps, ripgrep (already available).
- Nothing installed by default — user opts in per language via env var or config. Keeps image lean.
- Supported languages: TypeScript, PHP, Python, Node, Go, Rust, Java, Ruby, C/C++. Others user-configurable.
- Token efficiency is a core concern (Pro plan limits).
