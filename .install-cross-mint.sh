#!/bin/sh

SUDO=$(which sudo || echo "")
if [ -z "$SUDO" ] ; then
  echo "no sudo"
else
  echo "sudo: $SUDO"
fi

DISTRIB=$(awk 'NR==1{print $0}' /etc/issue)
echo "DISTRIB=$DISTRIB"

# from the apt-key(8) man page :
# add filename (deprecated)
# Note: Instead of using this command a keyring should be placed directly
#       in the /etc/apt/trusted.gpg.d/ directory with a descriptive name
#       and either "gpg" or "asc" as file extension.
cat <<EOF | $SUDO gpg --dearmour -o /etc/apt/trusted.gpg.d/vincent.riviere.gpg
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
67lzQAken2EzMg==
=1axn
-----END PGP PUBLIC KEY BLOCK-----
EOF

# Vincent Rivière's m68k-atari-mint cross-tools
# http://vincent.riviere.free.fr/soft/m68k-atari-mint/ubuntu.php
if echo "$DISTRIB" | grep Ubuntu ; then
	$SUDO add-apt-repository -y ppa:vriviere/ppa
else
	CODENAME=$(lsb_release -c -s)
	if [ -z "$SUDO" ] ; then
		echo "deb http://vincent.riviere.free.fr/apt/ ${CODENAME} contrib" >> /etc/apt/sources.list
		echo "deb-src http://vincent.riviere.free.fr/apt/ ${CODENAME} contrib" >> /etc/apt/sources.list
	else
		echo "deb http://vincent.riviere.free.fr/apt/ ${CODENAME} contrib" | $SUDO tee -a /etc/apt/sources.list
		echo "deb-src http://vincent.riviere.free.fr/apt/ ${CODENAME} contrib" | $SUDO tee -a /etc/apt/sources.list
	fi
fi

$SUDO apt-get update -ym || exit 1
$SUDO apt-get install -ym cross-mint-essential || exit 1
