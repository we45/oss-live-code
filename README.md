## Live Code with Robot Framework

### You need: 

* Docker
* Python3
* VSCode or some other IDE
* OWASP ZAP

### Installation

**Ensure that you have a working directory and `cd` into that directory**

```bash
virtualenv venv
pip install -r requirements.txt
pip uninstall gitdb2
pip install gitdb2==2.0.6
```

### Run the basics

```bash

cd robots/
robot Robo101.robot

```

### Run the Node Example

```bash

cd node/
robot NodeSec.robot

```

### Run the ZAP Code

```bash

cd zap
robot DAST.robot

```