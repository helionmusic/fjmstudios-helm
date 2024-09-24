{{- /*
Set the names of the secrets
*/}}
{{- define "paperless.secrets.general" -}}
{{- printf "%s-general" (include "paperless.fullname" .) }}
{{- end }}

{{- define "paperless.secrets.admin" -}}
{{- printf "%s-admin" (include "paperless.fullname" .) }}
{{- end }}

{{- define "paperless.secrets.postgresql" -}}
{{- printf "%s-postgresql-auth" (include "paperless.fullname" .) }}
{{- end }}

{{- define "paperless.secrets.redis" -}}
{{- printf "%s-redis-auth" (include "paperless.fullname" .) }}
{{- end }}

{{- define "paperless.secrets.smtp" -}}
{{- printf "%s-smtp-auth" (include "paperless.fullname" .) }}
{{- end }}

{{- define "paperless.secrets.allauth" -}}
{{- printf "%s-allauth" (include "paperless.fullname" .) }}
{{- end }}

{{- /*
Build connection URI's
*/}}
{{- define "paperless.postgresql.host" -}}
{{- if .Values.paperless.postgresql.host -}}
{{- printf "%s" .Values.paperless.postgresql.host }}
{{- else -}}
{{- printf "%s-%s" .Release.Name "postgresql" }}
{{- end -}}
{{- end }}

{{- define "paperless.redis.host" -}}
{{- if .Values.paperless.redis.host -}}
{{- printf "%s" .Values.paperless.redis.host }}
{{- else -}}
{{- printf "%s-%s" .Release.Name "redis-master" }}
{{- end -}}
{{- end }}

{{- define "paperless.redis.uri" -}}
{{- printf "redis://%s:%s@%s:%d" .Values.paperless.redis.username .Values.paperless.redis.password (include "paperless.redis.host" .) (int .Values.paperless.redis.port) }}
{{- end }}

{{/*
  Detect or generate a secret key for the installation
*/}}
{{- define "paperless.secretkey" -}}
{{- if .Values.paperless.secretKey.value }}
{{- printf "%s" .Values.paperless.secretKey.value }}
{{ else }}
{{- randAlphaNum 32 -}}
{{- end }}
{{- end }}