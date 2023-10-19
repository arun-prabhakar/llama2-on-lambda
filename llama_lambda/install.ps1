# Create a virtual environment
python -m venv .venv

# Activate the virtual environment
.venv\Scripts\Activate

# Install dependencies
pip install -r requirements.txt

# Get the model URL from the user with a default value
$MODELURL = Read-Host -Prompt "Please provide the direct link to the model you'd like to use" -Default "https://huggingface.co/TheBloke/Llama-2-13B-GGML/resolve/main/llama-2-13b.ggmlv3.q2_K.bin"

# Download the model
Write-Host "Downloading $MODELURL"
Invoke-WebRequest -Uri $MODELURL -OutFile "./llama_cpp_docker/modelfile.bin"

# Deploy with CDK
cdk deploy
