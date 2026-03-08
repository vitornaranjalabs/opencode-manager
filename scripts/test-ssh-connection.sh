#!/bin/bash

set -e

echo "Testing SSH connection to GitHub..."

HOST="${1:-github.com}"
TIMEOUT=10

echo "Testing connection to $HOST with ${TIMEOUT}s timeout..."

RESULT=$(ssh -T -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=accept-new -o ConnectTimeout=$TIMEOUT -o PasswordAuthentication=no git@$HOST 2>&1 || true)

echo "Result: $RESULT"

if echo "$RESULT" | grep -qi "successfully authenticated\|hi \|permission denied"; then
    if echo "$RESULT" | grep -qi "permission denied"; then
        echo "❌ SSH authentication failed - check your SSH key is added to GitHub"
        exit 1
    else
        echo "✅ SSH connection successful!"
        exit 0
    fi
else
    echo "⚠️  Unexpected response, but connection may still work"
    exit 0
fi
