# SSH Connection Test

To verify SSH authentication is working correctly, run the following test:

## Quick Test

Execute this command to test SSH connectivity to GitHub:

```bash
ssh -T -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=accept-new -o ConnectTimeout=10 -o PasswordAuthentication=no git@github.com
```

Expected success response:
- `Hi <username>! You've successfully authenticated...`

## Git Remote Test

To test actual git operations over SSH:

```bash
git ls-remote git@github.com:vitornaranjalabs/opencode-manager.git HEAD
```

Expected output should show the latest commit hash.

## Troubleshooting

If you get "Permission denied":
1. Check your SSH key is added to GitHub: https://github.com/settings/keys
2. Verify the key type is supported (Ed25519 or RSA)
3. Ensure the private key is configured in OpenCode Manager settings

If you get "Connection timed out":
1. Check network connectivity
2. Verify firewall allows outbound SSH (port 22)
