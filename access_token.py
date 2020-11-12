#!/usr/env/python

#############################################
# Vivox Token Generation Example - Python
#############################################

import base64
import hashlib
import hmac
import json


def b64url(value):
    """Return a base64url-encoded str without trailing ='s"""
    return base64.urlsafe_b64encode(value).rstrip(b'=')


def vx_generate_token(key, issuer, exp, vxa, vxi, f, t):
    # Create dictionary of claims
    claims = {
        'iss': issuer,
        'exp': exp,
        'vxa': vxa,
        'vxi': vxi,
        'f': f,
        't': t
    }

    # Header is static - base64url encoded {}
    header = b64url(b'{}')  # Can also be defined as a constant "e30"

    # Encode claims payload
    b = bytes(json.dumps(claims), 'utf-8')
    json_payload = b64url(b)

    # Join segments to prepare for signing
    segments = [header, json_payload]
    to_sign = b'.'.join(segments)

    # Sign token with key and HMACSHA256
    key_b = bytes(key, 'utf-8')
    sig = hmac.new(key_b, to_sign, hashlib.sha256).digest()
    #sig_b = bytes(sig, 'utf-8')
    segments.append(b64url(sig))

    # Join all 3 parts of token with . and return
    return b'.'.join(segments)


if __name__ == '__main__':
    # Example usage
    token = vx_generate_token('back315', 'anuma3544-an77-dev', 1636683847, 'mute', 1, 'sip:.username.@domain.vivox.com', 'sip:confctl-g-channelname@domain.vivox.com')
    print(token)