# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a LaTeX academic research paper project, NOT a software development project. The paper presents "Code-Survey: An LLM-Driven Methodology for Analyzing Large-Scale Codebases" - a novel approach using LLMs to systematically extract insights from software development history.

## Build Commands

### Prerequisites
- pdflatex
- bibtex
- Standard LaTeX packages (particularly ACM's acmart class)

### Common Commands
```bash
# Compile the full paper
make

# Clean auxiliary files (keeps PDF)
make clean

# Clean everything including PDF
make cleanall

# Force recompilation from scratch
make force
```

## Project Structure

### Main LaTeX Files
- `conference_101719.tex` - Main paper file using ACM SIGCONF format
- `method.tex` - Methodology section describing the Code-Survey approach
- `case-study.tex` - Case study applying methodology to Linux kernel eBPF
- `limit-futurework.tex` - Limitations, best practices, and future work sections
- `cite.bib` - Bibliography file with 41 references

### Older/Alternative Versions
- `intro_old.tex` - Previous introduction version (mostly commented out)
- `case-study_old.tex` - Earlier case study version
- `limit-futurework-old.tex` - Previous limitations/future work version

### Visualization Assets
The `feature-analysis/` directory contains 25+ PNG charts and graphs analyzing eBPF evolution:
- Feature timeline visualizations
- Commit classification pie charts
- Component relationship heatmaps
- Bug analysis charts
- Evolution timeline graphs

### Key Analysis Categories
The paper analyzes commits using these classification schemas:
1. **Commit Classification**: Bug Fix, Feature or Enhancement, Documentation and Comments, Refactoring or Cleanup, Dependency Updates, Performance Optimization, Test Updates, Security, Others
2. **Commit Complexity**: Simple, Moderate, Complex, Extensive
3. **Major Implementation Component**: Core Subsystem, Runtime, User-space Libraries, Compiler, Helper Functions/Infrastructure
4. **Major Related Logic Component**: Policy, Enforcement, Syscall, JIT Compiler, Memory Management, Networking, Verification
5. **Use Cases/Submodule Events**: Various eBPF subsystems and features

## Working with This Paper

### Editing Sections
The paper uses `\input{}` commands to include modular sections. To edit:
- Methodology: Edit `method.tex`
- Case study: Edit `case-study.tex`
- Limitations/Future work: Edit `limit-futurework.tex`

### Managing References
- Bibliography is in `cite.bib`
- Uses natbib citation style
- Run bibtex as part of the compilation process (handled by Makefile)

### Figure Management
- Figures are included from `feature-analysis/` directory
- Most figures are referenced with labels like `fig:cumulative_feature_timeline`
- Ensure figure files exist before referencing them

## Important Notes

1. This repository contains a complete academic paper ready for submission to ACM conferences
2. The paper is set up for anonymous review (uses `anonymous` option in document class)
3. Some LaTeX packages may generate warnings about missing fonts (libertine, inconsolata, newtxmath) - these don't prevent compilation
4. The .gitignore is configured to exclude LaTeX auxiliary files while keeping the PDF tracked (conference_101719.pdf is specifically included)