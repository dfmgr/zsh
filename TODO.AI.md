# TODO.AI.md

Deferred items found during the audit/fix pass, deliberately left
unfixed pending user sign-off.

- install.sh (finding #32): trap ordering issue flagged in the
  original audit. The original finding's exact wording was lost to a
  context compaction before it could be applied; the fix carries
  real blast-radius risk (a wrong trap change could break error
  handling for the whole installer) and needs either the original
  finding text or fresh user direction before being attempted.
- install.sh (finding #66): pgrep/quoting refactor flagged in the
  original audit. Too broad a change to guess correctly from memory
  alone; needs the original finding text or fresh user direction.
- install.sh (finding #38): the installer itself is fetched and run
  via a curl|bash-style pattern. This is an inherent risk in the
  upstream installer distribution model, not a bug introduced by
  this repo's code; left as-is pending user direction on whether to
  restructure distribution entirely.
- install.sh (findings #43, #68, #73): flagged during the original
  audit but their finding text was lost to a context compaction
  before detail could be recorded here. Needs a fresh audit pass to
  recover what they cover.
- etc/profile/80-omz.zsh (finding #2): originally listed as a
  separate finding (destructive unconditional oh-my-zsh re-clone on
  every shell startup). This was fully resolved as a side effect of
  fixing finding #5 in the same file (removal of the whole
  rm -Rf "$ZSH" clone block) — not a remaining skip, noted here only
  so #2 isn't mistaken for still-outstanding.
- etc/functions/git.zsh: uses `[ ]` instead of `[[ ]]` in a
  pure-zsh-only function, the same class of issue fixed elsewhere
  under finding #45, but this file was never included in the
  original audit pass. Needs a follow-up pass.
- etc/themes/powerlevel-10k.zsh: vendored ~83KB p10k config file
  carrying trailing whitespace throughout. Left untouched — this is
  third-party vendored/generated output (same treatment as
  completions/fnm.bash in dfmgr/bash), and falls under external-
  contributions handling rather than a normal bugfix pass.
- etc/themes/powerlevel-09k.zsh: same category as powerlevel-10k.zsh
  above (theme config, not hand-authored logic) — excluded from the
  2026-09-03 header-template sweep for the same reason and left
  completely untouched.
