"""Record the Authenticode certificate chain embedded in bin/runtime.dll and bin/preloader.dll.

Reads each file's security directory (WIN_CERTIFICATE) and lists the PKCS#7 certificates with
openssl. The signature itself is not verified. Writes authenticode-signers.json beside this script.
Usage: python3 -I signers.py [bin directory]
"""
import hashlib, json, os, struct, subprocess, sys

import pefile

HERE = os.path.dirname(os.path.abspath(__file__))
BIN = sys.argv[1] if len(sys.argv) > 1 else "/mnt/WORMHOLE/SteamLibrary/steamapps/common/Helldivers 2/bin"


def main():
    out = {"verified": False, "tool": subprocess.run(["openssl", "version"], capture_output=True, text=True).stdout.strip(), "files": {}}
    for name in ("runtime.dll", "preloader.dll"):
        path = os.path.join(BIN, name)
        data = open(path, "rb").read()
        d = pefile.PE(path, fast_load=True).OPTIONAL_HEADER.DATA_DIRECTORY[4]  # IMAGE_DIRECTORY_ENTRY_SECURITY
        length, revision, kind = struct.unpack_from("<IHH", data, d.VirtualAddress)
        pkcs7 = data[d.VirtualAddress + 8:d.VirtualAddress + length]
        text = subprocess.run(["openssl", "pkcs7", "-inform", "DER", "-print_certs", "-noout"], input=pkcs7,
                              capture_output=True, check=True).stdout.decode()
        certs = [{"subject": s.split("=", 1)[1].strip(), "issuer": i.split("=", 1)[1].strip()}
                 for s, i in zip([l for l in text.splitlines() if l.startswith("subject=")],
                                 [l for l in text.splitlines() if l.startswith("issuer=")])]
        out["files"][name] = {"sha256": hashlib.sha256(data).hexdigest(), "file_offset": "0x%X" % d.VirtualAddress,
                              "length": "0x%X" % length, "revision": "0x%X" % revision, "certificate_type": kind,
                              "pkcs7_sha256": hashlib.sha256(pkcs7).hexdigest(), "certificates": certs}
    json.dump(out, open(os.path.join(HERE, "authenticode-signers.json"), "w"), indent=2)
    print("\n".join("%s: %s" % (n, f["certificates"][-1]["subject"]) for n, f in out["files"].items()))


if __name__ == "__main__":
    main()
