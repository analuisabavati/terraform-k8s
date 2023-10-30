# Tech Challenge: Kubernetes com Terraform 

Este repositório faz parte da entrega do tech challenge - fase 3:
- 1 repositório para sua infra kubernetes com terraform

# Pré-requisitos

### Terraform: 
https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
### AWS CLI: 
https://docs.aws.amazon.com/pt_br/cli/latest/userguide/getting-started-install.html. 

Depois de instalado você pode configurar a AWS usando o comando aws configure, onde será requisitado a chave secreta (secret key), que pode ser criada nessa pagina (https://us-east-1.console.aws.amazon.com/iam/home?region=us-east-1#/security_credentials) clicando em “criar chave de acesso” na aba “credenciais do AWS IAM”.


# Decisões tomadas

### Provider
Nome: AWS

Região da AWS: us-east-1

### Organização de arquivos

Para os ambientes, ou "environments", utilizaremos a pasta "env". Para infraestrutura, utilizaremos a pasta "infra". Assim, manteremos os arquivos separados reutilizando a infraestrutura independentemente do ambiente.

Subimos a infa por ambientes em vez de subir dentro da pasta infra porque assim não precisamos forncer todos os valores das variáveis que declaramos e ao executar o terraform destruct podemos ter um problema com a destruição de coisas não planejadas ou acabamos não tendo a destruição de toda a infra que criamos.

### Arquivo de estado
Contexto: Sempre que executamos o Terraform, acabamos criando um arquivo de estado, que guarda todo o estado da nossa infraestrutura para podermos comparar qual estado que queremos que a nossa infraestrutura tenha com qual ela realmente tem, para podermos criar o que está faltando nela. E para podermos executar o Terraform em qualquer máquina, é interessante guardarmos esse arquivo em um local que possa ser facilmente acessado. Nesse caso, vamos guardá-lo no S3 da AWS, assim, ele fica disponível para nossa conta e não vamos perdê-lo caso troquemos de máquina, por exemplo. Também é muito interessante fazermos isso, porque, como a maioria das rotinas de entrega contínua é executada dentro de containers docker, elas não salvam nenhum tipo de arquivo local, então salvar o estado em um serviço de cloud é benéfico.

Nome do bucket: terraform-state-postech-grupo7


---- Draft

Permissionamento aditivo:  O tipo de permissionamento mais usado e recomendado hoje em dia é o aditivo, onde só damos as permissões conforme necessário e apenas o mínimo essencial.
Role: 