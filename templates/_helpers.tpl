{{/*
Expand the name of the chart.
*/}}
{{- define "chef-ingest.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "chef-ingest.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- printf "%s" $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "chef-ingest.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "chef-ingest.labels" -}}
helm.sh/chart: {{ include "chef-ingest.chart" . }}
{{ include "chef-ingest.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "chef-ingest.selectorLabels" -}}
app.kubernetes.io/name: {{ include "chef-ingest.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "chef-ingest.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "chef-ingest.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
Return the appropriate apiVersion for cronjob.
*/}}
{{- define "chef-ingest.cronjob.apiVersion" -}}
{{- print "batch/v1" -}}
{{- end}}

{{/*
Create image registry, name and tag for a datahub component
*/}}
{{- define "chef-ingest.image" -}}
{{- $registry := .image.registry | default .imageRegistry -}}
{{ $registry }}/{{ .image.repository }}:{{ required "Global or specific tag is required" (.image.tag | default .version) -}}
{{- end -}}
