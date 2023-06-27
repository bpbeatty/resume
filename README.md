# bpbeatty's resume


## How to build


Dependencies are captured in the Containerfile, it should be as easy as:


```
$ podman build -t bpbeatty/resume-writer:latest .
$ podman run -v $PWD:$PWD -w $PWD bpbeatty/resume-writer:latest make
```

## Acknowledgements


This project uses the [Friggeri CV Template hosted at OverLeaf](https://www.overleaf.com/latex/templates/friggeri-cv-template/hmnchbfmjgqh) as base. I customized it somewhat heavily.

Original by Adrien Friggeri (MIT license) with modifications by Alejandro Pérez Londoño (CC-BY)


## License

All the code here is released under the GPLv3, you can find a copy at [GNU's website](https://www.gnu.org/licenses/gpl-3.0.en.html) or in the LICENSE file.
