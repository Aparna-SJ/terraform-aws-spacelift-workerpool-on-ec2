variable "ami_id" {
  type        = string
  description = "ID of the Spacelift AMI. If left empty, the latest Spacelift AMI will be used."
  default     = ""
}


variable "configuration" {
  type        = string
  description = <<EOF
  User configuration. This allows you to decide how you want to pass your token
  and private key to the environment - be that directly, or using SSM Parameter
  Store, Vault etc. Ultimately, here you need to export SPACELIFT_TOKEN and
  SPACELIFT_POOL_PRIVATE_KEY to the environment.
  EOF
  default = <<-EOT
    export SPACELIFT_TOKEN="eyJicm9rZXIiOnsiZW5kcG9pbnQiOiJhcjM0enRleGs1M3FuLWF0cy5pb3QuZXUtd2VzdC0xLmFtYXpvbmF3cy5jb20iLCJwdWJsaXNoX2NoYW5uZWxfZm9ybWF0Ijoic3BhY2VsaWZ0L3dyaXRlb25seS8wMUgzMUUwNFk4U1ZWWkVYMDZWWEZZNjRKMC8lcyIsInN1YnNjcmliZV9jaGFubmVsX2Zvcm1hdCI6InNwYWNlbGlmdC9yZWFkb25seS8wMUgzMUUwNFk4U1ZWWkVYMDZWWEZZNjRKMC8lcyJ9LCJwb29sX2NlcnQiOiItLS0tLUJFR0lOIENFUlRJRklDQVRFLS0tLS1cbk1JSUVnRENDQTJpZ0F3SUJBZ0lVSEtMYlZxdDJDZkZDQUFUV0VKbm03Y3Fza1JFd0RRWUpLb1pJaHZjTkFRRUxcbkJRQXdUVEZMTUVrR0ExVUVDd3hDUVcxaGVtOXVJRmRsWWlCVFpYSjJhV05sY3lCUFBVRnRZWHB2Ymk1amIyMGdcblNXNWpMaUJNUFZObFlYUjBiR1VnVTFROVYyRnphR2x1WjNSdmJpQkRQVlZUTUI0WERUSXpNRFl4TmpBMk1qSXdcbk5Wb1hEVFE1TVRJek1USXpOVGsxT1Zvd1JURUxNQWtHQTFVRUJoTUNRVlV4RXpBUkJnTlZCQWdNQ2xOdmJXVXRcblUzUmhkR1V4SVRBZkJnTlZCQW9NR0VsdWRHVnlibVYwSUZkcFpHZHBkSE1nVUhSNUlFeDBaRENDQWlJd0RRWUpcbktvWklodmNOQVFFQkJRQURnZ0lQQURDQ0Fnb0NnZ0lCQU9PaGZmWGtEUjkzU3NOb0xCajhHdDZiSnNvWDRNMDZcbnlrRVB1cTlJbStabmdYUFFTZERRUDRZL3dzMmxzdkdScDV6VDlkTUw5YU9EdVl4OVZBQ2VFU09oKzJDTFFNZGZcbm50SVBoREJKbWxJekJXSTBLRUdQTEg3dGVWMHpCalJ0SVE0ZzVjdXhvaWF0elZmMElaOTNMbzRZYXFvaGhNemxcbktYcXA5NXZ0eTdXQnYrTXBpQWpmbmxvaGRWMlBvNm9kczExNTNFSTczdzV2cXFvY3lNNk1uNkIyWTl2UU1CdGVcblNQNjRhc1Jhd0tqczFtSzljUzcyWWVXNEkzVzZ1dEdEcnF6aElacmVmRmxXajEvQ210eHhLb1BXdGxYT1M5THhcbjh1VEtzVUs0TnBYNnRBQjJJbHlJbnBsNEsydXZOSEN0U3ZTaFZMQTlTN0VmbDNPUC9uRjV5S1ErbTBocm0va2VcblNJNkY3ODVpbDBYaVM4cHBvMDE5WXNjL2VRSGNISlVxcVRXbDBHS29qUjZ0L3hyZDNDV0tzanNoUFFxd1o1VUNcbnJCS3JFMEVta1A3Q2wwc25NLzhFYU9uQ0xieUpVcmY5S1lIYW5RMzdXaS9zM25wb01KMkpCZCtiRDN4bTJvTUVcbmN2THJnUmxISTVMZStXeTJPemZ0enluQ2hWWmtLbWppS3JPWkU5NlZhN0F4U0swN1cycnZKbVllMUlLdmJYYy9cbkhkVUxKdUQxOXRJQ2k0UEFPR0I0VC9RTkZXTHdPUFdYU2twcDJtNjRGK0pYcVN6Mm5IbmU2R2pla2dyY3gwUjRcblBFVk95RUR3UmlqdFdHNTJvbTdyd3JKNExjdVM3QkdRVVp0Vmg1eXJVUUVIZDlGSXZLMXh0NzY2dE00TXV0a0RcbmhtaTFzTjZiQ3BGVkFnTUJBQUdqWURCZU1COEdBMVVkSXdRWU1CYUFGREwyaGZlTGtRa1BzM2FncGF5OEFBaFpcbnVNSzNNQjBHQTFVZERnUVdCQlNYSnJaeDlIdXE0em1rbVlXZSt2bmt6R0hwTHpBTUJnTlZIUk1CQWY4RUFqQUFcbk1BNEdBMVVkRHdFQi93UUVBd0lIZ0RBTkJna3Foa2lHOXcwQkFRc0ZBQU9DQVFFQWg1ZWFYTGpJRUpCZW11a1dcbm9qM2pLSzNtR29jVjlMNnBzVlowcmd5MThxWC9NUlVxMVdJT3cydXVQbDAvbTIrUTg5WC9zZG8vN1d3ZHVuaDhcbmx0WXk0Rll1aVlaWnJqN1B5MG43VThyYWRIbHRIN1dNYUFJSUwxbmppZ2EweEdpMnc2WElmTURxOVlyOUVXZ3VcblRLVVIzamMyNm92cHg5Q09FZXhIbzlZa1c3SUlPOEQrT21FZlRZRUpRcy9MUlZOQWtZVk1veFp2Q210M1BMWnlcbnNJWkhZTGdqY1B4SjIrL1RvY1B5TGJLL2did2VjbXhpekg4V2N5Ymp5LzlZZGhRWFM3UkVBQURPMXZBSlROV0tcbmdEb25EbkFxbmdaWm83K0d6RVdwS3VSRHd4QjNjN0JaNjJHRURldm95anVLMG1RN05KR3lHS2Iwa0hJN3Izb2dcbjZwcGVEdz09XG4tLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tXG4iLCJ3b3JrZXJfcG9vbF91bGlkIjoiMDFIMzFFMDRZOFNWVlpFWDA2VlhGWTY0SjAifQ=="
    export SPACELIFT_POOL_PRIVATE_KEY="LS0tLS1CRUdJTiBQUklWQVRFIEtFWS0tLS0tCk1JSUpRZ0lCQURBTkJna3Foa2lHOXcwQkFRRUZBQVNDQ1N3d2dna29BZ0VBQW9JQ0FRRGpvWDMxNUEwZmQwckQKYUN3WS9CcmVteWJLRitETk9zcEJEN3F2U0p2bVo0RnowRW5RMEQrR1A4TE5wYkx4a2FlYzAvWFRDL1dqZzdtTQpmVlFBbmhFam9mdGdpMERIWDU3U0Q0UXdTWnBTTXdWaU5DaEJqeXgrN1hsZE13WTBiU0VPSU9YTHNhSW1yYzFYCjlDR2ZkeTZPR0dxcUlZVE01U2w2cWZlYjdjdTFnYi9qS1lnSTM1NWFJWFZkajZPcUhiTmRlZHhDTzk4T2I2cXEKSE1qT2pKK2dkbVBiMERBYlhrait1R3JFV3NDbzdOWml2WEV1OW1IbHVDTjF1cnJSZzY2czRTR2EzbnhaVm85Zgp3cHJjY1NxRDFyWlZ6a3ZTOGZMa3lyRkN1RGFWK3JRQWRpSmNpSjZaZUN0cnJ6UndyVXIwb1ZTd1BVdXhINWR6CmovNXhlY2lrUHB0SWE1djVIa2lPaGUvT1lwZEY0a3ZLYWFOTmZXTEhQM2tCM0J5VktxazFwZEJpcUkwZXJmOGEKM2R3bGlySTdJVDBLc0dlVkFxd1NxeE5CSnBEK3dwZExKelAvQkdqcHdpMjhpVkszL1NtQjJwME4rMW92N041NgphRENkaVFYZm13OThadHFEQkhMeTY0RVpSeU9TM3Zsc3RqczM3Yzhwd29WV1pDcG80aXF6bVJQZWxXdXdNVWl0Ck8xdHE3eVptSHRTQ3IyMTNQeDNWQ3liZzlmYlNBb3VEd0RoZ2VFLzBEUlZpOERqMWwwcEthZHB1dUJmaVY2a3MKOXB4NTN1aG8zcElLM01kRWVEeEZUc2hBOEVZbzdWaHVkcUp1NjhLeWVDM0xrdXdSa0ZHYlZZZWNxMUVCQjNmUgpTTHl0Y2JlK3VyVE9ETHJaQTRab3RiRGVtd3FSVlFJREFRQUJBb0lDQUVhVXozck1FS21lRXFlT2lJWGl2ZTRpClM1L0VVYWN4UUg5MkFodlJ0czExY0xWWmMxbjFDSTEyL2M5SVBya2F3YzhtQmdZL29oWG1oVVVqbzBWaHZjeS8Kc0ROYVdtYTNwb1paMjFJaHNHRW1ndGZWZGxvRnEvVmJheE5UKyt1TG53RkRnQjF0NGVwK1g3cVM3MDRENVlLWAozWk1OTzZGUXVWRFluUGRUZjZPekxLMmlOaFVTU1lhRzgxNWthSW9hRllDNWhXdGdKeVRSeVNoZ0xuK2xLT1hYCmI5VTdzMzc0K0VkTEpZZm0zL0JCSjZTTU95a2xxbXRSY21WUjFoV2E4REdZeVJPOVF1OXNvSjQvdUViOExBT2YKTXdCZUxES25aUG8rUTBKOTNpY1pDbkZPTUE5aktWSks2YVBGT3N4cFgyR0ZHTDVnOHpSanFGRmo1N0NGNDRrOApOeG05cFdnRFVuN0Q0NDF2N3NlcWhjOUM3QzlEelBTRW5pZjRkZnJ3RHhyVCtiSm5mYVhnSE9ZOW5xbUlPS0F1CnBqMHhyZXkvWlVrVTR4akJxUDBOOEowbU9ITFVyT3Qwd1duaWxja2xBT0o1NmE3TXJkZG96ZEZwR0EvamNxNGQKa09tSlh1WDhoZ2F4UDluKzRHTXJFTmRZYmxnaWE0VTNnaS80Y2FNYkRrOFFNUU9tZHZQUDJDMThlUk1pcVJzQgpzWW1OcTZQaTNadlFOc0xGa1NvNjBha0Mxcy9TSWtEMFJyNitVMlBXclc3QVdnUzl0Y0o5eUJXQUxxODJoOENvCjNwbjJEbDVlMHpHUXdpRTd5SXNmN1c2dHQ4WnRqb1NoUmYwV0RmZkhKa1luemh3NnFLSkV1cmh5S2tmWWlXQ0gKWURkZ253TFV4QXVwK0VTUXBPV3RBb0lCQVFENlZlbndhc3V4S1N3TjVCMDI1RzFKaDJHUHdKVXJTYU9xc0xOeQpRUFF2KzAxSStjS3FyMXJYNjBIMExmOG5CRkYxU2xMRnNFcDRiR3NRSFExdE12NzQrbnhLVCtjNmRNNCtHWUl0CkpHYW9xWUpxZTNLOCtWTGFwUmJCQjFISVdFYmdSd1JYbjYzcE1UZTZ3eDk5TmpzNnJpbGJhRVQ4ZFRCSnBmN3EKblh1aHRCTDFJZWlpbWszSlhtc3ZScGM2STlDUnA1YVI2YkZyYkl6Q3ZCYlcyenJYSmpJQldFUDdyYXpuNmhDUQpjL2wxREhTNm9TcE9hcWc0eFdzeHVFVTRCV3RhM0NtTmhYOTNFOXRPTmxEK1hTOHlXeDJzZjZIVHlUa0xhcXdQCjIyemZ2YlVPckE2bnJsa3JQc2ozSGNmQXd4WUJVWWw1RW0vZ211NzZKblBCWWJBZkFvSUJBUURveUE4ckswTEIKL05Qb1JvaEZxUE1Dc2ppWG9NNVJEL256YUo1Wjljb1pFOG1jUXYvRk9kTTcyRzUrRzl6QnRSYWtjblpPK3Z5RQpqZFNuSkQwcHRIeVlTOXA2NlFzUVE5bVZSdE5Gc3ErdGZaS3ZCN1YrTU5id3hpMzh5RnNrQjZOOEsvQ2hLRVY1ClBIbW5OSHJ1cTRzZmtEc2N4V2x0bUdudXNkSGQvREk5d3lIcHJFdi9na2QvNDRvSkUzVnc1MEJLdy8zNTh0MmsKbTdnTmh4d05zc3E3aDFYbGh4bDJ6TmhENWlqWjBMbFczeXRkWjJMNmZxYUJYei9vVnQyc2grc1o3R1NZZTlwSApuM1ZhZkFSbnB1YXpxY1diYmg4Z1dreDNSZ2p5NGVoV3AyamdrcHp1MDFXa2M5TUJvTWxwVlprdWZORy85WjN2CnhqZm9xcmxaS0FBTEFvSUJBQ2JXM1l6bmhPTGZ1RzRQVGxrTjU4YllzbEpUVnRGNGcyUWdOamNyekxjRkRtQ2MKSDQvTDFSUmE4OGltdWtlYmErZit1QWpqNlNuMTZFWi91MjJOMC9GZEs1dDcraXdmbzBBUFJSc3I0cUdZYXh1SwpPNnNHSTh5NGdHZENjM1haL0dVZm41VFl1V3JNc0JEUjVUalFDVEI1aFFFaGxGSjIvQjd4R2pQY2F5b1RmajE2CkhWWGRDdVNMT2FZRUZjSjNmQXlkSzhkSHNyY3dDRWJPVjl6Tjlyc2F1ZmRyY21EQitXbWg3eC82WG1IQ3BQbXYKdDVpakE2YUxPcTVrSUprb2ZoZUN3UStyL3JMQzZldWdrY0JsUk1WVFRhOU52aFhWeW52eStPOGM1Qzl5aDN6WApSUTdQQmhhbmp4YUlFRTNmOXJJTnJINlVWYmRMVW5pTkxyaDZKNUVDZ2dFQkFOa0w2UERVZG51UU5Ubm53aHBKCnJNUy96bnE3Q29TVkEvY01mbEhkRnVLSkM3d3kwRzlpT200Ym9QTGZJZGhQOUZ2RENrTWNUU1YvWlYrdkw0UmEKY0s1RVUrTzB0WWNsN0pQK3BQSGc2V00zcWZTZm1IK2dKRm4rUDFUcXIraUpZc3RkNFJFekRvdzdjaWNRak90TApjZjR0S3FEcUJTS1dNWGZKdjZoZkJhMkc2M0VKSVJlTnJ3TTA4emtCTnNqZUpwbFA0OWtSdGM1TkQ3RTFZRmY1CmRJU2tiTmdHUHgwQlpVanlLdmJsWWxyNDNXTkxDZ1FNNFUzUnRUSDdCTmhoSnpwVnEzcHVTUm50T2F2ejVOdU0KeUtHTzA5ellNaGVsZXBUZjdXb2liOU9VWnZxMldiTnB3L29Cc1NaY2VGQko2dmxva3Q2TXN3V2w2ZTE4ZWpRQwpVdjhDZ2dFQVdPaDdJSGNGSlB3YXk2L3JwMGwvNW93QTNJTlZuWS9XMTBhZkV2SXVUQndPcEZ0TWJyRnFhM1pYClBFOTdZMHUxYklOTWhZVGZIcU96VXFxWGpiSFRnTHBrQVhpT3JVUVZxWGV5b0s5dTI4Y0w0OWRjUExtMmJwbXUKcEhvQ0x3SEUrOFVlY1pHZ1NCTzh1dmNQL2hOamFFWUVEbzk4MXpOOFl3cmgxbUFDaytqTTBXYmZ0WjMraXpXMgpUODIrL0xhRVZMcWlsdzBiUGp0Y0UvcXpocHkwQzVydmNpZmJhYU1HRld2NmNaWmVVKzNVRGxaRmFTTGEyRlVxCjQzTDM1dEw4RzNZZWcwcTFPVmxrZjFuejBhL01Wc0Q4SDFseVpkcFVUVEg2VGtmL1k1SkJKbXJkakg4VVliOHIKcVR4djA1cXJabjVISDMzRXd4UHNwU1EwanVpN2FnPT0KLS0tLS1FTkQgUFJJVkFURSBLRVktLS0tLQo="
  EOT
}

variable "disable_container_credentials" {
  type        = bool
  description = <<EOF
  If true, the run container will not be able to access the instance profile
  credentials by talking to the EC2 metadata endpoint. This is done by setting
  the number of hops in IMDSv2 to 1. Since the Docker container goes through an
  extra NAT step, this still allows the launcher to talk to the endpoint, but
  prevents the container from doing so.
  EOF
  default     = false
}

variable "domain_name" {
  type        = string
  description = "Top-level domain name to use for pulling the launcher binary"
  default     = "spacelift.io"
}

variable "ec2_instance_type" {
  type        = string
  description = "EC2 instance type for the workers. If an arm64-based AMI is used, this must be an arm64-based instance type."
  default     = "t3.micro"
}

variable "enabled_metrics" {
  type        = list(string)
  description = "List of CloudWatch metrics enabled on the ASG"
  default = [
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupMaxSize",
    "GroupMinSize",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances",
  ]
}

variable "create_iam_role" {
  default     = true
  description = "Determines whether an IAM role is created or to use an existing IAM role"
  type        = bool
}

variable "iam_role_arn" {
  default     = null
  description = "ARN of an existing IAM to use. Used `when create_iam_role` = `false`"
  type        = string
}

variable "min_size" {
  type        = number
  description = "Minimum numbers of workers to spin up"
  default     = 1
}

variable "max_size" {
  type        = number
  description = "Maximum number of workers to spin up"
  default     = 10
}

variable "poweroff_delay" {
  type        = number
  description = "Number of seconds to wait before powering the EC2 instance off after the Spacelift launcher stopped"
  default     = 15
}

variable "security_groups" {
  type        = list(string)
  description = "List of security groups to use"
  default     = [
    "sg-00fe573920373029d",
    ]
}

variable "additional_tags" {
  type        = map(string)
  description = "Additional tags to set on the resources"
  default     = {}
}

variable "volume_encryption" {
  type        = bool
  default     = false
  description = "Whether to encrypt the EBS volume"
}

variable "volume_size" {
  type        = number
  default     = 40
  description = "Size of instance EBS volume"
}

variable "vpc_subnets" {
  type        = list(string)
  description = "List of VPC subnets to use"
  default     = [
    "subnet-09eec3dbfc9dcb574",
    "subnet-0916370495811a2bf",
    "subnet-06ad35b8a4ae5e2d1",
    ]
}

variable "worker_pool_id" {
  type        = string
  description = "ID of the the worker pool. It is used for the naming convention of the resources."
  default     = "01H31E04Y8SVVZEX06VXFY64J0"
}

variable "enable_monitoring" {
  description = "Enables/disables detailed monitoring"
  type        = bool
  default     = true
}

variable "instance_refresh" {
  description = "If this block is configured, start an Instance Refresh when this Auto Scaling Group is updated based on instance refresh configration."
  type        = any
  default     = {}
}

locals {
  namespace = "sp5ft-${var.worker_pool_id}"
}
