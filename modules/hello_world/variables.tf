variable "file_name" {
  description = "Name of the file to be created"
  default     = "foo.txt"
  type        = string
}

variable "content" {
  type        = string
  description = "File content"
  default     = "Hello World!"
}

variable "file_permission" {
  description = "File permission"
  default     = "0644"
  type        = string

}
