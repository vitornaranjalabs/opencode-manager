## SSH Authentication Test

To test SSH authentication for Git operations, follow these steps:

### Step 1: Verify SSH Key

Check if you have an SSH key configured in OpenCode Manager:
- Go to Settings → Git Credentials
- Ensure an SSH credential exists with:
  - Name: github-ssh
  - Host: github.com
  - Type: SSH Key
  - Private Key: Your private key (starts with -----BEGIN OPENSSH PRIVATE KEY----- or -----BEGIN RSA PRIVATE KEY-----)

### Step 2: Test Connection

Run this command in the terminal:

```
ssh -T -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=accept-new -o ConnectTimeout=10 git@github.com
```

If successful, you'll see: `Hi <username>! You've successfully authenticated...`

### Step 3: Test Git Push

Try pushing a small change to verify full functionality:
1. Make a minor change to any file
2. Commit the change
3. Push to GitHub

If all steps work, SSH authentication is properly configured!
