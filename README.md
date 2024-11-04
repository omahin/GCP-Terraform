## Requirements

Este projeto não requer módulos externos além dos já incluídos no `main.tf`.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.9.0 |

Este provedor permite a interação com o Google Cloud Platform (GCP) e é usado para provisionar recursos como instâncias de VM, funções do Cloud Functions e buckets de armazenamento.

## Modules

Nenhum módulo externo é utilizado neste projeto.

## Resources

| Name | Type |
|------|------|
| [google_cloudfunctions_function.http_function](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function) | resource |
| [google_compute_instance.vm_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_storage_bucket.function_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_object.function_zip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_function_memory"></a> [function\_memory](#input\_function\_memory) | Memória disponível para a função (em MB) | `number` | `128` | no |
| <a name="input_function_runtime"></a> [function\_runtime](#input\_function\_runtime) | Runtime da função no Cloud Functions | `string` | `"nodejs14"` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | Tipo de máquina para a instância de VM | `string` | `"e2-micro"` | no |
| <a name="input_network"></a> [network](#input\_network) | Rede VPC para a instância de VM | `string` | `"default"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID do projeto no GCP | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Região do GCP para provisionamento | `string` | `"europe-west3"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags para aplicar à VM | `list(string)` | <pre>[<br/>  "http-server"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_function_bucket_name"></a> [function\_bucket\_name](#output\_function\_bucket\_name) | Nome do bucket de armazenamento para o código da função |
| <a name="output_function_url"></a> [function\_url](#output\_function\_url) | URL da Função Cloud HTTP |
| <a name="output_region"></a> [region](#output\_region) | Região onde os recursos foram provisionados |
| <a name="output_vm_instance_name"></a> [vm\_instance\_name](#output\_vm\_instance\_name) | Nome da instância de VM |
| <a name="output_vm_instance_public_ip"></a> [vm\_instance\_public\_ip](#output\_vm\_instance\_public\_ip) | Endereço IP público da instância de VM |
