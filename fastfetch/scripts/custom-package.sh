system_count=$(nix-store -q --references /nix/var/nix/profiles/system | grep -E "/nix/store/.{32}-" | wc -l)
user_count=$(nix-env -q | wc -l)

# Use shell arithmetic with $(( ))
sum=$((system_count + user_count))

echo "$sum"
