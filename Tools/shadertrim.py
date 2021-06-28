# Trims out non-D3D11 shader blobs from compiled unity shaders, then gzips them.

import argparse
import gzip
import regex

SUBPROG_RE = regex.compile(r"""
(?(DEFINE)
    (?<subprog_body>"(?:.|\n)*?"\n)
    (?<nbl>(?!["}]).*\n) # non-body line
    (?<subprog_line>(?:(?P>subprog_body)|(?P>nbl)))
)
SubProgram\s+"(?!d3d11).*\s+"\s+{\n
    (?P>subprog_line)+
}
""", regex.X)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("input")
    parser.add_argument("output")

    args = parser.parse_args()

    inputStr = open(args.input, "r").read()

    new = SUBPROG_RE.sub(SUBPROG_RE, "", inputStr)

    gzipped = gzip.compress(new.encode())

    open(args.output, "w").write(gzipped)

if __name__ == "__main__":
    main()
