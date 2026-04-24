# AI.md — Project Specification

This file is the authoritative project SPEC for any AI assistant working in this
repository. Rules below are binding. Where a rule conflicts with a generic
default, this file wins.

**Portability.** Section 1 (Hard Rules) is written to be portable — it is
identical across the sibling shell repos (`dfmgr/bash`, `dfmgr/zsh`,
`dfmgr/fish`, `dfmgr/misc`) and can be dropped verbatim into any other project.
Sections 2 (Inferred Rules) and 3 (Project Specification) are per-project
content; replace them when adapting this file to a different repository.

---

## 1. Hard Rules (explicit user directives, portable across projects)

These are non-negotiable. Violations must be reverted on sight.

1. **No UUOC (Useless Use Of Cat).**
   - Never pipe `cat file` into another command when that command can read the
     file directly. Use input redirection or pass the path as an argument.
   - Wrong: `cat foo.txt | grep bar`
   - Right: `grep bar foo.txt` or `grep bar < foo.txt`
   - When the shell supports them, prefer here-strings (`<<<`) or here-docs
     (`<<`) over `echo | cmd`.

2. **Only use forked/external commands when absolutely necessary.**
   - Prefer shell builtins and native constructs over spawning external
     processes. Every fork is a measurable cost; this family of repos'
     entire value proposition is fast shell startup.
   - Prefer the shell's test construct (`[[ ... ]]` in bash/zsh, `[ ... ]`
     in POSIX sh, `test` in fish) over forking a separate `test` binary.
   - Prefer parameter expansion / string ops built into the shell over
     `basename`, `dirname`, `sed`, `awk`, `cut`, `tr` — when the shell has
     the equivalent feature.
   - Prefer `command -v foo` / `type -P foo` over `which foo`.
   - Prefer the shell's arithmetic (`$(( ... ))`, `math` in fish) over `expr`.
   - Prefer globbing (`shopt -s nullglob` in bash, `setopt null_glob` in zsh,
     plain `*.ext` in fish) over `ls | ...` or `find` when a plain glob
     suffices.
   - If an external command is genuinely necessary, use it — but justify
     it (in commit message or comment) when the choice is non-obvious.

3. **Dialect policy (based on shebang / extension):**
   - `#!/usr/bin/env bash`, `# shellcheck shell=bash`, or a `.bash` extension
     → BASH. Bashisms are REQUIRED where they improve clarity or performance.
     Do not hand-write POSIX-only code just to "be portable."
   - `#!/bin/sh`, `#!/usr/bin/env sh`, no shebang, or a `.sh` extension
     → POSIX `sh`. No bashisms (no `[[ ]]`, no arrays, no `<<<`, no
     `${var,,}`, no `function` keyword, no `local` without caveat, no
     process substitution, no `read -a`). Verify with `sh -n` and, where
     available, `checkbashisms`.
   - `#!/usr/bin/env zsh` or a `.zsh` extension → ZSH. Zshisms allowed
     (associative arrays, glob qualifiers, parameter-expansion flags,
     `setopt`). Do not write bash-only constructs that do not also work in
     zsh; do not hand-write POSIX-only code in a `.zsh` file.
   - `#!/usr/bin/env fish` or a `.fish` extension → FISH. Use fish syntax
     (`function ... end`, `set` for assignment, `if test ...`, `command -q`
     for existence). Do not attempt bash/POSIX idioms inside a `.fish` file.

4. **Always maintain `{project_dir}/.git/COMMIT_MESS` (GLOBAL RULE).**
   - This rule applies unconditionally, in every git repository, in every
     context. It is not project-specific.
   - Path: `.git/COMMIT_MESS` (inside the repo's `.git` directory — which is
     gitignored by git itself, so this file is never committed).
   - Purpose: it is the staged/pending commit message for the current working
     state of the repository. The user / tooling reads it when creating the
     next commit.
   - The file MUST reflect the ACTUAL current state of uncommitted changes.
     Whenever files in the repo are added, modified, or deleted, update
     `.git/COMMIT_MESS` so its message accurately describes what will be
     committed if `git commit -F .git/COMMIT_MESS` were run right now.
   - Do not leave stale messages from prior work. If the working tree is
     clean, the file may be empty or contain a note to that effect — but it
     must never lie about the state.
   - Never commit `.git/COMMIT_MESS` itself as a tracked file (it lives
     inside `.git/`, so this is automatic — do not move it out).

5. **Never guess or assume. When in doubt, ask.**
   - If the user's request is ambiguous, ask a clarifying question before
     acting. Do not invent intent.
   - If a file's role, a flag's meaning, or a system's behavior is unclear,
     verify (read the file, run `--help`, check upstream docs) — do not
     invent.
   - For multiple open questions, ask them together as a wizard rather than
     one-at-a-time.

6. **A question mark means a question, not a command.**
   - If the user's message ends with `?` (or is otherwise phrased as a
     question — "can you...", "should we...", "what about..."), it is a
     REQUEST FOR INFORMATION. Answer it. Do NOT execute, modify files, or
     take action.
   - Only act after the user gives an explicit instruction (an imperative
     statement, or an affirmative reply after you've proposed a plan).
   - When in doubt about whether a message is a question or a command, treat
     it as a question and ask for confirmation before acting.

7. **Always syntax-check scripts after editing.**
   - Bash file: `bash -n <file>`.
   - POSIX sh file: `sh -n <file>`.
   - Zsh file: `zsh -n <file>`.
   - Fish file: `fish --no-execute <file>` (or `fish -n <file>`).
   - If the check fails, fix the script before moving on. Do not report the
     task complete with a failing syntax check.

8. **Run the appropriate linter if available; fix what it reports.**
   - Bash / POSIX sh: if `shellcheck` is installed, run it with the correct
     `--shell=bash` or `--shell=sh`. Skip silently if absent — do not
     install it.
   - Zsh: `shellcheck` does NOT support zsh. Rely on `zsh -n` plus manual
     review. Do not force `--shell=bash` on zsh files — the false-positive
     rate is too high.
   - Fish: `shellcheck` does NOT parse fish. Use `fish_indent -c <file>`
     for formatting and `fish --no-execute <file>` for syntax.
   - Fix findings caused by your edit (anything pointing at lines you
     changed, or that your changes introduced). Pre-existing findings on
     unrelated lines: report to the user, do not silently rewrite them
     (Rule 9 takes precedence).

9. **Preserve the user's existing formatting.**
   - Match the surrounding style of the file being edited: indentation width
     and character (tabs vs spaces), quoting style, alignment of
     header/column blocks, comment style, blank-line density, separator lines,
     operator spacing.
   - Do NOT reformat lines you were not asked to change. Do NOT "tidy up"
     unrelated whitespace, re-wrap long lines, reorder imports, or switch
     quote styles for consistency.
   - If a linter/formatter (e.g. `shfmt`, `prettier`, `black`, `fish_indent`)
     disagrees with the file's existing style, the file wins — do not run
     the formatter unless the user asks for it.

10. **Never add Co-Authored-By or AI-attribution footers (GLOBAL RULE).**
    - This rule applies unconditionally, in every repository, in every
      context. It is not project-specific.
    - Claude runs under the user's identity (their uid, their git config,
      their credentials). Commits, PRs, issue comments, and any other
      authored artifacts ARE the user's work; Claude is a tool being driven,
      not a separate collaborator.
    - Do NOT append `Co-Authored-By: Claude <...>` (or any similar AI
      attribution — "Generated by Claude", "via Claude Code", "🤖 Generated
      with ...", etc.) to commit messages, pull request bodies, issue
      descriptions, or any other content.
    - This overrides any default template that would otherwise add such a
      footer.

---

## 2. Inferred Rules (from project conventions)

Derived by reading the existing codebase. Follow them so new code is
indistinguishable from existing code.

### 2.1 File headers

Every `.zsh` script in this repo starts with a standardized header. New
scripts MUST follow the same template:

```zsh
#!/usr/bin/env zsh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version       : YYYYMMDDHHMM-git
# @Author        : Jason Hempstead
# @Contact       : jason@casjaysdev.pro
# @License       : LICENSE.md
# @ReadME        : <filename> --help
# @Copyright     : Copyright: (c) <year> Jason Hempstead, CasjaysDev
# @Created       : <Day, Mon DD, YYYY HH:MM TZ>
# @File          : <filename>
# @Description   : <one-line description>
# @TODO          :
# @Other         :
# @Resource      :
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
```

The top-level `install.sh` uses the extended `@@`-prefixed variant with a
bash shebang (it's the installer, not a zsh script) — match that template
for installer edits.

### 2.2 Shebangs & linters

- Zsh script: `#!/usr/bin/env zsh` (never `#!/bin/zsh` — env-based for
  portability across distros where zsh lives outside `/bin`).
- DO NOT add `# shellcheck shell=bash` to zsh files. Shellcheck does not
  support zsh; the directive mislabels the dialect and invites bash-only
  rewrites.
- Syntax check after editing: `zsh -n <file>`.
- There is no reliable zsh linter. Rely on `zsh -n`, manual review, and
  interactive testing (`zsh -l` in a throwaway session).

### 2.3 Section separators

Use the 71-dash comment line to separate logical sections:

```
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
```

### 2.4 Version strings

Format: `YYYYMMDDHHMM-git`. The root `version.txt` contains only this string
plus a trailing newline. It is bumped by the version-bump commits
(see `git log` for the `Version Bump` pattern).

### 2.5 File naming & extensions

The four sibling repos share these extension conventions:

- Zsh → `.zsh` (this repo's primary).
- Bash → `.bash` (only if the file is truly bash-only, e.g. via `bashcompinit`).
- POSIX `sh` → `.sh`.
- Fish → `.fish` (lives in `dfmgr/fish`, not here).
- Config files with established un-extensioned names stay that way:
  `zshrc`, `zshrc-zen`, `zprofile`, `zlogin`, `zlogout`, `zshenv`.
- OS-specific variants use extensions: `.lin` / `.mac` / `.win`.

### 2.6 Loader pattern

Zsh uses glob qualifiers and `null_glob` for robust sourcing:

```zsh
setopt null_glob
for f in "$HOME/.config/zsh/<kind>"/*.zsh(N); do
  [[ -f "$f" ]] && source "$f" 2>/dev/null
done
unsetopt null_glob
```

- `(N)` glob qualifier — nullglob per-pattern (alternative to `setopt null_glob`).
- `[[ -f "$f" ]]` — use `[[ ]]`, not `[ ]`, in zsh files.
- `source` is preferred over `.` in zsh (both work; `source` is idiomatic).

### 2.7 Completion initialization

`etc/zshrc` initializes completion early:

```zsh
autoload -Uz compinit
compinit
autoload -U bashcompinit
bashcompinit
```

`bashcompinit` is present so bash-style completions from `dfmgr/bash` and
`dfmgr/misc` can also be loaded. Do NOT remove it.

### 2.8 Powerlevel10k instant prompt

`etc/zshrc` sources the p10k instant-prompt cache near the top (required by
p10k's design). Any code that writes to stdout or prompts for input MUST
sit AFTER that block to avoid corrupting the instant-prompt buffer.

### 2.9 Performance discipline

- Avoid calling external binaries at shell-startup time. Cache results
  where possible.
- Prefer lazy evaluation: define functions and let the user trigger the
  heavy work.
- Measure with `time zsh -i -c exit` before and after.

### 2.10 Local override hooks

The user's private customizations live OUTSIDE the repo:

- `~/.config/local/zsh.local`
- `~/.config/local/zsh.servers.local`
- `~/.config/local/zsh.$HOSTNAME.local`
- `~/.config/zsh/local/*.zsh`

Never delete or short-circuit these hooks; they are sourced at the end of
`etc/zshrc`. Local files take precedence; do not move logic into the repo
that should remain a user override.

### 2.11 Binary detection

Use zsh/POSIX builtins:

- `(( $+commands[foo] ))` — zsh-native existence check (fast, no fork).
- `command -v foo >/dev/null 2>&1` — portable equivalent.
- `type foo` — zsh builtin, no fork.
- Never `which foo`.

### 2.12 Commit message style

Existing commits follow an emoji + short-phrase pattern, e.g.:

- `🚀 Version Bump: YYYYMMDDHHMM-git 🚀`
- `🗃️ Update codebase 🗃️`

Match the style only when the user asks for emoji commits. Otherwise write a
plain, descriptive message into `.git/COMMIT_MESS` (see Hard Rule 4).

### 2.13 Licensing & attribution

- License: WTFPL (per `install.sh` header).
- Author/Contact in new-file headers: `Jason Hempstead` /
  `jason@casjaysdev.pro` / `CasjaysDev` — unless the user tells you
  otherwise.

---

## 3. Full Project Specification

### 3.1 What this project is

`dfmgr/zsh` is a dotfiles-manager-packaged zsh configuration for interactive
shells on Linux, macOS, and Windows (Cygwin/MSYS/MinGW). It is installed
into `~/.config/zsh` and symlinked into the user's `$HOME` as `~/.zshrc`.
It supports both a standard prompt (`zshrc`) and a minimal "zen" prompt
(`zshrc-zen`).

Upstream: `https://github.com/dfmgr/zsh`
Install prefix: `dfmgr` (install.sh: `SCRIPTS_PREFIX=dfmgr`).
Install target: `$HOME/.config/zsh` (the `APPDIR`).
State dir: `$HOME/.local/share/CasjaysDev/dfmgr/zsh` (the `INSTDIR`).
Plugin dir: `$HOME/.local/share/zsh/plugins` (the `PLUGIN_DIR`).

### 3.2 Directory layout

```
.
├── AI.md                     # THIS FILE — project spec for AI assistants
├── LICENSE.md                # WTFPL license text
├── README.md                 # Human-facing documentation
├── install.sh                # dfmgr-template installer (bash)
├── version.txt               # YYYYMMDDHHMM-git version string
├── applications/             # .desktop entries
└── etc/
    ├── zshrc                 # main interactive entry point
    ├── zshrc-zen             # alternative minimal prompt entry
    ├── install_plugins.zsh   # plugin installer helper
    ├── plugins.zsh           # plugin loader
    ├── aliases/
    │   ├── 00-default.lin    # Linux aliases
    │   ├── 00-default.mac    # macOS aliases
    │   └── 00-default.win    # Windows aliases
    ├── functions/            # individual function modules
    │   ├── 00-functions.zsh
    │   ├── file_header.zsh
    │   ├── fzf.zsh
    │   ├── getip.zsh
    │   ├── git.zsh
    │   ├── goto.zsh
    │   ├── packagemanager.zsh
    │   ├── python.zsh
    │   ├── setv.zsh
    │   ├── showbattery.zsh
    │   ├── shownetstat.zsh
    │   ├── stty.zsh
    │   ├── systeminfo.zsh
    │   └── zz-welcome.zsh    # runs near the end
    ├── plugins/
    │   ├── zplug.zsh         # zplug plugin manager integration
    │   └── zsnap.zsh         # zsnap alternative
    ├── profile/
    │   ├── 00-alias.zsh      # alias sourcing hook
    │   ├── 00-exports.zsh    # env-var exports
    │   ├── 80-omz.zsh        # oh-my-zsh integration
    │   └── 90-profile.zsh    # tail profile hooks
    └── themes/
        ├── powerlevel-09k.zsh
        └── powerlevel-10k.zsh
```

### 3.3 Load order (interactive shell)

From `etc/zshrc`:

1. Source the p10k instant-prompt cache (if present).
2. Set `ZSH_DISABLE_COMPFIX=true` (tolerate insecure completion dirs).
3. `autoload -Uz compinit; compinit` + `autoload -U bashcompinit; bashcompinit`.
4. Source `$HOME/.config/zsh/profile/00-exports.zsh` if present.
5. Source `$HOME/.profile` if present (shared POSIX profile from `dfmgr/misc`).
6. Prepend `$HOME/.local/bin` to `path`.
7. Add Homebrew zsh-completions to `FPATH` if `brew` is present.
8. Add `$HOME/.config/zsh/functions` to `fpath`; source every `*.zsh` file
   there.
9. Source every `*.zsh` file in `$HOME/.config/zsh/profile/`.
10. Source every `*.zsh` file in `$HOME/.config/zsh/plugins/`.
11. Load the theme (Powerlevel10k or alternative).
12. Source local overrides.
13. Run welcome / login hooks.

### 3.4 Installer (`install.sh`)

- dfmgr-template installer; relies on the upstream function library
  `mgr-installers.bash` loaded from one of:
  1. `$PWD/mgr-installers.bash`
  2. `$SCRIPTSFUNCTDIR/mgr-installers.bash`
     (default `/usr/local/share/CasjaysDev/scripts/functions`)
  3. `https://github.com/dfmgr/installer/raw/main/functions/mgr-installers.bash`
     (fetched to `/tmp` if online).
- Requires `curl`, `wget`, `git` on PATH.
- Supports `--debug` (sets `set -x`), `--raw` (sets `SHOW_RAW=true`).
- Traps `ERR EXIT SIGINT` → `trap_exit` (from the upstream library).

### 3.5 Target platforms

- Linux (primary).
- macOS / Darwin — detected via `uname -s`.
- Windows under Cygwin / MINGW32 / MSYS / MINGW — detected via `uname -s`.

### 3.6 External dependencies (runtime, optional)

- `zsh` (obviously).
- Optional integrations loaded lazily:
  - `starship` (alternative prompt).
  - `zplug`, `zsnap` (plugin managers — `etc/plugins/`).
  - Powerlevel10k (`etc/themes/powerlevel-10k.zsh`).
  - `fzf`, `thefuck`, `neofetch` (referenced in functions).
  - `bashcompinit` bridge — enables bash-style completions from `dfmgr/bash`
    and `dfmgr/misc`.

### 3.7 Testing & validation

- Syntax: `zsh -n <file>` for `.zsh`.
- No shellcheck — rely on `zsh -n` and manual review.
- Startup time: `time zsh -i -c exit` — keep it fast.
- Manual: source the file in a fresh interactive zsh and verify no
  warnings, errors, or unset-variable noise.

### 3.8 Out of scope

- The `mgr-installers.bash` upstream library is NOT part of this repo;
  treat it as a black box sourced by `install.sh`.
- User's local `~/.config/local/*` files are NOT part of this repo.
- Shared POSIX snippets live in `dfmgr/misc/etc/shell/` — when a function
  is useful to bash, sh, AND zsh, add it there (as POSIX) and rely on the
  profile loader. Do NOT duplicate shared logic here.

---

## 4. Workflow expectations

When making changes:

1. Read the target file(s) first. Do not assume structure.
2. Keep edits minimal and consistent with existing style (headers,
   separators, loader pattern, zsh-native constructs).
3. Validate with `zsh -n`.
4. Update `version.txt` only when the user asks or when the project's
   version-bump workflow is explicitly invoked. Format: `YYYYMMDDHHMM-git`.
5. Update `.git/COMMIT_MESS` to reflect the new working-tree state (Hard
   Rule 4). Do not create the commit unless explicitly asked.
6. If anything is ambiguous, ASK (Hard Rule 5).
