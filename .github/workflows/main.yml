workflow "New workflow" {
  on = "push"
  resolves = ["nmap-scanner"]
}

action "nmap-scanner" {
  uses = "./nmap-scanner"
  secrets = ["GITHUB_TOKEN"]
}
