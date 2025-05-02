#!/bin/sh
# G.I.T.T. → Git Interactive Task Terminal
# v0.01
# POSIX compliant

# Designed for operators who value consistency over cleverness.
# GITT consolidates essential Git tasks into a repeatable, portable interface.
# It reduces friction, enforces team patterns, and frees memory for higher-level work.

# Standardize the tasks. Streamline the flow. Strengthen the outcomes.

# --- Check if Git is installed ---
if ! command -v git >/dev/null 2>&1; then
    printf "bitch please, get git!\n"
    exit 1
fi

while true; do
    clear
    printf "=========================================\n"
    printf "    G I T T    C O N S O L E   v1.0\n"
    printf "   (formerly: gcom 0.001 legacy)\n"
    printf "   because ain't nobody got time to\n"
    printf "   remember all this shit\n"
    printf "=========================================\n"

    printf "%-3s %-30s %-3s %-30s\n" "1." "Repo Status (Enhanced)" "11." "Show Global Ignore"
    printf "%-3s %-30s %-3s %-30s\n" "2." "Short Log & Branch" "12." "Fetch + Prune"
    printf "%-3s %-30s %-3s %-30s\n" "3." "Diff Summary" "13." "Reset Last Commit (soft)"
    printf "%-3s %-30s %-3s %-30s\n" "4." "Quick Push Combo" "14." "Undo Last Pull (reflog)"
    printf "%-3s %-30s %-3s %-30s\n" "5." "Show Configs" "15." "Cleanup Untracked Files"
    printf "%-3s %-30s %-3s %-30s\n" "6." "Show Remote Branches" "16." "Stash Changes"
    printf "%-3s %-30s %-3s %-30s\n" "7." "Graph All Branches" "17." "Stash Pop"
    printf "%-3s %-30s %-3s %-30s\n" "8." "Who Changed This File?" "18." "Amend Last Commit"
    printf "%-3s %-30s %-3s %-30s\n" "9." "Recent Merges" "19." "Squash Commits"
    printf "%-3s %-30s %-3s %-30s\n" "10." "Show Tags" "20." "Push Tags"

    printf "\nPress 0 to Exit\n"
    printf "=========================================\n"
    printf "Choose an option: "
    read choice

    case $choice in
        1)
            git status
            git rev-list --left-right --count HEAD...@{u} 2>/dev/null
            ;;
        2)
            git log --oneline --graph --decorate --all
            git branch --show-current
            ;;
        3)
            git diff --stat
            ;;
        4)
            git pull && git add . && git commit -m "quick check-in" && git push
            ;;
        5)
            printf "\n=== Local Config ===\n"
            git config --local --list
            printf "\n=== Global Config ===\n"
            git config --global --list
            ;;
        6)
            git branch -r
            ;;
        7)
            git log --graph --all --oneline
            ;;
        8)
            printf "Enter filename: "
            read filename
            git log --follow -- "$filename"
            ;;
        9)
            git log --merges --oneline
            ;;
        10)
            git tag
            ;;
        11)
            if git config --global core.excludesFile >/dev/null; then
                echo "Global .gitignore file:"
                git config --global core.excludesFile
            else
                echo "No global .gitignore set."
            fi
            ;;
        12)
            git fetch --prune
            ;;
        13)
            git reset --soft HEAD~1
            ;;
        14)
            git reflog
            ;;
        15)
            git clean -n -d
            ;;
        16)
            git stash
            ;;
        17)
            git stash pop
            ;;
        18)
            git commit --amend
            ;;
        19)
            git rebase -i HEAD~3
            ;;
        20)
            git push --tags
            ;;
        0)
            printf "Exiting.\n"
            break
            ;;
        *)
            printf "Invalid option. Try again.\n"
            ;;
    esac

    printf "\nPress Enter to continue..."
    read dummy
done
# "smh this too much"
# if your way works, keep at it. mine’s built different.
