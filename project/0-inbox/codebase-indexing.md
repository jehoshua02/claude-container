# Codebase indexing

## Abstract

Ship the agent container with built-in codebase indexing and search tooling so the agent can navigate code efficiently without burning tokens reading every file.

## Details

- Agent needs to understand codebases without brute-force file reading.
- Options: LSP servers, embedding/RAG, pre-built codebase maps, ripgrep (already available).
- Should work out of the box — no user configuration needed for common languages.
- Token efficiency is a core concern (Pro plan limits).
